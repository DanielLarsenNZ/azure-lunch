addEventListener('fetch', event => {
    event.respondWith(handle(event.request))
})

const _ = require("applicationinsights-js");

var snippet = {   
    config: {   
        instrumentationKey: "393b3c89-feb0-4a30-be29-899686aaae90"   
    }   
};   
var init = new Microsoft.ApplicationInsights.Initialization(snippet);   
var appInsights = init.loadAppInsights();   
appInsights.trackPageView();   

async function handleRequest(request) {
    console.log('Got request', request)
    appInsights.trackPageView();  
  const modifiedRequest = new Request('https://msimpson.co.nz');
  return fetch(modifiedRequest);
  }