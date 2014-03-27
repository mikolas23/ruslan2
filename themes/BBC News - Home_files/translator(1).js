define(function() {

    var isObject = function(translation) {
        return Object.prototype.toString.call(translation) === '[object Object]';
    };

    var errors = {
        TRANSLATION_UNDEFINED:     'Translator Error: Translator expects a translation object as its first parameter',
        TRANSLATION_NOT_AN_OBJECT: 'Translator Error: Translator expects an object literal as its first parameter'
    };

    function Translator(translation, locale) {
        if (!translation) { throw errors.TRANSLATION_UNDEFINED; }
        if (!isObject(translation)) { throw errors.TRANSLATION_NOT_AN_OBJECT; }

        this.translation = translation;
        this.locale      = locale || 'en-GB';
    }
    Translator.prototype.get = function(key) {
        return this.translation[key] ? this.translation[key] : null;
    };
    Translator.prototype.getLocale = function() {
        return this.locale;
    };

    return Translator;
});