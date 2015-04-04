<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.3.0_0                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-15 K.Sonohara All Right Reserved.                 -->
<!--   Code released under [Mozilla Public License, version 2.0]            -->
<!-- ______________________________________________________________________ -->

<xsl:stylesheet
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xhtml="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
>

<xsl:output
	method="html"
	encoding="UTF-8"
	indent="no"
	standalone="yes"
	omit-xml-declaration="yes"
	exclude-result-prefixes="#default xhtml"
/>
	<!-- インポート -->
	<xsl:include href="include/constant.xsl"/>
	<xsl:include href="include/params.xsl"/>
	<xsl:include href="include/id.xsl"/>
	<xsl:include href="include/indexes.xsl"/>
	<xsl:include href="include/header.xsl"/>
	<xsl:include href="include/summary.xsl"/>
	<xsl:include href="include/items.xsl"/>

	<!-- ================================================================================= -->
	<!-- ー -->
	<xsl:template match="/sxmlbook">
		<div>
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
			<xsl:call-template name="items" />
		</div>
	</xsl:template>
</xsl:stylesheet>
