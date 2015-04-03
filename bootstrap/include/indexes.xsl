<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.2.1_4                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-14 K.Sonohara All Right Reserved.                 -->
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
		<xsl:call-template name="index_item">
			<xsl:with-param name="prefix" select="''" />
			<xsl:with-param name="enabled" select="0" />
			<xsl:with-param name="tree" select="$tree.indexes" />
		</xsl:call-template>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 目次バー -->
	<xsl:template name="index_menus">
		<div class="nav nav-pills navbar-default" role="navigation">
			<div class="navbar-collapse collapse">
				<div class="container">
					<xsl:call-template name="index_menubar" />
				</div>
			</div>
		</div>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 目次バー -->
	<xsl:template name="index_menubar">
		<ul class="nav navbar-nav">
			<xsl:for-each select="./index">
				<xsl:variable name="i" select="@name" />
				<xsl:variable name="n" select="key('itemid', $i)" />
				<li class="btn-group">
					<xsl:call-template name="index_a">
						<xsl:with-param name="id" select="$i" />
						<xsl:with-param name="class" select="'btn btn-mini'" />
						<xsl:with-param name="num" select="''" />
					</xsl:call-template>

					<xsl:if test="not(count(./index) = '0')">
						<a class="btn btn-mini dropdown-toggle" data-toggle="dropdown">
							<span class="caret"><xsl:text> </xsl:text></span>
						</a>

						<xsl:call-template name="index_item">
							<xsl:with-param name="prefix" select="''" />
							<xsl:with-param name="counter" select="''" />
							<xsl:with-param name="enabled" select="1" />
						</xsl:call-template>
					</xsl:if>
				</li>
			</xsl:for-each>
		</ul>
	</xsl:template>

	<!-- ================================================================================= -->
	<!-- 個別目次 -->
	<xsl:template name="index_item">
		<xsl:param name="prefix" select="''" />
		<xsl:param name="enabled" select="1" />
		<xsl:param name="tree" select="1" />

		<xsl:if test="not(count(./index) = '0')">
			<ul class="dropdown-menu multi-level" role="menu" aria-labelledby="dropdownMenu">
				<xsl:for-each select="./index">
					<xsl:variable name="i" select="@name" />
					<xsl:variable name="n" select="key('itemid', $i)" />


					<xsl:variable name="u">
						<xsl:choose>
							<xsl:when test="$html.index.prefix=''">#</xsl:when>
							<xsl:otherwise><xsl:value-of select="$html.index.prefix" /></xsl:otherwise>
						</xsl:choose>
					</xsl:variable>

					<xsl:variable name="np"><xsl:value-of select="position()" />.</xsl:variable>

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
							<xsl:call-template name="index_a">
								<xsl:with-param name="id" select="$i" />
								<xsl:with-param name="class" select="''" />
								<xsl:with-param name="num" select="$np" />
								<xsl:with-param name="prefix" select="$u" />
							</xsl:call-template>
						</li>
						<xsl:for-each select="./index">
							<xsl:variable name="npc"><xsl:value-of select="$np" /><xsl:value-of select="position()" />.</xsl:variable>
							<li>
								<xsl:call-template name="index_a">
									<xsl:with-param name="id" select="./@name" />
									<xsl:with-param name="class" select="''" />
									<xsl:with-param name="num" select="$npc" />
									<xsl:with-param name="prefix" select="$u" />
								</xsl:call-template>
								<xsl:for-each select="./index">
									<xsl:variable name="npcc"><xsl:value-of select="$npc" /><xsl:value-of select="position()" />.</xsl:variable>
									<ul class="dropdown-menu">
										<xsl:call-template name="index_a">
											<xsl:with-param name="id" select="./@name" />
											<xsl:with-param name="class" select="''" />
											<xsl:with-param name="num" select="$npcc" />
											<xsl:with-param name="prefix" select="$u" />
										</xsl:call-template>
									</ul>
								</xsl:for-each>
							</li>
						</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</ul>
		</xsl:if>
	</xsl:template>


	<xsl:template name="index_a">
		<xsl:param name="id" select="''" />
		<xsl:param name="class" select="''" />
		<xsl:param name="num" select="''" />
		<xsl:param name="prefix" select="''" />

		<xsl:variable name="t" select="key('itemid', $id)" />

		<xsl:variable name="mh">
			<xsl:choose>
				<xsl:when test="$html.book != '1'"><xsl:value-of select="$html.file" />#<xsl:value-of select="$id" /></xsl:when>
				<xsl:when test="$html.index.prefix!=''"><xsl:value-of select="$html.index.prefix" />#<xsl:value-of select="$id" /></xsl:when>
				<xsl:otherwise>#</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="mc">
			<xsl:choose>
				<xsl:when test="$html.book != '1'">;</xsl:when>
				<xsl:otherwise>mikan.page.showbook('#<xsl:value-of select="$id" />');</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<a
			href="{$mh}"
			target="{$html.target}"
			class="{$class}"
			onclick="{$mc}"
		>
			<xsl:value-of select="$num" /><xsl:text> </xsl:text><xsl:value-of select="normalize-space($t/title)" />
		</a>
	</xsl:template>
</xsl:stylesheet>
