<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.0.2_0                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-09 K.Sonohara All Right Reserved.                 -->
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
		<div class="index">
			<div class="index_title">
				<xsl:choose>
					<xsl:when test="$text.indexes != ''"><xsl:value-of select="$text.indexes" /></xsl:when>
					<xsl:otherwise>目次</xsl:otherwise>
				</xsl:choose>
			</div>
			<xsl:call-template name="index_item">
				<xsl:with-param name="prefix" select="''" />
				<xsl:with-param name="enabled" select="0" />
				<xsl:with-param name="tree" select="$tree.indexes" />
			</xsl:call-template>
		</div>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 目次 -->
	<xsl:template name="index_item">
		<xsl:param name="prefix" select="''" />
		<xsl:param name="enabled" select="1" />
		<xsl:param name="tree" select="1" />

		<xsl:if test="not(count(./index) = '0')">
			<ul class="index">
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
						<li class="index">
							<a
								id="index_{$i}"
								class="index"
								href="{$html.file}#{$i}"
								target="{$html.target}"
								title="{$n/description}"
							>
								<xsl:value-of select="$prefix" /><xsl:value-of select="position()" />. <xsl:value-of select="normalize-space($n/title)" />
							</a>
							<xsl:if test="$tree = '1'">
								<xsl:if test="normalize-space(./@child) = ''">
									<xsl:call-template name="index_item">
										<xsl:with-param name="prefix" select="concat($prefix,concat(position(),'.'))" />
										<xsl:with-param name="counter" select="position() + 1" />
										<xsl:with-param name="enabled" select="1" />
									</xsl:call-template>
								</xsl:if>
							</xsl:if>
						</li>
					</xsl:if>
				</xsl:for-each>
			</ul>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>
