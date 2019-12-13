<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:msxml="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxml" 
  xmlns:dc="http://purl.org/dc/elements/1.1/" 
  xmlns:atom="http://www.w3.org/2005/Atom" 
  xmlns:media="http://search.yahoo.com/mrss/" 
  xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" 
  xmlns:googleplay="http://www.google.com/schemas/play-podcasts/1.0"
  xmlns:content="http://purl.org/rss/1.0/modules/content/">

  <xsl:output method="xml" indent="yes" cdata-section-elements="description" encoding="utf-8" />

  <xsl:template match="episodes">
    <rss version="2.0">
      <channel>
        <title>Azure Lunch</title>
        <atom:link rel="self" type="application/rss+xml" href="https://azurelunchnz.azureedge.net/podcast/feed.rss"></atom:link>
        <itunes:summary>News and analysis of Microsoft Azure with a Kiwi perspective in bite-sized chunks.</itunes:summary>
        <googleplay:author>Daniel Larsen</googleplay:author>
        <itunes:author>Daniel Larsen</itunes:author>
        <googleplay:email>azlunch@outlook.com</googleplay:email>
        <itunes:owner>
            <itunes:name>Daniel Larsen</itunes:name>
            <itunes:email>azlunch@outlook.com</itunes:email>
        </itunes:owner>
        <itunes:explicit>no</itunes:explicit>
        <image>
          <url>https://azurelunchnz.azureedge.net/podcast/logo.png</url>
          <title>Azure Lunch</title>
          <link>https://github.com/DanielLarsenNZ/azure-lunch</link>
        </image>
        <itunes:image href="https://azurelunchnz.azureedge.net/podcast/logo.png"></itunes:image>
        <itunes:category text="Technology"></itunes:category>
        <description>News and analysis of Microsoft Azure with a Kiwi perspective in bite-sized chunks.</description>
        <link>https://github.com/DanielLarsenNZ/azure-lunch</link>
        <language>en</language>
        <pubDate><xsl:value-of select="pubDate" /></pubDate>
        <lastBuildDate><xsl:value-of select="pubDate" /></lastBuildDate>
        <xsl:apply-templates select="entities[media_medium='audio']">
          <xsl:sort select="RowKey" data-type="text" order="descending"/>
        </xsl:apply-templates>
      </channel>
    </rss>
  </xsl:template>

  <xsl:template match="entities">
    <item>
      <title>
        <xsl:value-of select="title" />
      </title>
      <itunes:title>
        <xsl:value-of select="title" />
      </itunes:title>
      <description>
        <xsl:value-of select="description" disable-output-escaping="yes" />
      </description>
      <content:encoded>
        <xsl:value-of select="description" disable-output-escaping="yes" />
      </content:encoded>
      <itunes:summary>
        <xsl:value-of select="summary" />
      </itunes:summary>
      <itunes:duration>
        <xsl:value-of select="media_duration" />
      </itunes:duration>
      <itunes:series>
        <xsl:value-of select="series" />
      </itunes:series>
      <itunes:episode>
        <xsl:value-of select="episode" />
      </itunes:episode>
      <link>
        <xsl:value-of select="webpage_link" />
      </link>
      <pubDate>
        <xsl:value-of select="publish_date" />
      </pubDate>
      <guid isPermaLink="false">
        <xsl:value-of select="uri" />
      </guid>
      <media:thumbnail height="720" width="960">
        <xsl:attribute name="url">
          <xsl:value-of select="media_thumbnail_url_960_720" />
        </xsl:attribute>
      </media:thumbnail>
      <xsl:variable name="media_url">
        <xsl:choose>
            <xsl:when test="media_url = ''"><xsl:value-of select="concat('https://azurelunch.azurefd.net/episodes/', media_file)" /></xsl:when>
            <xsl:when test="not(media_url)"><xsl:value-of select="concat('https://azurelunch.azurefd.net/episodes/', media_file)" /></xsl:when>
            <xsl:otherwise><xsl:value-of select="media_url" /></xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
      <media:group>
        <media:content expression="full">
          <xsl:attribute name="url"><xsl:value-of select="$media_url" /></xsl:attribute>
          <xsl:attribute name="duration">
            <xsl:value-of select="media_duration" />
          </xsl:attribute>
          <xsl:attribute name="filesize">
            <xsl:value-of select="media_filesize" />
          </xsl:attribute>
          <xsl:attribute name="type">
            <xsl:value-of select="media_type" />
          </xsl:attribute>
          <xsl:attribute name="medium">
            <xsl:value-of select="media_medium" />
          </xsl:attribute>
        </media:content>
      </media:group>
      <enclosure>
        <xsl:attribute name="url"><xsl:value-of select="$media_url" /></xsl:attribute>
        <xsl:attribute name="length">
          <xsl:value-of select="media_filesize" />
        </xsl:attribute>
        <xsl:attribute name="type">
          <xsl:value-of select="media_type" />
        </xsl:attribute>
      </enclosure>
      <dc:creator>Daniel Larsen</dc:creator>
      <itunes:author>Daniel Larsen</itunes:author>
      <category>
        <xsl:value-of select="category_1" />
      </category>
      <category>
        <xsl:value-of select="category_2" />
      </category>
      <category>
        <xsl:value-of select="category_3" />
      </category>
    </item>
  </xsl:template>
</xsl:stylesheet>