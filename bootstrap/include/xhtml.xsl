<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.3.0_0                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-15 K.Sonohara All Right Reserved.                 -->
<!--   Code released under [Mozilla Public License, version 2.0]            -->
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--   HTML ヘッダー                                                        -->
<!-- ______________________________________________________________________ -->

<xsl:stylesheet
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
>
	<!-- ================================================================================= -->
	<!-- HTMLヘッダ -->
	<xsl:template name="xhtml">
		<head>
			<meta charset="UTF-8" />
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<meta http-equiv="Content-Style-Type" content="text/css" />
			<meta content="ja" http-equiv="content-language" />
			<meta content="index, follow" http-equiv="robots" />

			<meta http-equiv="X-UA-Compatible" content="IE=edge" />
			<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=2" />

			<meta name="generator" content="{$sxmlbook_name} XSLT {$sxmlbook_version}" />
			<meta name="author" content="{/sxmlbook/info/copyright}" />
			<meta name="description" content="{/sxmlbook/info/description}" />

			<xsl:choose>
				<xsl:when test="$css_jquery != ''"><link rel="stylesheet" type="text/css" href="{$css_jquery}" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$css_jquery_ui != ''"><link rel="stylesheet" type="text/css" href="{$css_jquery_ui}" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$css_jquery_colorbox != ''"><link rel="stylesheet" type="text/css" href="{$css_jquery_colorbox}" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$css_bootstrap != ''"><link rel="stylesheet" type="text/css" href="{$css_bootstrap}"/></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$css_bootstrap_theme != ''"><link rel="stylesheet" type="text/css" href="{$css_bootstrap_theme}"/></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$css_fa != ''"><link rel="stylesheet" type="text/css" href="{$css_fa}"/></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$css_metismenu != ''"><link rel="stylesheet" type="text/css" href="{$css_metismenu}"/></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$css_morris != ''"><link rel="stylesheet" type="text/css" href="{$css_morris}"/></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$css_admin != ''"><link rel="stylesheet" type="text/css" href="{$css_admin}"/></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$css_multiselect != ''"><link rel="stylesheet" type="text/css" href="{$css_multiselect}"/></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$css_mikan != ''"><link rel="stylesheet" type="text/css" href="{$css_mikan}"/></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>

			<xsl:choose>
				<xsl:when test="$js_jquery != ''"><script type="text/javascript" src="{$js_jquery}">;</script></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>

			<xsl:choose>
				<xsl:when test="$js_jquery_ui != ''"><script type="text/javascript" src="{$js_jquery_ui}">;</script></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>

			<xsl:comment>
<![CDATA[[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]]]>
</xsl:comment>

			<title><xsl:value-of select="$document_title" /></title>
		</head>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- HTMLヘッダ -->
	<xsl:template name="xhtmlend">
		<xsl:choose>
			<xsl:when test="$js_jquery_colorbox != ''"><script type="text/javascript" src="{$js_jquery_colorbox}">;</script></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>

		<xsl:choose>
			<xsl:when test="$js_bootstrap != ''"><script type="text/javascript" src="{$js_bootstrap}">;</script></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>

		<xsl:choose>
			<xsl:when test="$js_morris != ''"><script type="text/javascript" src="{$js_morris}">;</script></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>

		<xsl:choose>
			<xsl:when test="$js_metismenu != ''"><script type="text/javascript" src="{$js_metismenu}">;</script></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>

		<xsl:choose>
			<xsl:when test="$js_multiselect != ''"><script type="text/javascript" src="{$js_multiselect}">;</script></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>

		<xsl:choose>
			<xsl:when test="$js_mikan != ''">
				<script type="text/javascript">
					var MIKAN_JS_ROOT = '<xsl:value-of select="$js_dir" />';
					var MIKAN_IMAGE_ROOT = '<xsl:value-of select="$image_dir" />';
					var MIKAN_HTDOCS_ROOT = '<xsl:value-of select="$html_dir" />';
					var mikan = {};
					mikan.resouce = {};
				</script>
				<script type="text/javascript" src="{$js_mikan}">;</script>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
