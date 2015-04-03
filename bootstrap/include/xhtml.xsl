<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.2.1_4                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-14 K.Sonohara All Right Reserved.                 -->
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

			<meta http-equiv="X-UA-Compatible" content="IE=edge" />
			<meta name="viewport" content="width=device-width, initial-scale=1" />

			<meta name="generator" content="sXMLBook XSLT ${sxmlbook.version}" />
			<meta name="author" content="{/sxmlbook/info/copyright}" />
			<meta name="description" content="{/sxmlbook/info/description}" />

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
			<xsl:variable name="css_jquery_ui">
				<xsl:choose>
					<xsl:when test="$css.jquery.ui != ''"><xsl:value-of select="$css.dir" /><xsl:value-of select="$css.jquery.ui" /></xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="css_bootstrap">
				<xsl:choose>
					<xsl:when test="$css.bootstrap != ''"><xsl:value-of select="$css.dir" /><xsl:value-of select="$css.bootstrap" /></xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="css_bootstrap_dropmenu">
				<xsl:choose>
					<xsl:when test="$css.bootstrap.dropmenu != ''"><xsl:value-of select="$css.dir" /><xsl:value-of select="$css.bootstrap.dropmenu" /></xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="css_mikan">
				<xsl:choose>
					<xsl:when test="$css.mikan != ''"><xsl:value-of select="$css.dir" /><xsl:value-of select="$css.mikan" /></xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:variable name="js_jquery">
				<xsl:choose>
					<xsl:when test="$js.jquery != ''"><xsl:value-of select="$js.dir" /><xsl:value-of select="$js.jquery" /></xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="js_jquery_ui">
				<xsl:choose>
					<xsl:when test="$js.jquery.ui != ''"><xsl:value-of select="$js.dir" /><xsl:value-of select="$js.jquery.ui" /></xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="js_bootstrap">
				<xsl:choose>
					<xsl:when test="$js.bootstrap != ''"><xsl:value-of select="$js.dir" /><xsl:value-of select="$js.bootstrap" /></xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>
			<xsl:variable name="js_mikan">
				<xsl:choose>
					<xsl:when test="$js.mikan != ''"><xsl:value-of select="$js.dir" /><xsl:value-of select="$js.mikan" /></xsl:when>
					<xsl:otherwise></xsl:otherwise>
				</xsl:choose>
			</xsl:variable>

			<xsl:choose>
				<xsl:when test="$css_jquery != ''"><link rel="stylesheet" type="text/css" href="{$css_jquery}" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$css_jquery_ui != ''"><link rel="stylesheet" type="text/css" href="{$css_jquery_ui}" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$css_bootstrap != ''"><link rel="stylesheet" type="text/css" href="{$css_bootstrap}"/></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="$css_bootstrap_dropmenu != ''"><link rel="stylesheet" type="text/css" href="{$css_bootstrap_dropmenu}"/></xsl:when>
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

			<xsl:comment><![CDATA[[if lt IE 9]>
				<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
				<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
			<![endif]]]></xsl:comment>

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

	<!-- ================================================================================= -->
	<!-- HTMLヘッダ -->
	<xsl:template name="xhtmlend">
		<xsl:variable name="js_bootstrap">
			<xsl:choose>
				<xsl:when test="$js.bootstrap != ''"><xsl:value-of select="$js.dir" /><xsl:value-of select="$js.bootstrap" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="$js_bootstrap != ''"><script type="text/javascript" src="{$js_bootstrap}">;</script></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>

		<xsl:variable name="js_bootstrap_dropmenu">
			<xsl:choose>
				<xsl:when test="$js.bootstrap.dropmenu != ''"><xsl:value-of select="$js.dir" /><xsl:value-of select="$js.bootstrap.dropmenu" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="$js_bootstrap_dropmenu != ''"><script type="text/javascript" src="{$js_bootstrap_dropmenu}">;</script></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>

		<xsl:variable name="js_mikan">
			<xsl:choose>
				<xsl:when test="$js.mikan != ''"><xsl:value-of select="$js.dir" /><xsl:value-of select="$js.mikan" /></xsl:when>
				<xsl:otherwise></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:choose>
			<xsl:when test="$js_mikan != ''">
				<script type="text/javascript">
					var MIKAN_JS_ROOT = '<xsl:value-of select="$js.dir" />';
					var MIKAN_WSGI_ROOT = '<xsl:value-of select="$html.dir" />';
					var MIKAN_IMAGE_ROOT = '<xsl:value-of select="$image.dir" />';
					var MIKAN_HTDOCS_ROOT = '<xsl:value-of select="$html.dir" />';
					var MIKAN_JS_ON = true;
					var mikan = {};
					mikan.resouce = {};
				</script>
				<script type="text/javascript" src="{$js_mikan}">;</script>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
