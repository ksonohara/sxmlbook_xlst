<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.2.1_4                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-14 K.Sonohara All Right Reserved.                 -->
<!-- ______________________________________________________________________ -->

<xsl:stylesheet
	xmlns="http://www.w3.org/1999/xhtml"
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
	<xsl:include href="include/summary.xsl"/>
	<xsl:include href="include/items.xsl"/>

	<!-- ================================================================================= -->
	<!-- ー -->
	<xsl:template match="/sxmlbook">
		<div class="col-xs-12">
			<!-- サマリー -->
			<xsl:call-template name="summary" />

			<xsl:variable name="u">
				<xsl:choose>
					<xsl:when test="$html.index.prefix=''">#</xsl:when>
					<xsl:otherwise><xsl:value-of select="$html.index.prefix" /></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<!-- 目次 -->
			<div class="panel panel-warning">
				<div class="panel-heading">目次</div>
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
		</div>
	</xsl:template>
</xsl:stylesheet>
