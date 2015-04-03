<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.2.0_0                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-12 K.Sonohara All Right Reserved.                 -->
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--   XHTML 目次                                                           -->
<!-- ______________________________________________________________________ -->

<xsl:stylesheet
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
>
	<!-- ================================================================================= -->
	<!-- 目次 -->
	<xsl:template name="indexes">
		<div data-role="page" id="home" class="type-home" data-theme="{$jquery.theme}">
			<div data-role="header">
				<h1>
					<xsl:choose>
						<xsl:when test="$text.indexes != ''"><xsl:value-of select="$text.indexes" /></xsl:when>
						<xsl:otherwise>目次</xsl:otherwise>
					</xsl:choose>
				</h1>
			</div>
			<div data-role="content">
				<ul data-role="listview" data-inset="true">
					<li data-role="list-divider">
						<xsl:choose>
							<xsl:when test="$text.indexes != ''"><xsl:value-of select="$text.indexes" /></xsl:when>
							<xsl:otherwise>目次</xsl:otherwise>
						</xsl:choose>
					</li>
					<xsl:call-template name="index_item">
						<xsl:with-param name="prefix" select="''" />
						<xsl:with-param name="enabled" select="0" />
					</xsl:call-template>
				</ul>
			</div>
			<div data-role="footer">
				<h2><xsl:value-of select="/sxmlbook/info/description" /></h2>
				<h2><xsl:value-of select="/sxmlbook/info/copyright" /></h2>
			</div>
		</div>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 目次 -->
	<xsl:template name="index_item">
		<xsl:param name="prefix" select="''" />
		<xsl:param name="enabled" select="1" />

		<xsl:if test="not(count(./index) = '0')">
			<xsl:for-each select="./index">
				<xsl:variable name="i" select="@name" />
				<xsl:variable name="n" select="key('itemid', $i)" />

				<xsl:variable name="on">
					<xsl:choose>
						<xsl:when test="$enabled = '1'">1</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="$html.index.name = ''">1</xsl:when>
								<xsl:otherwise>
									<xsl:choose>
										<xsl:when test="$html.index.name = @name">1</xsl:when>
										<xsl:otherwise>0</xsl:otherwise>
									</xsl:choose>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</xsl:variable>

				<xsl:if test="$on = '1'">
					<li>
						<a
							href="{$html.file}#{$i}"
							title="{$n/description}"
						>
							<xsl:value-of select="$prefix" /><xsl:value-of select="position()" />. <xsl:value-of select="normalize-space($n/title)" />
						</a>
						<!--xsl:if test="normalize-space(./@child) = ''">
							<xsl:call-template name="index_item">
								<xsl:with-param name="prefix" select="concat($prefix,concat(position(),'.'))" />
								<xsl:with-param name="counter" select="position() + 1" />
								<xsl:with-param name="enabled" select="1" />
							</xsl:call-template>
						</xsl:if-->
					</li>
				</xsl:if>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
