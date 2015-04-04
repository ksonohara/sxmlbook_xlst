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
	<!-- param -->
	<!-- HTMLディレクトリ引数 -->
	<xsl:param name="html.dir">./</xsl:param>
	<!-- スタイルシートディレクトリ引数 -->
	<xsl:param name="css.dir"><xsl:value-of select="$html.dir" />css/</xsl:param>
	<!-- JavaScriptディレクトリ引数 -->
	<xsl:param name="js.dir"><xsl:value-of select="$html.dir" />js/</xsl:param>
	<!-- イメージディレクトリ引数 -->
	<xsl:param name="image.dir"><xsl:value-of select="$html.dir" />images/</xsl:param>

	
	<xsl:param name="html.mode">simple</xsl:param>



	<!-- HTMLタイトル -->
	<xsl:param name="html.title"></xsl:param>

	<!-- HTMLモード -->
	<xsl:param name="html.book"></xsl:param>

	<!-- スタイルシート引数 -->
	<xsl:param name="css.jquery"></xsl:param>
	<!-- スタイルシート引数 -->
	<xsl:param name="css.jquery.ui">jquery-ui.css</xsl:param>
	<!-- スタイルシート引数 -->
	<xsl:param name="css.bootstrap">bootstrap.css</xsl:param>
	<!-- スタイルシート引数 -->
	<xsl:param name="css.fa">font-awesome.css</xsl:param>
	<!-- スタイルシート引数 -->
	<xsl:param name="css.metismenu">plugins/metisMenu.css</xsl:param>
	<!-- スタイルシート引数 -->
	<xsl:param name="css.morris">plugins/morris.css</xsl:param>
	<!-- スタイルシート引数 -->
	<xsl:param name="css.admin">sb-admin-2.css</xsl:param>
	<!-- スタイルシート引数 -->
	<xsl:param name="css.multiselect">bootstrap-multiselect.css</xsl:param>
	<!-- スタイルシート引数 -->
	<xsl:param name="css.mikan">mikan/mikan.css</xsl:param>

	<!-- JavaScript引数 -->
	<xsl:param name="js.jquery">jquery.js</xsl:param>
	<!-- JavaScript引数 -->
	<xsl:param name="js.jquery.ui">jquery-ui.js</xsl:param>
	<!-- JavaScript引数 -->
	<xsl:param name="js.bootstrap">bootstrap.js</xsl:param>
	<!-- JavaScript引数 -->
	<xsl:param name="js.morris">plugins/morris.js</xsl:param>
	<!-- JavaScript引数 -->
	<xsl:param name="js.metismenu">plugins/metisMenu.js</xsl:param>
	<!-- JavaScript引数 -->
	<xsl:param name="js.multiselect">bootstrap-multiselect.js</xsl:param>
	<!-- JavaScript引数 -->
	<xsl:param name="js.mikan">mikan/mikan.min.js</xsl:param>

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
	<xsl:param name="header.mode">normal</xsl:param>

	<!-- フッタ非表示引数 -->
	<xsl:param name="footer.mode">normal</xsl:param>
</xsl:stylesheet>
