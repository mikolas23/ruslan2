/*global define */
/*jslint undef: false */
/* jshint -W117 */
define([
    'vendor/events/eventEmitter',
    'jquery-1',
    'config'
], function(
    placeholder,
    jquery,
    config
) {
    var pubsub = new EventEmitter();
    var bootstrap = {
        pubsub: pubsub,
        $: jquery,
        config: config
    };
    return bootstrap;
});
