<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.2.0_0                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-12 K.Sonohara All Right Reserved.                 -->
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--   XHTML HTMLヘッダ                                                     -->
<!-- ______________________________________________________________________ -->

<xsl:stylesheet
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
>
	<!-- ================================================================================= -->
	<!-- HTMLヘッダ -->
	<xsl:template name="xhtml">
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<meta http-equiv="Content-Style-Type" content="text/css" />
			<meta content="ja" http-equiv="content-language" />
			<meta content="index, follow" http-equiv="robots" />

			<meta name="generator" content="sXMLBook XSLT ${sxmlbook.version}" />
			<meta name="author" content="{/sxmlbook/info/copyright}" />
			<meta name="description" content="{/sxmlbook/info/description}" />

			<meta name="viewport" content="width=device-width, initial-scale=1" />

			<xsl:variable name="dir">
				<xsl:choose>
					<xsl:when test="$html.dir != ''"><xsl:value-of select="$html.dir" /></xsl:when>
					<xsl:otherwise>./</xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:variable name="css_jquery">
				<xsl:choose>
					<xsl:when test="$css.jquery != ''"><xsl:value-of select="$css.dir" /><xsl:value-of select="$css.jquery" /></xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="css_jquery_mobile">
				<xsl:choose>
					<xsl:when test="$css.jquery.mobile != ''"><xsl:value-of select="$css.dir" /><xsl:value-of select="$css.jquery.mobile" /></xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:variable name="js_jquery">
				<xsl:choose>
					<xsl:when test="$js.jquery != ''"><xsl:value-of select="$js.dir" /><xsl:value-of select="$js.jquery" /></xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="js_jquery_mobile">
				<xsl:choose>
					<xsl:when test="$js.jquery.mobile != ''"><xsl:value-of select="$js.dir" /><xsl:value-of select="$js.jquery.mobile" /></xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:choose>
				<xsl:when test="$css_jquery_mobile != ''"><link rel="stylesheet" type="text/css" href="{$css_jquery_mobile}" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>

			<xsl:choose>
				<xsl:when test="$css_jquery != ''"><link rel="stylesheet" type="text/css" href="{$css_jquery}" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>

			<xsl:choose>
				<xsl:when test="$js_jquery != ''"><script type="text/javascript" src="{$js_jquery}">;</script></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$js_jquery_mobile != ''"><script type="text/javascript" src="{$js_jquery_mobile}">;</script></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>

			<title>
				<xsl:if test="$html.title != ''"><xsl:value-of select="$html.title" /> [</xsl:if>
				<xsl:value-of select="./info/title" />
				<xsl:if test="$html.title != ''">]</xsl:if>
				<xsl:if test="$html.index.name != ''">
					 - 
					<xsl:variable name="n" select="key('itemid', $html.index.name)" />
					<xsl:value-of select="normalize-space($n/title)" />
				</xsl:if>
			</title>
		</head>
	</xsl:template>
</xsl:stylesheet>
