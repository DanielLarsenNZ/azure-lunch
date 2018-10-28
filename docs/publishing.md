# Publishing

1. Add a new row in the `episodes` table
1. Ensure assets are uploaded to storage account `azurelunchaue`:
   1. mp3/mp4
   1. thumbnail
1. Trigger the Logic App
1. Get <https://azurelunchnz.azureedge.net/podcast/feed.rss?v=2159> (bust the cache with the query string)
1. Check the new links
1. Wait an hour (feed.rss TTL is 3600) and then refresh the Apple feed

## Links

Working with xml in Logic Apps: <https://integration.team/2017/07/14/working-xml-logic-apps/>

XSLT Basic Example: <https://developer.mozilla.org/en-US/docs/Web/API/XSLTProcessor/Basic_Example>

XML Tools: <https://marketplace.visualstudio.com/items?itemName=DotJoshJohnson.xml>

Getting `xml()` function to work: <https://stackoverflow.com/a/44179366/610731>
