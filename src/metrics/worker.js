addEventListener('fetch', event => {
    event.respondWith(handle(event.request))
})

const _ = require("applicationinsights")

appInsights.setup({ instrumentationKey: "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxx" });
appInsights.start();

function trackEvent(name) {
    try {
        console.log(`metrics:trackEvent:${name}`);
        appInsights.defaultClient.trackEvent({ name: name });
    } catch (e) {
        // log and continue
        console.error(e);
    }
}

async function handleRequest(request) {
    console.log('Got request', request)
  const modifiedRequest = new Request('https://msimpson.co.nz');
  return fetch(modifiedRequest);
  }