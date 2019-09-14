# Post-production and Publishing

## Post-production

On voice:

1. Normalise (if needed)
1. Bass -3db
1. De-noise 12db, 6.00, 3 (if needed)
1. Compressor: Threshold = -12db to -20db, Noise floor = -40db, Ratio = 4:1, Attack = 0.2 secs, Release 
   = 1.0 secs, Make-up gain for 0db after compressing = ticked.
1. Limiter: Soft limit, Input gains = 3db to 6db, Limit to 0db, Hold = 10ms, Apply Make-up gain = Yes
1. Split Stereo to Mono
1. Pan IV between 20% to 30% left, pan Guest 20% - 30% right

# Publishing

1. Copy a `./podcasts/(episode).md` file and edit the relevant details.
1. git add, commit, push
1. Add a new row in the `episodes` table
1. Ensure assets are uploaded to storage account `azurelunchaue`:
   1. mp3/mp4
   1. thumbnail
1. Trigger the Logic App
1. Get <https://azurelunchnz.azureedge.net/podcast/feed.rss?v=2159> (bust the cache with the query string)
1. Check the new links
1. Check `CacheControl` property on feed.rss blob: `max-age=3600`
1. Wait an hour and then refresh the Apple feed

```powershell
# In PowerShell: to get the current GMT date time in ISO format: 
(Get-Date).ToUniversalTime().ToString('r')
```

## Links

Working with xml in Logic Apps: <https://integration.team/2017/07/14/working-xml-logic-apps/>

XSLT Basic Example: <https://developer.mozilla.org/en-US/docs/Web/API/XSLTProcessor/Basic_Example>

XML Tools: <https://marketplace.visualstudio.com/items?itemName=DotJoshJohnson.xml>

Getting `xml()` function to work: <https://stackoverflow.com/a/44179366/610731>

Setting Cache-Control headers in Blob storage / CDN: <https://docs.microsoft.com/en-us/azure/cdn/cdn-manage-expiration-of-blob-content#setting-cache-control-headers-by-using-other-methods>