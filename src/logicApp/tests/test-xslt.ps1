$xslt = "$($PSScriptRoot)/../feed-rss-novid.xslt"
$input = "$($PSScriptRoot)/feed-rss2.xml"
$output = "$($PSScriptRoot)/feed-rss-novid.output.rss.xml"


$XSLInputElement = New-Object System.Xml.Xsl.XslCompiledTransform;
$XSLInputElement.Load($xslt)
$XSLInputElement.Transform($input, $output)