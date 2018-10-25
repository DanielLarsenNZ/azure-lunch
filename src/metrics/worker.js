import "applicationinsights-js";

// init Application insights
var snippet = {
    config: {
        instrumentationKey: "393b3c89-feb0-4a30-be29-899686aaae90"
    }
};
var init = new Microsoft.ApplicationInsights.Initialization(snippet);
var appInsights = init.loadAppInsights();

addEventListener('fetch', event => {
    event.respondWith(handle(event))
})

async function handle(event) {
    var request = event.request;
    // https://msimpson.co.nz/podcasts/se104.mp3 ->
    // https://azurelunchnz.azureedge.net/podcasts/se104.mp3

    console.log('Got request', request)
    appInsights.trackPageView();
    //const modifiedRequest = new Request('https://msimpson.co.nz');
    //return fetch(modifiedRequest);

    // validate URL
    
    if (!request.url.startsWith('https://msimpson.co.nz/podcasts/')) {
        console.log("Not a valid URL - /podcasts/ not found");
        return Response.error();
        // event.respondWith(
        //     new Response.error()
        // );
        // return;
    }

    // get and validate episode
    var url = request.url.replace('https://msimpson.co.nz/podcasts/', 'https://azurelunchnz.azureedge.net/podcasts/');
    var episode = url.replace('https://azurelunchnz.azureedge.net/podcasts/', '');
    if (episode.length == 0) {
        console.log("Not a valid URL - No episode name found")
        return Response.error();
        // event.respondWith(
        //     new Response.error()
        // );
        // return;
    }

    // track the download
    appInsights.trackEvent("podcasts/download");
    appInsights.trackEvent("podcasts/download/" + episode);

    return Response.redirect(url, 302);

}