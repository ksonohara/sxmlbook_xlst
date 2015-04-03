<?xml version="1.0" encoding="UTF-8" ?>
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--  sXMLBook XSLT Ver0.2.1_4                                              -->
<!--                                                                        -->
<!--   Copyright (C) 2007-14 K.Sonohara All Right Reserved.                 -->
<!-- ______________________________________________________________________ -->
<!--                                                                        -->
<!--   XHTML 引数                                                           -->
<!-- ______________________________________________________________________ -->

<xsl:stylesheet
	xmlns="http://www.w3.org/1999/xhtml"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0"
>
	<!-- ================================================================================= -->
	<!-- 引数 -->
	<!-- HTMLタイトル -->
	<xsl:param name="html.title"></xsl:param>

	<!-- HTMLモード -->
	<xsl:param name="html.book"></xsl:param>

	<!-- スタイルシートディレクトリ引数 -->
	<xsl:param name="css.dir">css/</xsl:param>
	<!-- スタイルシート引数 -->
	<xsl:param name="css.jquery"></xsl:param>
	<!-- スタイルシート引数 -->
	<xsl:param name="css.jquery.ui">jquery.ui.css</xsl:param>
	<!-- スタイルシート引数 -->
	<xsl:param name="css.bootstrap">bootstrap.css</xsl:param>
	<!-- スタイルシート引数 -->
	<xsl:param name="css.bootstrap.dropmenu">dropdowns-enhancement.css</xsl:param>
	<!-- スタイルシート引数 -->
	<xsl:param name="css.mikan">mikan/mikan.css</xsl:param>

	<!-- JavaScriptディレクトリ引数 -->
	<xsl:param name="js.dir">js/</xsl:param>
	<!-- JavaScript引数 -->
	<xsl:param name="js.jquery">jquery.js</xsl:param>
	<!-- JavaScript引数 -->
	<xsl:param name="js.jquery.ui">jquery.ui.js</xsl:param>
	<!-- JavaScript引数 -->
	<xsl:param name="js.bootstrap">bootstrap.js</xsl:param>
	<!-- JavaScript引数 -->
	<xsl:param name="js.bootstrap.dropmenu">dropdowns-enhancement.js</xsl:param>

	<!-- JavaScript引数 -->
	<xsl:param name="js.mikan">mikan/mikan.min.js</xsl:param>

	<!-- 基本ディレクトリ引数 -->
	<xsl:param name="html.dir">./</xsl:param>
	<!-- イメージディレクトリ引数 -->
	<xsl:param name="image.dir">images/</xsl:param>
	<!-- HTMLファイル名引数 -->
	<xsl:param name="html.file"></xsl:param>
	<!-- HTML対象目次引数 -->
	<xsl:param name="html.index.name"></xsl:param>
	<!-- HTML対象目次URLプレフィックス -->
	<xsl:param name="html.index.prefix"></xsl:param>
	<!-- リンクターゲット引数 -->
	<xsl:param name="html.target">_self</xsl:param>

	<!-- イメージクリック(0は無し・1はイメージリンク) -->
	<xsl:param name="image.click">1</xsl:param>

	<!-- タイトルプレフィックス(0は無し・1は番号付き) -->
	<xsl:param name="item.prefix">1</xsl:param>

	<!-- タイトルスタイルシート -->
	<xsl:param name="clazz.title"></xsl:param>

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

	<!-- アイコンスタイルシート -->
	<xsl:param name="icon.class">text-primary</xsl:param>

	<!-- トップ戻りマーク(0は無し・1はリンク) -->
	<xsl:param name="top.mark">1</xsl:param>

	<!-- タイトルアイコン名 -->
	<xsl:param name="title.icon">book</xsl:param>

	<!-- ヘッダ非表示引数 -->
	<xsl:param name="header.type">title</xsl:param>

	<!-- フッタ非表示引数 -->
	<xsl:param name="footer.type">show</xsl:param>
</xsl:stylesheet>
