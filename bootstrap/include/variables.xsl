<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.3.0_0                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-15 K.Sonohara All Right Reserved.                 -->
<!--   Code released under [Mozilla Public License, version 2.0]            -->
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--   XSLT Variables                                                       -->
<!-- ______________________________________________________________________ -->

<xsl:stylesheet
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
>
	<!-- ================================================================================= -->
	<!-- variable -->
	<xsl:variable name="html_dir">
		<xsl:choose>
			<xsl:when test="$html.dir != ''"><xsl:value-of select="normalize-space($html.dir)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="css_dir">
		<xsl:choose>
			<xsl:when test="$css.dir != ''"><xsl:value-of select="normalize-space($css.dir)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="js_dir">
		<xsl:choose>
			<xsl:when test="$js.dir != ''"><xsl:value-of select="normalize-space($js.dir)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="image_dir">
		<xsl:choose>
			<xsl:when test="$image.dir != ''"><xsl:value-of select="normalize-space($image.dir)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="css_jquery">
		<xsl:choose>
			<xsl:when test="$css.jquery != ''"><xsl:value-of select="$css_dir" /><xsl:value-of select="normalize-space($css.jquery)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="css_jquery_ui">
		<xsl:choose>
			<xsl:when test="$css.jquery.ui != ''"><xsl:value-of select="$css_dir" /><xsl:value-of select="normalize-space($css.jquery.ui)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="css_bootstrap">
		<xsl:choose>
			<xsl:when test="$css.bootstrap != ''"><xsl:value-of select="$css_dir" /><xsl:value-of select="normalize-space($css.bootstrap)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="css_fa">
		<xsl:choose>
			<xsl:when test="$css.fa != ''"><xsl:value-of select="$css_dir" /><xsl:value-of select="normalize-space($css.fa)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="css_metismenu">
		<xsl:choose>
			<xsl:when test="$css.metismenu != ''"><xsl:value-of select="$css_dir" /><xsl:value-of select="normalize-space($css.metismenu)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="css_morris">
		<xsl:choose>
			<xsl:when test="$css.morris != ''"><xsl:value-of select="$css_dir" /><xsl:value-of select="normalize-space($css.morris)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="css_admin">
		<xsl:choose>
			<xsl:when test="$css.admin != ''"><xsl:value-of select="$css_dir" /><xsl:value-of select="normalize-space($css.admin)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="css_multiselect">
		<xsl:choose>
			<xsl:when test="$css.multiselect != ''"><xsl:value-of select="$css_dir" /><xsl:value-of select="normalize-space($css.multiselect)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="css_mikan">
		<xsl:choose>
			<xsl:when test="$css.mikan != ''"><xsl:value-of select="$css_dir" /><xsl:value-of select="normalize-space($css.mikan)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="js_jquery">
		<xsl:choose>
			<xsl:when test="$js.jquery != ''"><xsl:value-of select="$js_dir" /><xsl:value-of select="normalize-space($js.jquery)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="js_jquery_u">
		<xsl:choose>
			<xsl:when test="$js.jquery.ui != ''"><xsl:value-of select="$js_dir" /><xsl:value-of select="normalize-space($js.jquery.ui)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="js_bootstrap">
		<xsl:choose>
			<xsl:when test="$js.bootstrap != ''"><xsl:value-of select="$js_dir" /><xsl:value-of select="normalize-space($js.bootstrap)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="js_morris">
		<xsl:choose>
			<xsl:when test="$js.morris != ''"><xsl:value-of select="$js_dir" /><xsl:value-of select="normalize-space($js.morris)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="js_metismenu">
		<xsl:choose>
			<xsl:when test="$js.metismenu != ''"><xsl:value-of select="$js_dir" /><xsl:value-of select="normalize-space($js.metismenu)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="js_multiselect">
		<xsl:choose>
			<xsl:when test="$js.multiselect != ''"><xsl:value-of select="$js_dir" /><xsl:value-of select="normalize-space($js.multiselect)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="js_mikan">
		<xsl:choose>
			<xsl:when test="$js.mikan != ''"><xsl:value-of select="$js_dir" /><xsl:value-of select="normalize-space($js.mikan)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="html_mode">
		<xsl:choose>
			<xsl:when test="$html.mode != ''"><xsl:value-of select="normalize-space($html.mode)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="header_mode">
		<xsl:choose>
			<xsl:when test="$header.mode != ''"><xsl:value-of select="normalize-space($header.mode)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="footer_mode">
		<xsl:choose>
			<xsl:when test="$footer.mode != ''"><xsl:value-of select="normalize-space($footer.mode)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="html_title">
		<xsl:choose>
			<xsl:when test="$html.title!= ''"><xsl:value-of select="normalize-space($html.title)" /></xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:variable name="document_title">
		<xsl:if test="$html_title != ''"><xsl:value-of select="$html_title" /> [</xsl:if>
		<xsl:value-of select="/sxmlbook/info/title" />
		<xsl:if test="$html_title != ''">]</xsl:if>
		<xsl:if test="$html.index.name != ''">
			 - 
			<xsl:variable name="n" select="key('itemid', $html.index.name)" />
			<xsl:value-of select="normalize-space($n/title)" />
		</xsl:if>
	</xsl:variable>



</xsl:stylesheet>
