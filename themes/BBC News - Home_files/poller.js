define([
    'module/bootstrap'
], function(
    news
) {

    var Poller = function(updateFrequency, timeout) {
        if (Object.prototype.toString.call(updateFrequency) !== '[object Number]') {
            throw new Error('Update frequency must be a number');
        }
        this.updateFrequency = updateFrequency;
        this.polling = false;
        this.timeout = timeout || 10000;
        this.cacheBusting = false;
    };

    function appendCacheBusterString(url) {
        var cacheBusterString = "cachebuster=" +  Math.floor((new Date()).getTime() / 1000);
        if (url.indexOf("?") > 0) {
            return url + "&" + cacheBusterString;
        }
        else {
            return url + "?" + cacheBusterString;
        }
    }

    function getPollPeriod(data) {
        var pollPeriod = false;
        if (
            ('clientdirective' in data) &&
            ('pollPeriod' in data.clientdirective)
        ) {
            pollPeriod = data.clientdirective.pollPeriod;
        }
        if ('pollPeriod' in data) {
            pollPeriod = data.pollPeriod;
        }
        return pollPeriod;
    }

    Poller.prototype = {

        setUrl: function(url) {
          this.url = url;
        },

        buildUrl: function() {
          return this.cacheBusting ? appendCacheBusterString(this.url) : this.url;
        },

        setPollingTime: function(updateFrequency) {
            this.updateFrequency = updateFrequency;
        },

        startPolling: function(options) {
            this.polling = true;
            this.options = options || {};
            this.poll();
        },

        stopPolling: function() {
            this.polling = false;
        },

        poll: function() {
            if (this.polling) {
                var that = this;
                news.$.ajax({
                    url: that.buildUrl(),
                    dataType: "jsonp",
                    timeout: this.timeout,
                    jsonpCallback: 'callback',
                    method: "get",
                    success: function(data) {
                        var pollPeriod = getPollPeriod(data);

                        if (pollPeriod) {
                            that.updateFrequency = pollPeriod;
                            that.rePoll();
                        } else {
                            that.stopPolling();
                        }

                        if (that.options.success) {
                            var url = that.options.success(data);
                            that.url = url || that.url;
                        }
                    },
                    error: function(e) {
                        if (that.options.error) {
                            that.options.error(e);
                        }

                        that.rePoll();
                    }
                });
            }
        },

        rePoll: function() {

            var that = this;
            window.setTimeout(function() {
                that.poll();
            }, that.updateFrequency);

        },

        stopCacheBusting: function() {
            this.cacheBusting = false;
        },

        startCacheBusting: function() {
            this.cacheBusting = true;
        }

    };

    return Poller;

});
