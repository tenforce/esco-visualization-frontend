/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'visualization-tool-ui',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    contentSecurityPolicy: {
      'default-src': "'none'",
      'script-src': "'self' 'unsafe-eval' https://*.googleapis.com http://*.googleapis.com https://cdn.polyfill.io/v2/polyfill.min.js?features=Intl.~locale.en",
      'font-src': "'self' maxcdn.bootstrapcdn.com http://fonts.gstatic.com https://fonts.gstatic.com",
      'connect-src': "'self' http://*.googleapis.com https://*.googleapis.com",
      'img-src': "'self' *",
      'style-src': "'self' maxcdn.bootstrapcdn.com 'unsafe-inline' http://fonts.googleapis.com https://fonts.googleapis.com",
      'media-src': "'self'"
    },
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },
    switchTaxonomyOnClick: false,
    conceptSchemes:[
      {
        label: "Occupations",
        id: "6b73f82c-2543-4a72-a86d-e988869df5ca",
        // NB : This is another ugly hack, to make sure old files still link to the same platform... yay.
        ids: ["6b73f82c-2543-4a72-a86d-e988869df5ca","82df8ed9-ed3a-45ae-a14f-b89f44c6e243"],
        default: true,
        disable: false,
        showHierarchy: true,
        disableFilters: true
      },
      {
        label: "Skills",
        id: "c61aced6-0285-4da5-aa9e-ef09ba364f6e",
        // NB : This is another ugly hack, to make sure old files still link to the same platform... yay.
        ids: ["c61aced6-0285-4da5-aa9e-ef09ba364f6e","82df8ed9-ed3a-45ae-a14f-b89f44c6e243"],
        disable: false,
        showHierarchy: false,
        hierarchyMessage: "<i>The hierarchy tree for Skills has yet to be implemented but you can still search concepts</i>",
        disableFilters: true
      },
      {
        label: "NACE",
        id: "632D2D7A-913F-11E6-B7C5-BE9D457105DC",
        disable: true
      }
    ],


    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    }
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {

  }

  return ENV;
};
