/********************** IMPORTANT README ********************************/
//This file is due for deletion once the velocity template has been updated and released on the
//journalism stack. This file should mirror the file at the location
//tabloid/webapp/static/js/module/liveEventPromo.js
/************************************************************************/
/*global define:true */
define([
  'config',
  'module/bootstrap',
  'module/poller',
  'module/timestamp'
], function(
  config,
  news,
  Poller,
  Timestamp
) {

  return {

    pollingUrl: function(pollingHost, config, channel) {
      if (typeof config === "undefined") {
        config = {
          service: 'nfp'
        };
      }

      return pollingHost + "/" + config.service + "/walkietalkie/latest_index_asset/" + channel;
    },

    handleSuccess: function() {
        if (config.features.liveeventcomponent) {
            this.init(config.pollingHost, null);
        }
    },

    init: function(pollingHost, newEntryCallback) {

      var $ = news.$;
      var self = this;

      $('[data-channel]').each(function() {

        var inner   = $(".article-inner", this);
        var summary = $(".live-event-summary", inner);
        var entries = $(".live-event-entries", inner);
        var channel = $(this).attr("data-channel");
        var poller  = new Poller(30000);
        var current = "";
        var url = self.pollingUrl(
              pollingHost,
              config,
              channel
            );

        poller.startCacheBusting();
        poller.setUrl(url);
        poller.startPolling({
          success: function(data) {

            if (entries.html().length === 0) {
              summary.remove();
            }

            if (data.entryId !== current) {

              // Parse xmlschema date
              var timeago = null;

              if (data.createTime) {

                var bits = data.createTime.split(/[\-T:]/g);
                var date = new Date(bits[0], bits[1]-1, bits[2]);

                date.setHours(bits[3], bits[4], bits[5]);

                var diff = ((new Date()).getTime() - date.getTime()) / 1000;
                var ts = new Timestamp(null);
                var ago = ts.timeAgoInWords(diff);

                if (ago) {
                  timeago = '<em class="entry-timestamp">' + ago + '</em>';
                }

              }

              if (timeago) {
                var firstTagEnds = data.html.indexOf(">") + 1;
                var before = data.html.substring(0, firstTagEnds);
                var after  = data.html.substring(firstTagEnds);
                data.html  = before + timeago + after;
              }

              if (newEntryCallback) {
                newEntryCallback(entries, data.html);
              } else {
                entries.css('opacity', '0');
                setTimeout(function() {
                  entries.html(data.html).css('opacity', '1');
                }, 1200);
              }

              current = data.entryId;

              return url;

            }
          },

          error : function() {
            if (entries.html().length === 0) {
              entries.css('display', 'none');
              summary.css('visibility', 'visible');
              poller.stopPolling();
            }
          }

        });
      });
    }
  };
});
