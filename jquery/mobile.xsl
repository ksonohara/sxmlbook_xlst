<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.2.0_0                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-12 K.Sonohara All Right Reserved.                 -->
<!-- ______________________________________________________________________ -->

<xsl:stylesheet
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
>

<xsl:output
	method="xml"
	encoding="UTF-8"
	indent="yes"
/>
	<!-- インポート -->
	<xsl:include href="include/constant.xsl"/>
	<xsl:include href="include/params.xsl"/>
	<xsl:include href="include/id.xsl"/>
	<xsl:include href="include/xhtml.xsl"/>
	<xsl:include href="include/indexes.xsl"/>
	<xsl:include href="include/items.xsl"/>

	<!-- ================================================================================= -->
	<!-- ー -->
	<xsl:template match="/sxmlbook">
		<xsl:text disable-output-escaping="yes">
&lt;!DOCTYPE html&gt;

</xsl:text>

		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{./@lang}" lang="{./@lang}">
			<xsl:call-template name="xhtml" />

			<body>
				<!-- 目次 -->
				<xsl:call-template name="indexes" />

				<!-- 内容 -->
				<xsl:call-template name="items" />
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
