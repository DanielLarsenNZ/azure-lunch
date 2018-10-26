<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
  xmlns:msxml="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxml" 
  xmlns:dc="http://purl.org/dc/elements/1.1/" 
  xmlns:atom="http://www.w3.org/2005/Atom" 
  xmlns:media="http://search.yahoo.com/mrss/" 
  xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd" 
  xmlns:googleplay="http://www.google.com/schemas/play-podcasts/1.0">
  
  <xsl:output method="xml" indent="yes" cdata-section-elements="description" encoding="utf-8"/>

  <xsl:template match="episode">
    <item>
      <title>
        <xsl:value-of select="title" />
      </title>
      <description>
        <xsl:value-of select="description" />
      </description>
      <itunes:summary>
        <xsl:value-of select="summary" />
      </itunes:summary>
      <itunes:duration>
        <xsl:value-of select="media_duration" />
      </itunes:duration>
      <link>
        <xsl:value-of select="webpage_url" />
      </link>
      <pubDate>
        <xsl:value-of select="publish_date" />
      </pubDate>
      <guid isPermaLink="false">
        <xsl:value-of select="uri" />
      </guid>
      <media:thumbnail height="720" width="960">
        <xsl:attribute name="url">
          <xsl:value-of select="thumbnail_url_960_720" />
        </xsl:attribute>
      </media:thumbnail>
      <media:group>
        <media:content expression="full">
          <xsl:attribute name="url">
            <xsl:value-of select="media_url" />
          </xsl:attribute>
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
        <xsl:attribute name="url">
          <xsl:value-of select="media_url" />
        </xsl:attribute>
        <xsl:attribute name="length">
          <xsl:value-of select="media_filesize" />
        </xsl:attribute>
        <xsl:attribute name="type">
          <xsl:value-of select="media_type" />
        </xsl:attribute>
      </enclosure>
      <dc:creator>Daniel Larsen, Matt Simpson</dc:creator>
      <itunes:author>Daniel Larsen, Matt Simpson</itunes:author>
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