<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.3.0_0                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-15 K.Sonohara All Right Reserved.                 -->
<!--   Code released under [Mozilla Public License, version 2.0]            -->
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--   XSLT Params                                                          -->
<!-- ______________________________________________________________________ -->

<xsl:stylesheet
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xs="http://www.w3.org/2001/XMLSchema"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
>
	<!-- ================================================================================= -->
	<!-- XSLT params -->

	<!-- Directory params -->
	<!-- HTML root directory -->
	<xsl:param name="html.dir">./</xsl:param>
	<!-- CSS root directory -->
	<xsl:param name="css.dir"><xsl:value-of select="$html.dir" />css/</xsl:param>
	<!-- JavaScript root directory -->
	<xsl:param name="js.dir"><xsl:value-of select="$html.dir" />js/</xsl:param>
	<!-- Images root directory -->
	<xsl:param name="image.dir"><xsl:value-of select="$html.dir" />images/</xsl:param>


	<!-- Mode params -->
	<!-- HTML style mode
		normal: Default style mode.
		simple: Legacy style mode.
	-->
	<xsl:param name="html.mode">normal</xsl:param>
	<!-- Header style mode -->
	<xsl:param name="header.mode">normal</xsl:param>
	<!-- Footer style mode -->
	<xsl:param name="footer.mode">normal</xsl:param>

	<!-- HTML Book mode (on:1) -->
	<xsl:param name="html.book"> </xsl:param>

	<!-- HTML loading mode (on:1) -->
	<xsl:param name="html.loading"> </xsl:param>


	<!-- CSS -->
	<xsl:param name="css.jquery"></xsl:param>
	<xsl:param name="css.jquery.ui">jquery-ui.css</xsl:param>
	<xsl:param name="css.jquery.colorbox">plugins/jquery-colorbox.css</xsl:param>
	<xsl:param name="css.bootstrap">bootstrap.css</xsl:param>
	<xsl:param name="css.bootstrap.theme">bootstrap-theme.css</xsl:param>
	<xsl:param name="css.fa">font-awesome.css</xsl:param>
	<xsl:param name="css.metismenu">plugins/metisMenu.css</xsl:param>
	<xsl:param name="css.morris">plugins/morris.css</xsl:param>
	<xsl:param name="css.admin">sb-admin-2.css</xsl:param>
	<xsl:param name="css.multiselect">bootstrap-multiselect.css</xsl:param>
	<xsl:param name="css.mikan">mikan/mikan.css</xsl:param>

	<!-- JavaScript -->
	<xsl:param name="js.jquery">jquery.js</xsl:param>
	<xsl:param name="js.jquery.ui">jquery-ui.js</xsl:param>
	<xsl:param name="js.jquery.colorbox">plugins/jquery-colorbox.js</xsl:param>
	<xsl:param name="js.bootstrap">bootstrap.js</xsl:param>
	<xsl:param name="js.morris">plugins/morris.js</xsl:param>
	<xsl:param name="js.metismenu">plugins/metisMenu.js</xsl:param>
	<xsl:param name="js.multiselect">bootstrap-multiselect.js</xsl:param>
	<xsl:param name="js.mikan">mikan/mikan.min.js</xsl:param>


	<!-- Item title icon (bootstrap) -->
	<xsl:param name="title.icon">book</xsl:param>
	<!-- Icon style (bootstrap) -->
	<xsl:param name="icon.class">text-primary</xsl:param>

	<!-- Index name -->
	<xsl:param name="index.name"></xsl:param>
	<!-- Index URL prefix -->
	<xsl:param name="index.prefix"></xsl:param>










	<!-- HTMLタイトル -->
	<xsl:param name="html.title"></xsl:param>

	<!-- HTMLファイル名引数 -->
	<xsl:param name="html.file"></xsl:param>
	<!-- リンクターゲット引数 -->
	<xsl:param name="html.target">_self</xsl:param>

	<!-- イメージクリック(0は無し・1はイメージリンク) -->
	<xsl:param name="image.click">1</xsl:param>

	<!-- タイトルプレフィックス(0は無し・1は番号付き) -->
	<xsl:param name="item.prefix">1</xsl:param>

	<!-- 目次タイトル -->
	<xsl:param name="text.indexes">目次</xsl:param>

	<!-- 目次ツリー -->
	<xsl:param name="tree.indexes">1</xsl:param>

	<!-- 目次トップ固定 -->
	<xsl:param name="top.indexes">0</xsl:param>

	<!-- 目次ワイド設定 -->
	<xsl:param name="wide.indexes">0</xsl:param>

	<!-- 目次階層 -->
	<xsl:param name="deep.indexes">1</xsl:param>

	<!-- トップ戻りマーク(0は無し・1はリンク) -->
	<xsl:param name="top.mark">1</xsl:param>

	<!-- ヘッダ非表示引数 -->
	<xsl:param name="header.type">title</xsl:param>





</xsl:stylesheet>
