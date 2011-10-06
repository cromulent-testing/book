<?xml version="1.0" encoding="UTF-8"?>
<!--
 ============================================================
  SimpleDoc to XSL-FO Stylesheet
 ============================================================
  File Name : index2.xsl
 ============================================================
  Copyright (c) 2003-2007 Antenna House, Inc. All rights reserved.
  Antenna House is a trademark of Antenna House, Inc.
  URL    : http://www.antennahouse.com/
  E-mail : info@antennahouse.com
 ============================================================
-->
<!DOCTYPE DOCUMENT [
	<!ENTITY ALPHA "@0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ">
	<!ENTITY LOWER "abcdefghijklmnopqrstuvwxyz">
	<!ENTITY UPPER "ABCDEFGHIJKLMNOPQRSTUVWXYZ">
	<!ENTITY HIRAGANA "あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん">
	<!ENTITY KATAKANA "アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン">
	<!ENTITY SEION "かきくけこさしすせそたちつてとはひふへほはひふへほカキクケコサシスセソタチツテトハヒフヘホハヒフヘホ">
	<!ENTITY DAKUON "がぎぐげござじずぜぞだぢづでどばびぶべぼぱぴぷぺぽガギグゲゴザジズゼゾダヂヅデドバビブベボパピプペポ">
	<!ENTITY OOGAKI "あいうえおやゆよつアイウエオヤユヨツ">
	<!ENTITY KOGAKI "ぁぃぅぇぉゃゅょっァィゥェォャュョッ">
]>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:axf="http://www.antennahouse.com/names/XSL/Extensions">
	<!-- index key -->
	<xsl:key name="index2-key" match="index" use="
 translate(
 translate(
 translate(
 translate(substring(normalize-space(concat(@key,@keyword,.)),1,1)
           ,'&LOWER;','&UPPER;')
           ,'&KOGAKI;','&OOGAKI;')
           ,'&DAKUON;','&SEION;')
           ,'&KATAKANA;','&HIRAGANA;') "/>
	<!--xsl:key name="index2-value" match="index" use="."/-->
	<!-- Template to process index element -->
	<xsl:template match="index">
		<xsl:variable name="key" select="concat(@key,@keyword,.)"/>
		<xsl:variable name="initial" select="substring($key,1,1)"/>
		<xsl:if test="$initial=''">
			<xsl:message terminate="yes">
				<xsl:text>Empty keyword.&#10;</xsl:text>
			</xsl:message>
		</xsl:if>
		<xsl:if test="not(contains('&ALPHA;',$initial) or
                   contains('&LOWER;',$initial) or
                   contains('&HIRAGANA;',$initial) or
                   contains('&KATAKANA;',$initial) or
                   contains('&DAKUON;',$initial))">
			<xsl:message terminate="yes">
				<xsl:text>Invalid keyword: </xsl:text>
				<xsl:value-of select="."/>
				<xsl:if test="@key!=''">
					<xsl:text> (key="</xsl:text>
					<xsl:value-of select="@key"/>
					<xsl:text>")</xsl:text>
				</xsl:if>
				<xsl:text>&#10;</xsl:text>
			</xsl:message>
		</xsl:if>
		<fo:inline id="{generate-id()}">
			<xsl:apply-templates/>
		</fo:inline>
	</xsl:template>
	<!-- Template to create index page -->
	<xsl:template name="index.create">
		<fo:page-sequence master-reference="PageMaster-index">
			<fo:static-content flow-name="xsl-region-before">
				<fo:block font-size="7pt" text-align="center" border-after-width="thin" border-after-style="solid">
					<xsl:value-of select="/doc/head/title"/>
				</fo:block>
			</fo:static-content>
			<fo:flow flow-name="xsl-region-body">
				<fo:block>
					<fo:block span="all" line-height="15mm" background-color="#9bd49d" text-align="center" font-size="20pt" space-after="10mm" axf:outline-level="1" id="index-page">
						<xsl:choose>
							<xsl:when test="(/doc/@lang = 'ja') or (/doc/@lang = '') or not(/doc/@lang)">索引</xsl:when>
							<xsl:otherwise>INDEX</xsl:otherwise>
						</xsl:choose>
					</fo:block>
					<fo:block span="all">&#xA0;</fo:block>
					<fo:block xsl:use-attribute-sets="index">
						<xsl:call-template name="index.create.main">
							<xsl:with-param name="initial-str" select="'&ALPHA;'"/>
						</xsl:call-template>
						<xsl:if test="(/doc/@lang = 'ja') or (/doc/@lang = '') or not(/doc/@lang)">
							<xsl:call-template name="index.create.main">
								<xsl:with-param name="initial-str" select="'&HIRAGANA;'"/>
							</xsl:call-template>
						</xsl:if>
					</fo:block>
				</fo:block>
			</fo:flow>
		</fo:page-sequence>
	</xsl:template>
	<xsl:template name="index.create.main">
		<xsl:param name="initial-str"/>
		<xsl:if test="$initial-str != ''">
			<xsl:call-template name="index.create.section">
				<xsl:with-param name="letter" select="substring($initial-str,1,1)"/>
			</xsl:call-template>
			<xsl:call-template name="index.create.main">
				<xsl:with-param name="initial-str" select="substring($initial-str,2)"/>
			</xsl:call-template>
		</xsl:if>
	</xsl:template>
	<xsl:template name="index.create.section">
		<!-- Recieve the character to be processed -->
		<xsl:param name="letter"/>
		<!-- Set the nodes who have the 'letter' value of the key to the terms variable and sort them.-->
		<xsl:variable name="terms" select="key('index2-key',$letter)"/>
		<!-- Get the index which has the same head-one character as the parameter which received. -->
		<xsl:if test="$terms">
			<!-- Output key characters -->
			<fo:block font-weight="bold" text-align="center" space-before="1em">
				<!-- Output the received one character as is. -->
				<xsl:value-of select="$letter"/>
			</fo:block>
			<xsl:for-each select="$terms[ not(
   (    @keyword  and (@keyword=preceding::index[not(@keyword)]/text() or
                       @keyword=preceding::index/@keyword)) or
   (not(@keyword) and (       .=preceding::index[not(@keyword)]/text() or
                              .=preceding::index/@keyword)) ) ]">
				<!-- Make it a rule not to process the same text redundantly -->
				<xsl:sort select="@key | @keyword[not(@key)] | text()[not(@key) and not(@keyword)]"/>
				<!-- Sort the text in key order -->
				<fo:block text-align="justify" text-align-last="justify" axf:suppress-duplicate-page-number="true">
					<!--[<xsl:value-of select="@key | @keyword[not(@key)] | text()[not(@key) and not(@keyword)]"/>]-->
					<xsl:variable name="kw">
						<xsl:choose>
							<xsl:when test="string(@keyword)=''">
								<xsl:value-of select="."/>
								<!-- Output text as is -->
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="@keyword"/>
							</xsl:otherwise>
						</xsl:choose>
						<!--xsl:value-of select="@addkeyword"/-->
					</xsl:variable>
					<xsl:value-of select="$kw"/>
					<fo:leader leader-pattern="dots" />
					<fo:inline keep-together.within-line="always">
						<xsl:variable name="terms2" select="$terms[
             (string(@keyword)!='' and @keyword=$kw) or
             (string(@keyword) ='' and .=$kw) ]"/>
						-- Get the same text -->
						<xsl:if test="$terms2">
							<fo:inline>
								<!-- Output all of those page numbers when the same text exists in two or more places -->
								<xsl:apply-templates select="$terms2" mode="line"/>
							</fo:inline>
						</xsl:if>
					</fo:inline>
				</fo:block>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<xsl:template match="index" mode="line">
		<fo:basic-link internal-destination="{generate-id()}">
			<fo:page-number-citation ref-id="{generate-id()}"/>
		</fo:basic-link>
		<xsl:if test="position() != last()">,</xsl:if>
	</xsl:template>
</xsl:stylesheet>
