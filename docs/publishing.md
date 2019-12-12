# Production and Publishing

In the field I record with RØDE Lavalier microphones and the [SC6-L Mobile Interview Kit](http://www.rode.com/microphones/sc6-lik)
for iPhone. I upload the recording from my iPhone via OneDrive. Then it is available on my laptop as
a stereo audio file ready for post-production.

In "studio" environments (usually a meeting room) I use two [Behringer C-1 Studio Condenser Microphones](https://www.behringer.com/Categories/Behringer/Microphones/Condenser/C-1/p/P0226).
These are the cheapest Condenser microphones I could find; they are fine for what I do. I notice that 
one of the Behringers (the older one) is getting noisier with age. So invest more money in microphones
if you would like them to last. I use a [Yamaha Steinberg UR44 Audio Interface](https://www.steinberg.net/en/products/audio_interfaces/ur_series/models/ur44.html),
which I love, recording directly into an Audacity session.

## Post-production

I use [Audacity](https://www.audacityteam.org/). It's an outstanding audio editor for the price (a donation).
By the time I have an Audacity session open and ready to go I have one stereo audio file with the Interview
audio. Each microphone's recording is split (and panned) left and right in the stereo track, ready to
go.

### Noise reduction

The very first thing I do is apply **Noise reduction**. Before I start the interview I record a few seconds
of room noise for the Noise reduction profile. If the room is very noisy (conferences, cafes, etc) I
apply a small amount of noise reduction to help the vocals stand out. If the room is quiet (meeting rooms,
offices, areas with air conditioning noise) I use a lot more noise reduction.

    Noise reduction: 
        Noisy environment:  6db
        Quiet environment:  12db
    Sensitivity: 6.00
    Frequency smoothing: 3
    Noise: Reduce

### Roll off some bass and normalize

Next I apply the **Bass and Treble** effect:

    Bass:   -3.0db
    Treble:  0.0db
    Output:  0.0db

And then **Normalize**:

    Remove DC offset: Tick
    Normalize peak amplitude to: 0.0db
    Normalize stereo channels independently: Untick

Now I trim and edit the interview. I do this before I split the tracks to mono to make it easier to edit.

### Sub-mix

Once I'm happy with the interview edits I **Split Stereo to Mono** and **pan** the Interviewer track
30% left and pan the Guest to centre. I then sub-mix down to a new Stereo Track ready for compression
which I want to be on the overall Stereo mix.

### Compression and limiting

Finally I add compression and limiting. This will really help the voices cut through the background and
make it easier for people to listen on ear buds and in noisy environments.

    Compressor:
        Threshold: -12db to -20db
        Noise floor: -40db
        Ratio: 4:1
        Attack: 0.2 secs
        Release: 1.0 secs
        Make-up gain for 0db after compressing: Ticked
        
    Limiter: 
        Soft limit
        Input gains: 3db to 6db
        Limit to: 0db
        Hold: 10ms
        Apply Make-up gain: Yes

# Publishing

1. Copy a `./podcasts/(episode).md` file and edit the relevant details.
1. git add, commit, push
1. Add a new row in the `episodes` table
    1. Categories: Technology, Tech News, Microsoft Azure
    1. Description: `<![CDATA[ ... ]]>`
    1. Id: `s2e08`
    1. Medium: `audio | video`
    1. Media_thumbnail_url_960_720: `https://azurelunchnz.azureedge.net/podcasts/s2e08_960.jpg`
    1. Media_type: `audio/mpeg`
    1. Media_url: Only use for URLs that need to be fully qualifed, otherwise use `media_file`
    1. publish_date: `(Get-Date).ToUniversalTime().ToString('r')`
    1. Summary: Plain text version. 1 or two paras.
    1. URI & webpage_link: https://github.com/DanielLarsenNZ/azure-lunch/blob/master/podcasts/s2e08.md
    1. Media_file: `azure-lunch-s2e08.mp3`
1. Ensure assets are uploaded to storage account `azurelunchaue`:
    1. mp3/mp4
    1. thumbnail
1. Trigger the Logic App
1. Get <https://azurelunchnz.azureedge.net/podcast/feed.rss?v=2159> (bust the cache with the query string)
1. Check the new links
1. Check `CacheControl` property on feed.rss blob: `max-age=3600`
1. Test the feed: <https://podba.se/validate/?url=https://azurelunchnz.azureedge.net/podcast/feed.rss?v=2159>
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

<https://podba.se/validate/>