<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" indent="yes" encoding="UTF-8"/>
  
  <xsl:variable name="font-size">12pt</xsl:variable>
  <xsl:variable name="page-width">108.0mm</xsl:variable>
  <xsl:variable name="page-height">174.5mm</xsl:variable>
  <xsl:variable name="page-margin">6.35mm</xsl:variable>
  <xsl:variable name="page-margin-bottom">12.70mm</xsl:variable>
  <xsl:variable name="footer-size">0em</xsl:variable>

  <xsl:variable name="paragraph-spacing">1em</xsl:variable>


  <xsl:template match="doc">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <xsl:attribute name="font-size">
        <xsl:value-of select="$font-size"/>
      </xsl:attribute>

      <fo:layout-master-set>
        <fo:simple-page-master master-name="PageMaster-Left">
          <xsl:attribute name="page-height"><xsl:value-of select="$page-height"/></xsl:attribute>
          <xsl:attribute name="page-width"><xsl:value-of select="$page-width"/></xsl:attribute>
          <xsl:attribute name="margin-bottom"><xsl:value-of select="$page-margin-bottom"/></xsl:attribute>
          <xsl:attribute name="margin-left"><xsl:value-of select="$page-margin"/></xsl:attribute>
          <xsl:attribute name="margin-right"><xsl:value-of select="$page-margin"/></xsl:attribute>
          <xsl:attribute name="margin-top"><xsl:value-of select="$page-margin"/></xsl:attribute>

          <fo:region-body margin="0mm 0mm 0mm 0mm"/>

<!--          <fo:region-before region-name="Left-header" extent="10mm" display-align="after"/>-->
          <fo:region-after region-name="Left-footer" display-align="before">
            <xsl:attribute name="extent"><xsl:value-of select="$footer-size"/></xsl:attribute>
          </fo:region-after>
<!--          <fo:region-start region-name="Left-start" extent="25mm"/>-->
<!--          <fo:region-end region-name="Left-end" extent="25mm"/>-->
        </fo:simple-page-master>

        <fo:simple-page-master master-name="PageMaster-Right">
          <xsl:attribute name="page-height"><xsl:value-of select="$page-height"/></xsl:attribute>
          <xsl:attribute name="page-width"><xsl:value-of select="$page-width"/></xsl:attribute>
          <xsl:attribute name="margin-bottom"><xsl:value-of select="$page-margin-bottom"/></xsl:attribute>
          <xsl:attribute name="margin-left"><xsl:value-of select="$page-margin"/></xsl:attribute>
          <xsl:attribute name="margin-right"><xsl:value-of select="$page-margin"/></xsl:attribute>
          <xsl:attribute name="margin-top"><xsl:value-of select="$page-margin"/></xsl:attribute>
          

          <fo:region-body margin="0mm 0mm 0mm 0mm"/>
          
<!--          <fo:region-before region-name="Right-header" extent="10mm" display-align="after"/>-->
          <fo:region-after region-name="Right-footer" display-align="before">
            <xsl:attribute name="extent"><xsl:value-of select="$footer-size"/></xsl:attribute>
          </fo:region-after>
<!--          <fo:region-start region-name="Right-start" extent="25mm"/>-->
<!--          <fo:region-end region-name="Right-end" extent="25mm"/>-->
        </fo:simple-page-master>

        <fo:page-sequence-master master-name="PageMaster">
          <fo:repeatable-page-master-alternatives>
            <fo:conditional-page-master-reference master-reference="PageMaster-Left" odd-or-even="even"/>
            <fo:conditional-page-master-reference master-reference="PageMaster-Right" odd-or-even="odd"/>
          </fo:repeatable-page-master-alternatives>
        </fo:page-sequence-master>
      </fo:layout-master-set>

      <xsl:apply-templates select="body"/>
    </fo:root>
  </xsl:template>


  <xsl:template match="body">
    <fo:page-sequence master-reference="PageMaster" initial-page-number="1">
      <!-- leader for footnote separator -->
      <fo:static-content flow-name="xsl-footnote-separator">
        <fo:block>
          <fo:leader leader-pattern="rule" rule-thickness="0.5pt" leader-length="33%"/>
        </fo:block>
      </fo:static-content>

      <!-- Left page footer -->
      <fo:static-content flow-name="Left-footer">
        <fo:block>
          <xsl:attribute name="font-size">9pt</xsl:attribute>

          <xsl:attribute name="border-top-width">0.5pt</xsl:attribute>
          <xsl:attribute name="border-top-style">solid</xsl:attribute>
          <xsl:attribute name="border-top-color">black</xsl:attribute>

          <fo:block>
            <xsl:attribute name="margin"><xsl:value-of select="$paragraph-spacing"/></xsl:attribute>

            <fo:page-number/>
          </fo:block>
        </fo:block>
      </fo:static-content>

      <!-- right page footer -->
      <fo:static-content flow-name="Right-footer">
        <fo:block>
          <xsl:attribute name="text-align">outside</xsl:attribute>
          <xsl:attribute name="font-size">9pt</xsl:attribute>

          <xsl:attribute name="border-top-width">0.5pt</xsl:attribute>
          <xsl:attribute name="border-top-style">solid</xsl:attribute>
          <xsl:attribute name="border-top-color">black</xsl:attribute>

          <fo:block>
            <xsl:attribute name="margin"><xsl:value-of select="$paragraph-spacing"/></xsl:attribute>

            <fo:page-number/>
          </fo:block>
        </fo:block>
      </fo:static-content>



      <fo:flow flow-name="xsl-region-body">
        <fo:block>
          <xsl:apply-templates/>
        </fo:block>
      </fo:flow>
    </fo:page-sequence>
  </xsl:template>

  <xsl:template match="intro">
    <!-- blank page at start of book -->
    <fo:block page-break-before="always">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <!-- The Section Leader -->
  <xsl:template match="section">
    <fo:block>
      <xsl:attribute name="page-break-before">always</xsl:attribute>
      <xsl:attribute name="margin-top">75%</xsl:attribute>
      <xsl:attribute name="text-align">center</xsl:attribute>
      <xsl:attribute name="font-weight">bold</xsl:attribute>

      <xsl:value-of select="title"/>
    </fo:block>

    <fo:block page-break-before="always">
      <xsl:attribute name="margin-top">80%</xsl:attribute>
      <xsl:attribute name="text-align">right</xsl:attribute>
      <xsl:attribute name="line-height">3em</xsl:attribute>
      
      <xsl:for-each select="articles/article/title">
        <xsl:call-template name="section.toc.line"/>
      </xsl:for-each>
    </fo:block>

    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template name="section.toc.line">
    <fo:block>
      <xsl:value-of select="."/>
    </fo:block>
  </xsl:template>


  <!-- Article -->
  <xsl:template match="article">
    <fo:block page-break-before="left">
      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="article/title">
    <fo:block font-weight="bold">
      <xsl:value-of select="."/>
    </fo:block>
  </xsl:template>

  <xsl:template match="p">
    <fo:block>
      <xsl:attribute name="margin"><xsl:value-of select="$paragraph-spacing"/></xsl:attribute>

      <xsl:apply-templates/>
    </fo:block>
  </xsl:template>

  <xsl:template match="strong">
    <fo:inline font-weight="bold">
      <xsl:value-of select="."/>
    </fo:inline>
  </xsl:template>

  <xsl:template match="em">
    <fo:inline font-style="italic">
      <xsl:value-of select="."/>
    </fo:inline>
  </xsl:template>

</xsl:stylesheet>