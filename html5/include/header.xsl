<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.0.2_0                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-09 K.Sonohara All Right Reserved.                 -->
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--   XHTML ヘッダ                                                         -->
<!-- ______________________________________________________________________ -->

<xsl:stylesheet
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
>
	<!-- ================================================================================= -->
	<!-- ヘッダー -->
	<xsl:template name="header">
		<xsl:choose>
			<xsl:when test="$header.type = 'title'">
				<div class="header">
					<div class="title" >
						<xsl:if test="$html.title != ''"><xsl:value-of select="$html.title" /> [</xsl:if>
						<xsl:value-of select="./info/title" />
						<xsl:if test="$html.title != ''">]</xsl:if>
					</div>
					<div class="subtitles" >
						<div class="subtitle" ><xsl:value-of select="./info/description" /></div>
						<div class="subtitle" ><xsl:value-of select="./info/release" /></div>
						<div class="subtitle" ><xsl:value-of select="./info/date" /></div>
						<div class="subtitle" >
							<a
								class="header_company"
								href="{./info/homepage}"
								target="_TOP"
							>
								<xsl:value-of select="./info/company" />
							</a>
						</div>
						<div class="subtitle" ><xsl:value-of select="./info/copyright" /></div>
					</div>
				</div>
			</xsl:when>
			<xsl:when test="$header.type = 'show'">
				<div class="header">
					<!-- タイトル -->
					<div class="footer_title" >
						<xsl:if test="$html.title != ''"><xsl:value-of select="$html.title" /> [</xsl:if>
						<xsl:value-of select="./info/title" />
						<xsl:if test="$html.title != ''">]</xsl:if>
					</div>

					<xsl:if test="$html.index.name != ''">
						<div class="footer_title" >
							<xsl:variable name="n" select="key('itemid', $html.index.name)" />
							<xsl:value-of select="normalize-space($n/title)" />
						</div>
					</xsl:if>
				</div>
			</xsl:when>
			<xsl:otherwise></xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
