<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.3.0_0                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-15 K.Sonohara All Right Reserved.                 -->
<!--   Code released under [Mozilla Public License, version 2.0]            -->
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--   sXMLBook Main                                                        -->
<!-- ______________________________________________________________________ -->

<xsl:stylesheet
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xhtml="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
>

<xsl:output
	method="xml"
	encoding="UTF-8"
	indent="yes"
	omit-xml-declaration="no"
/>
	<!-- import -->
	<xsl:include href="include/constant.xsl"/>
	<xsl:include href="include/params.xsl"/>
	<xsl:include href="include/variables.xsl"/>
	<xsl:include href="include/id.xsl"/>
	<xsl:include href="include/xhtml.xsl"/>
	<xsl:include href="include/summary.xsl"/>
	<xsl:include href="include/header.xsl"/>
	<xsl:include href="include/footer.xsl"/>
	<xsl:include href="include/indexes.xsl"/>
	<xsl:include href="include/items.xsl"/>

	<!-- ================================================================================= -->
	<!-- main -->
	<xsl:template match="/sxmlbook">
		<xsl:text disable-output-escaping="yes">
&lt;!DOCTYPE html&gt;

</xsl:text>
		<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{./@lang}" lang="{./@lang}"><xsl:text>
</xsl:text>
			<xsl:call-template name="xhtml" />
<xsl:text>
</xsl:text>
			
			<body>
				<xsl:if test="$html_loading = '1'">
					<div id="page_loading"><xsl:text> </xsl:text></div>
				</xsl:if>

				<xsl:choose>
					<xsl:when test="$html_loading = '1'">
						<div id="page_main">
							<xsl:call-template name="content" />
						</div>
					</xsl:when>
					<xsl:otherwise>
						<xsl:call-template name="content" />
					</xsl:otherwise>
				</xsl:choose>


				<xsl:call-template name="xhtmlend" />
			</body><xsl:text>
</xsl:text>
		</html>
	</xsl:template>

	<xsl:template name="content">
		<xsl:choose>
			<xsl:when test="$html_mode='simple'">
				<!-- ヘッダー -->
				<xsl:call-template name="header" />

				<!-- サマリー -->
				<xsl:if test="$top.indexes = '0'">
					<br />
					<br />
				</xsl:if>
				<xsl:call-template name="summary" />

				<!-- 目次 -->
				<xsl:if test="$top.indexes = '1'">
					<xsl:call-template name="index_menus" />
				</xsl:if>

				<!-- 内容 -->
				<div class="container">
					<xsl:call-template name="items" />
				</div>

				<!-- フッダー -->
				<xsl:call-template name="footer" />
			</xsl:when>
			<xsl:otherwise>
				<div id="header">
					<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
						<xsl:call-template name="header" />

						<div class="navbar-default sidebar" role="navigation">
							<div class="sidebar-nav navbar-collapse">
								<ul class="nav" id="side-menu">
									<xsl:call-template name="indexes" />
								</ul>
							</div>
						</div>
					</nav>
				</div>

				<div id="page-wrapper">
					<!-- summary -->
					<xsl:if test="$top.indexes = '0'">
						<br />
					</xsl:if>
					<xsl:call-template name="summary" />

					<!-- items -->
					<xsl:call-template name="items" />
				</div>

				<!-- footer -->
				<xsl:call-template name="footer" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
</xsl:stylesheet>
