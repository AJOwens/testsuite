<!--
 | (C) Copyright IBM Corporation 2001, 2004. All Rights Reserved.
 | This file is part of the DITA package on IBM's developerWorks site.
 | See license.txt for disclaimers and permissions.
 |
 | The Darwin Information Typing Architecture (DITA) was orginated by
 | IBM's XML Workgroup and ID Workbench tools team.
 |
 | Refer to this file by the following public identfier or an appropriate
 | system identifier:
 |
 |   PUBLIC "-//IBM//ELEMENTS DITA FAQ//EN"
 |
 | Release history (vrm):
 |   1.1.2 Release 1.2 June 2003 (dita12.zip)
 |   1.1.3 Release 1.3 March 2004: bug fixes and map updates
 *-->


<!-- ============ Hooks for domain extension ============ -->
<!ENTITY % faqbody "faqbody">
<!ENTITY % faqgroup "faqgroup">
<!ENTITY % faqlist "faqlist">
<!ENTITY % faqitem "faqitem">
<!ENTITY % faqquest "faqquest">
<!ENTITY % faqans "faqans">
<!ENTITY % faqprop "faqprop">
<!ENTITY % name "name">
<!ENTITY % ownerEmail "ownerEmail">

<!-- ============ Hooks for shell DTD ============ -->
<!ENTITY % faq-info-types "%info-types;">
<!ENTITY included-domains "">

<!-- ============ Element definitions ============ -->
<!ELEMENT faq         ((%title;), (%titlealts;)?, (%shortdesc;)?, (%prolog;)?, (%faqbody;), (%related-links;)?, (%faq-info-types;)* )>
<!ATTLIST faq             id ID #REQUIRED
                          conref CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
                          xml:lang NMTOKEN #IMPLIED
                          DTDVersion CDATA #FIXED "&DTDVersion;"
                          domains CDATA "&included-domains;"
>

<!ELEMENT faqbody     ((%faqgroup;)+ | (%faqlist;))>
<!ATTLIST faqbody         %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!ELEMENT faqgroup    ((%title;), (%faqlist;))>
<!ATTLIST faqgroup        spectitle CDATA #IMPLIED
                          %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!ELEMENT faqlist     (%faqitem;)+>
<!ATTLIST faqlist         relcolwidth CDATA #IMPLIED
                          keycol NMTOKEN #IMPLIED
                          refcols NMTOKENS #IMPLIED
                          %display-atts;
                          %univ-atts;
                          spectitle CDATA #IMPLIED
                          outputclass CDATA #IMPLIED
>

<!ELEMENT faqitem     ((%faqquest;), (%faqans;), (%faqprop;)?)>
<!ATTLIST faqitem         %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!ELEMENT faqquest    (%tblcell.cnt;)*>
<!ATTLIST faqquest        %univ-atts;
                          specentry CDATA "Question"
                          outputclass CDATA #IMPLIED
>

<!ELEMENT faqans      (%tblcell.cnt;)*>
<!ATTLIST faqans          %univ-atts;
                          specentry CDATA "Answer"
                          outputclass CDATA #IMPLIED
>

<!ELEMENT faqprop     (%ownerEmail;)*>
<!ATTLIST faqprop         %univ-atts;
                          specentry CDATA "Properties"
                          outputclass CDATA #IMPLIED
>

<!ELEMENT name        (#PCDATA)>
<!ATTLIST name            %univ-atts;
                          outputclass CDATA #IMPLIED
>

<!ELEMENT ownerEmail  (%name;)*>
<!ATTLIST ownerEmail      href CDATA #IMPLIED
                          keyref NMTOKEN #IMPLIED
                          %univ-atts;
                          format CDATA "mailto"
                          scope (local | peer | external) "external"
                          outputclass CDATA #IMPLIED
>



<!-- ============ Element specialization declarations ============ -->
<!ATTLIST faq         class  CDATA "- topic/topic       faq/faq ">
<!ATTLIST faqbody     class  CDATA "- topic/body        faq/faqbody ">
<!ATTLIST faqgroup    class  CDATA "- topic/section     faq/faqgroup ">
<!ATTLIST faqlist     class  CDATA "- topic/simpletable faq/faqlist ">

<!ATTLIST faqitem     class  CDATA "- topic/strow       faq/faqitem ">
<!ATTLIST faqquest    class  CDATA "- topic/stentry     faq/faqquest ">
<!ATTLIST faqans      class  CDATA "- topic/stentry     faq/faqans ">
<!ATTLIST faqprop     class  CDATA "- topic/stentry     faq/faqprop ">
<!ATTLIST name        class  CDATA "- topic/ph          faq/name ">
<!ATTLIST ownerEmail  class  CDATA "- topic/xref        faq/ownerEmail ">
