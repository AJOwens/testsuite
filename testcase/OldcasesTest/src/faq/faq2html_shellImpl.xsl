<?xml version="1.0" encoding="UTF-8" ?>
<!--  
 | Specific override stylesheet for faq (demo)
 | This demonstrates the XSLT override mechanism tied to a specialization.
 |
 | (C) Copyright IBM Corporation 2001, 2002, 2003. All Rights Reserved.
 | This file is part of the DITA package on IBM's developerWorks site.
 | See license.txt for disclaimers.
 +
 | updates:
 *-->

<xsl:stylesheet version="1.0" 
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../../xsl/xslhtml/topic2htmlImpl.xsl"/>
<xsl:import href="../../xsl/xslhtml/domains2html.xsl"/>
<xsl:import href="faq2html.xsl"/>

<!-- =============== start of override tweaks ============== -->
<!-- By removing these override rules, the behavior of the output reverts
     to the basic FAQ output.  These overrides simply add stylistic "sugar"
     to the result. -->

<!-- turn on return links from end of sections (applied to faqgroup) -->
<xsl:variable name="link-top-section">yes</xsl:variable> 

<!-- override the body template to place this toc in the expected location -->
<xsl:template match="*[contains(@class,' topic/body ')]" name="topbody">
  <div>
    <xsl:comment>topic body</xsl:comment>
    <xsl:call-template name="setclass"/>
    <xsl:apply-templates select="@id"/>
    <!-- here, you can generate a toc based on what's a child of body -->
    <xsl:call-template name="gen-qatoc"/>
    <!--xsl:call-template  name="gen-sect-ptoc"/-->
    <xsl:apply-templates select="parent::*/shortdesc" mode="outofline"/>
    <xsl:apply-templates/>
  </div>
</xsl:template>


<!-- Table of faqlist questions (by faqgroup) -->
<xsl:template name="gen-qatoc">
  <p>Questions in this FAQ list:</p>
  <xsl:for-each select="//*[contains(@class,' faq/faqgroup ')]">
    <div>
    <b><xsl:value-of select="*[contains(@class,' topic/title ')]"/></b>
     <xsl:for-each select="*[contains(@class,' faq/faqlist ')]">
     <ol>
      <xsl:for-each select="*[contains(@class,' faq/faqitem ')]">
       <li><a>
         <xsl:attribute name="href">#<xsl:value-of select="generate-id()"/></xsl:attribute>
         <xsl:value-of select="*[contains(@class,' faq/faqquest ')]"/>
       </a>
       <!--recursive call for subtopics here"/-->
       </li>
      </xsl:for-each>
     </ol>
     </xsl:for-each>
    </div>
  </xsl:for-each>
  <hr/>
</xsl:template>


</xsl:stylesheet>
