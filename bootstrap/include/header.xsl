<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.2.1_4                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-14 K.Sonohara All Right Reserved.                 -->
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
		<div class="navbar navbar-default navbar-fixed-top" role="navigation">
			<xsl:choose>
				<xsl:when test="$wide.indexes != '0'"><xsl:call-template name="header_main" /></xsl:when>
				<xsl:otherwise><div class="container"><xsl:call-template name="header_main" /></div></xsl:otherwise>
			</xsl:choose>
		</div>
	</xsl:template>

	<xsl:template name="header_main">
		<div class="navbar-header">
			<xsl:choose>
				<xsl:when test="$html.book != '1'">
					<a class="navbar-brand" href="#">
						<xsl:if test="$html.title != ''"><xsl:value-of select="$html.title" /> [</xsl:if>
						<xsl:value-of select="./info/title" />
						<xsl:if test="$html.title != ''">]</xsl:if>
					</a>
				</xsl:when>
				<xsl:otherwise>
					<a class="navbar-brand" href="#" onclick="mikan.page.showbook(null); ">
						<xsl:if test="$html.title != ''"><xsl:value-of select="$html.title" /> [</xsl:if>
						<xsl:value-of select="./info/title" />
						<xsl:if test="$html.title != ''">]</xsl:if>
					</a>
				</xsl:otherwise>
			</xsl:choose>
		</div>

		<div class="navbar-collapse collapse">
			<xsl:choose>
				<xsl:when test="$top.indexes = '1'">
					<ul class="nav navbar-nav">
						 <li class="active">
							<a href="#">
								<xsl:choose>
									<xsl:when test="$text.indexes != ''"><xsl:value-of select="$text.indexes" /></xsl:when>
									<xsl:otherwise>目次</xsl:otherwise>
								</xsl:choose>
							</a>
						</li>
					</ul>
				</xsl:when>
				<xsl:otherwise>
					<xsl:call-template name="index_menubar" />
				</xsl:otherwise>
			</xsl:choose>

			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">情報 <span class="caret"><xsl:text> </xsl:text></span></a>
					<ul class="dropdown-menu">
						<li class="dropdown-header">更新日付：<xsl:value-of select="./info/date" /></li>
						<li class="divider"><xsl:text> </xsl:text></li>
						<li><a href="{./info/homepage}" target="_TOP"><xsl:value-of select="./info/company" /></a></li>
					</ul>
				</li>
			</ul>
		</div>
	</xsl:template>
</xsl:stylesheet>
