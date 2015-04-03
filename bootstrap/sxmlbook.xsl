<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.2.1_4                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-14 K.Sonohara All Right Reserved.                 -->
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
	omit-xml-declaration="no"
/>
	<!-- インポート -->
	<xsl:include href="include/constant.xsl"/>
	<xsl:include href="include/params.xsl"/>
	<xsl:include href="include/id.xsl"/>
	<xsl:include href="include/xhtml.xsl"/>
	<xsl:include href="include/header.xsl"/>
	<xsl:include href="include/summary.xsl"/>
	<xsl:include href="include/indexes.xsl"/>
	<xsl:include href="include/items.xsl"/>
	<xsl:include href="include/footer.xsl"/>

	<!-- ================================================================================= -->
	<!-- ー -->
	<xsl:template match="/sxmlbook">
		<xsl:text disable-output-escaping="yes">
&lt;!DOCTYPE html&gt;

</xsl:text>
		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{./@lang}" lang="{./@lang}"><xsl:text>
</xsl:text>
			<xsl:call-template name="xhtml" />
<xsl:text>
</xsl:text>
			<body onload=" mikan.page.load(); " onunload=" mikan.page.unload(); ">
				<!-- ヘッダー -->
				<xsl:call-template name="header" />

				<!-- サマリー -->
				<xsl:if test="$top.indexes = '0'">
					<br />
					<br />
				</xsl:if>
				<xsl:call-template name="summary" />

				<!-- 目次 -->
				<xsl:if test="$top.indexes = '1'">
					<xsl:call-template name="index_menus" />
				</xsl:if>

				<!-- 内容 -->
				<div class="container">
					<xsl:call-template name="items" />
				</div>

				<!-- フッダー -->
				<xsl:call-template name="footer" />

				<xsl:call-template name="xhtmlend" />
			</body><xsl:text>
</xsl:text>
		</html>
	</xsl:template>
</xsl:stylesheet>
