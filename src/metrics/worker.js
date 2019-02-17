addEventListener('fetch', event => {
    event.respondWith(handle(event))
})

async function handle(event) {
    var request = event.request;
    // https://msimpson.co.nz/podcasts/se104.mp3 ->
    // https://azurelunchnz.azureedge.net/podcasts/se104.mp3

    console.log('Got request', request)

    // get and validate episode
    var url = request.url.replace('https://msimpson.co.nz/podcasts/', 'https://azurelunchnz.azureedge.net/podcasts/');
    var episode = url.replace('https://azurelunchnz.azureedge.net/podcasts/', '');
    if (episode.length == 0) {
        console.log("Not a valid URL - No episode name found")
        return Response.error();
    }

    track(event)

    return Response.redirect(url, 302);

}

async function track(event) {
    var body = {


        "PartitionKey": "mypartitionkey",
        "RowKey": "myrowkey"
    }
    try {
        response = await fetch('https://azurelunchaue.table.core.windows.net/metrics', {
            method: 'POST',
            headers: {"Authorization": "", "x-ms-date": Date.UTC(), },
            body: JSON.stringify(event),
        });
    } catch (error) {
        console.log("Error - unable to post to table storage")
    }
}