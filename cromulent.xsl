<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="xml" version="1.0" indent="yes" encoding="UTF-8"/>
  
  <xsl:variable name="font-size">12pt</xsl:variable>
  <xsl:variable name="page-width">108.0mm</xsl:variable>
  <xsl:variable name="page-height">174.5mm</xsl:variable>
  <xsl:variable name="page-margin">6.35mm</xsl:variable>


  <xsl:template match="html">
    <fo:root xmlns:fo="http://www.w3.org/1999/XSL/Format">
      <xsl:attribute name="font-size"><xsl:value-of select="$font-size"/></xsl:attribute>

      <fo:layout-master-set>
        <fo:simple-page-master master-name="PageMaster-Left">
          <xsl:attribute name="page-height"><xsl:value-of select="$page-height"/></xsl:attribute>
          <xsl:attribute name="page-width"><xsl:value-of select="$page-width"/></xsl:attribute>
          <xsl:attribute name="margin-bottom"><xsl:value-of select="$page-margin"/></xsl:attribute>
          <xsl:attribute name="margin-left"><xsl:value-of select="$page-margin"/></xsl:attribute>
          <xsl:attribute name="margin-right"><xsl:value-of select="$page-margin"/></xsl:attribute>
          <xsl:attribute name="margin-top"><xsl:value-of select="$page-margin"/></xsl:attribute>

          <fo:region-body margin="0mm 0mm 0mm 0mm"/>

          <fo:region-before region-name="Left-header" extent="10mm" display-align="after"/>
          <fo:region-after region-name="Left-footer" extent="10mm" display-align="before"/>
          <fo:region-start region-name="Left-start" extent="25mm"/>
          <fo:region-end region-name="Left-end" extent="25mm"/>
        </fo:simple-page-master>

        <fo:simple-page-master master-name="PageMaster-Right">
          <xsl:attribute name="page-height"><xsl:value-of select="$page-height"/></xsl:attribute>
          <xsl:attribute name="page-width"><xsl:value-of select="$page-width"/></xsl:attribute>
          <xsl:attribute name="margin-bottom"><xsl:value-of select="$page-margin"/></xsl:attribute>
          <xsl:attribute name="margin-left"><xsl:value-of select="$page-margin"/></xsl:attribute>
          <xsl:attribute name="margin-right"><xsl:value-of select="$page-margin"/></xsl:attribute>
          <xsl:attribute name="margin-top"><xsl:value-of select="$page-margin"/></xsl:attribute>

          <fo:region-body margin="0mm 0mm 0mm 0mm"/>
          
          <fo:region-before region-name="Right-header" extent="10mm" display-align="after"/>
          <fo:region-after region-name="Right-footer" extent="10mm" display-align="before"/>
          <fo:region-start region-name="Right-start" extent="25mm"/>
          <fo:region-end region-name="Right-end" extent="25mm"/>
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
        <fo:flow flow-name="xsl-region-body">
          <fo:block>
            Hello
          </fo:block>
        </fo:flow>
      </fo:page-sequence>
  </xsl:template>
    <!--
    <fo:page-sequence master-reference="PageMaster" initial-page-number="1">
      <fo:static-content flow-name="Left-header">
        <fo:block-container absolute-position="fixed" top="0mm" left="25mm" height="15mm">
          <fo:table>
          <fo:table-column column-width="10.6mm" number-columns-repeated="15"/>
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb1"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb2"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb3"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb4"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-boundary="page" retrieve-position="first-including-carryover" retrieve-class-name="thumb5"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb6"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb7"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb8"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb9"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb10"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb11"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb12"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb13"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb14"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb0"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
        </fo:block-container>
        <fo:block font-size="10pt" text-align="center" border-after-width="thin" border-after-style="solid">
          <xsl:value-of select="/doc/head/title"/>
        </fo:block>
      </fo:static-content>
      <fo:static-content flow-name="Right-header">
        <fo:block-container absolute-position="fixed" top="0mm" left="25mm" height="15mm">
          <fo:table>
            <fo:table-column column-width="10.6mm" number-columns-repeated="15"/>
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb1"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb2"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb3"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb4"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb5"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb6"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-boundary="page" retrieve-position="first-starting-within-page" retrieve-class-name="thumb7"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb8"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb9"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb10"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb11"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb12"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb13"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb14"/>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell>
                  <fo:block font-size="24pt" text-align-last="center" color="white" background-color="black" display-align="center">
                    <fo:retrieve-marker xsl:use-attribute-sets="thumb-class" retrieve-class-name="thumb0"/>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
        </fo:block-container>
        <fo:block font-size="10pt" text-align="center" border-after-width="thin" border-after-style="solid">
          <xsl:value-of select="/doc/head/title"/>
        </fo:block>
      </fo:static-content>
       leader for footnote separator 
      <fo:static-content flow-name="xsl-footnote-separator">
        <fo:block>
          <fo:leader leader-pattern="rule" rule-thickness="0.5pt" leader-length="33%"/>
        </fo:block>
      </fo:static-content>
       Left page footer 
      <fo:static-content flow-name="Left-footer">
        <fo:block font-size="9pt" text-align="outside">
          <fo:inline font-size="17pt">
            <fo:page-number/>
            <xsl:text> ｜ </xsl:text>
          </fo:inline>
           retrieve-marker is used to output the section name to left page footer. 
          <fo:retrieve-marker retrieve-boundary="page-sequence" retrieve-position="first-starting-within-page" retrieve-class-name="section-title"/>
        </fo:block>
      </fo:static-content>
       right page footer 
      <fo:static-content flow-name="Right-footer">
        <fo:block font-size="9pt" text-align="outside">
           retrieve-marker is used to output the section name to right page footer. 
          <fo:retrieve-marker retrieve-boundary="page-sequence" retrieve-position="first-starting-within-page" retrieve-class-name="section-title"/>
          <fo:inline font-size="17pt">
            <xsl:text> ｜ </xsl:text>
            <fo:page-number/>
          </fo:inline>
        </fo:block>
      </fo:static-content>
			<fo:static-content flow-name="Left-end"/>
			<fo:static-content flow-name="Right-end"/>
      <fo:flow flow-name="xsl-region-body">
        <fo:block>
          <xsl:apply-templates/>
        </fo:block>
      </fo:flow>
    </fo:page-sequence>
  </xsl:template>-->
</xsl:stylesheet>