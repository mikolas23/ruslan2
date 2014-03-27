define('translator', [
    'module/translator',
    'config',
    'translation'
], function(
    Translator,
    config,
    translation
) {
    return new Translator(translation, config.locale);
});
