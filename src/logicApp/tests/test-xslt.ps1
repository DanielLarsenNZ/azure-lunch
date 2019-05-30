$xslt = "$($PSScriptRoot)/../feed-rss.xslt"
$input = "$($PSScriptRoot)/feed-rss2.xml"
$output = "$($PSScriptRoot)/feed-rss2.output.rss.xml"


$XSLInputElement = New-Object System.Xml.Xsl.XslCompiledTransform;
$XSLInputElement.Load($xslt)
$XSLInputElement.Transform($input, $output)