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

	<!-- ================================================================================= -->
	<!-- ー -->
	<xsl:template match="/sxmlbook">
		<!-- 目次 -->
		<div class="panel panel-warning">
		<div class="panel-heading">目次</div>


		<xsl:variable name="u">
			<xsl:choose>
				<xsl:when test="$html.index.prefix=''">#</xsl:when>
				<xsl:otherwise><xsl:value-of select="$html.index.prefix" /></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<div class="list-group">
			<xsl:for-each select="./index">
				<xsl:variable name="i" select="@name" />
				<xsl:variable name="n" select="key('itemid', $i)" />

				<xsl:variable name="u2">
					<xsl:choose>
						<xsl:when test="$html.index.prefix=''">#</xsl:when>
						<xsl:otherwise><xsl:value-of select="$u" /><xsl:value-of select="$i" />#</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<a class="list-group-item" href="{$u}{$i}">
					<xsl:value-of select="normalize-space($n/title)" />
				</a>
				<xsl:for-each select="./index">
					<xsl:variable name="ii" select="@name" />
					<xsl:variable name="nn" select="key('itemid', $ii)" />

					<a class="list-group-item" href="{$u2}{$ii}">
						<span class="glyphicon glyphicon-chevron-right text-warning"><xsl:text> </xsl:text></span><xsl:text> </xsl:text>
						<xsl:value-of select="normalize-space($nn/title)" />
					</a>
				</xsl:for-each>
			</xsl:for-each>
		</div>
		</div>
	</xsl:template>
</xsl:stylesheet>
