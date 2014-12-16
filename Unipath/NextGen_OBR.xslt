<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://tempuri.org/NextGen_OBR.xsd" xmlns:a="http://tempuri.org/Labworks_NextGen_OBR.xsd" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:AIEScript="urn:csharp_script" exclude-result-prefixes="a AIEScript">
	<xsl:output method="xml" encoding="UTF-8"/>
	<msxsl:script language="C#" implements-prefix="AIEScript">
		<![CDATA[
		
		]]>
	</msxsl:script>
	
	<!-- Version 1.9 01/08/2007 Elliott Tran
		Client changed input message so that DG1 is after OBR
		Added DG1 under OBR/NTE in XML
		Changed logic to accomodate DG1 after OBR
	-->

	<!-- Version 2.0 05/24/2010 Kevin Brown
			IT# 61975
			Remove IN1 segment
	-->

	<!-- Version 2.1 06/07/2010 Kevin Brown
			IT# 62839
			Only allow a maximum of 40 characters in DG1-3-1
	-->
	
	<xsl:template match="/a:Order">
		<Order>
			<MSH>
				<xsl:apply-templates select="a:MSH"/>
			</MSH>
			<!--<xsl:copy-of select="a:FTS"/>-->
		</Order>
	</xsl:template>
	
	<xsl:template match="a:MSH/*">
		<xsl:choose>
			<xsl:when test="name()='MSH-2'">
				<MSH-2><xsl:value-of select="'ATLAS'"/></MSH-2>
			</xsl:when>
			<xsl:when test="name()='MSH-4'">
				<MSH-4><xsl:value-of select="'NEXTGEN'"/></MSH-4>
			</xsl:when>
		<!-- hardcode MSH-12 to 2.5 jjp 01/25/06-->
			<xsl:when test="name()='MSH-11'">
				<MSH-11>
					<xsl:value-of select="'2.5'"/>
				</MSH-11>
			</xsl:when>
		<!-- hardcode MSH-15 to AL jjp 01/25/06-->
			<xsl:when test="name()='MSH-14'">
				<MSH-14>
					<xsl:value-of select="'AL'"/>
				</MSH-14>			
			</xsl:when>
			<xsl:when test="name()='PID'">
				<PID>
					<xsl:call-template name="PID-template"/>
				</PID>
			</xsl:when>
			<xsl:when test="name()='EVN'">
				<EVN>
					<xsl:apply-templates/>
				</EVN>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="."/>
			</xsl:otherwise>
		</xsl:choose>	
	</xsl:template>
	
	<xsl:template match="a:EVN/*">
		<xsl:copy-of select="."/>	
	</xsl:template>
	
	<xsl:template name="PID-template">		
		<xsl:copy-of select="./a:PID-0"/>
		<PID-1><xsl:value-of select="'1'"/></PID-1>
		<xsl:copy-of select="./a:PID-2"/>
		<xsl:copy-of select="./a:PID-3"/>
		<xsl:copy-of select="./a:PID-4"/>
		<xsl:copy-of select="./a:PID-5"/>
		<xsl:copy-of select="./a:PID-6"/>
		<xsl:copy-of select="./a:PID-7"/>
		<xsl:copy-of select="./a:PID-8"/>
		<xsl:copy-of select="./a:PID-9"/>
		<xsl:copy-of select="./a:PID-10"/>
		<xsl:copy-of select="./a:PID-11"/>
		<xsl:copy-of select="./a:PID-12"/>
		<xsl:copy-of select="./a:PID-13"/>
		<xsl:copy-of select="./a:PID-14"/>
		<xsl:copy-of select="./a:PID-15"/>
		<PID-16>
			<xsl:value-of select="./a:PID-16"/>
		</PID-16>
		<PID-17>
			<xsl:value-of select="./a:PID-17"/>
		</PID-17>
		<xsl:copy-of select="./a:PID-18"/>
		<xsl:copy-of select="./a:PID-19"/>
				
		<xsl:for-each select="./a:PV1">
			<PV1>
				<xsl:call-template name="PV1-template">
					<xsl:with-param name="this-PV1-node" select="."/>
				</xsl:call-template>
			</PV1>
		</xsl:for-each>
		
		<!--Version 2.0 Remove IN1 segment-->
		<!--<xsl:for-each select="./a:IN1">
			<IN1>
				<xsl:call-template name="IN1-template">
					<xsl:with-param name="this-IN1-node" select="."/>
				</xsl:call-template>
			</IN1>
		</xsl:for-each>-->
		
		<xsl:for-each select="./a:GT1">
			<GT1>
				<xsl:call-template name="GT1-template">
					<xsl:with-param name="this-GT1-node" select="."/>
				</xsl:call-template>
			</GT1>
		</xsl:for-each>
		
		<xsl:for-each select="./a:ORC">
			<ORC>
				<xsl:call-template name="ORC-template">
					<xsl:with-param name="this-ORC-node" select="."/>
				</xsl:call-template>
			</ORC>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="IN1-template">
	<xsl:param name="this-IN1-node"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-0"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-1"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-2"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-3"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-4"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-5"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-6"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-7"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-8"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-9"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-10"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-11"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-12"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-13"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-14"/>
		<IN1-15></IN1-15>
		<xsl:copy-of select="$this-IN1-node/a:IN1-16"/>
		<IN1-17>
			<xsl:choose>
				<xsl:when test="$this-IN1-node/a:IN1-17='Father' or $this-IN1-node/a:IN1-17='Mother'">19</xsl:when>
				<xsl:when test="$this-IN1-node/a:IN1-17='Grandfather' or $this-IN1-node/a:IN1-17='Grandmother'">04</xsl:when>
				<xsl:when test="$this-IN1-node/a:IN1-17='Granddaughter' or $this-IN1-node/a:IN1-17='Grandson'">05</xsl:when>
				<xsl:when test="$this-IN1-node/a:IN1-17='Wife' or $this-IN1-node/a:IN1-17='Husband' or $this-IN1-node/a:IN1-17='Spouse'">01</xsl:when>
				<xsl:when test="$this-IN1-node/a:IN1-17='Partner'">53</xsl:when>
				<xsl:when test="$this-IN1-node/a:IN1-17='Self'">99</xsl:when>
				<xsl:when test="$this-IN1-node/a:IN1-17='Son' or $this-IN1-node/a:IN1-17='Daughter'">
					<xsl:choose>
						<xsl:when test="../a:PID/a:PID-8='F'">32</xsl:when>
						<xsl:when test="../a:PID/a:PID-8='M'">33</xsl:when>
						<xsl:otherwise>G8</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>G8</xsl:otherwise>
			</xsl:choose>			
		</IN1-17>
		<xsl:copy-of select="$this-IN1-node/a:IN1-18"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-19"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-20"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-21"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-22"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-23"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-24"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-25"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-26"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-27"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-28"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-29"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-30"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-31"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-32"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-33"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-34"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-35"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-36"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-37"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-38"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-39"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-40"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-41"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-42"/>
		<xsl:copy-of select="$this-IN1-node/a:IN1-43"/>		
		<!-- strip IN2 jjp 01/25/06 -->
			<!--<xsl:when test="name()='IN2'"/>			
			<xsl:otherwise>
				<xsl:copy-of select="."/>
			</xsl:otherwise>
		</xsl:choose>-->
	</xsl:template>	

	<xsl:template name="GT1-template">
	<xsl:param name="this-GT1-node"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-0"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-1"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-2"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-3"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-4"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-5"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-6"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-7"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-8"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-9"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-10"/>
		<GT1-11>
			<xsl:choose>
				<xsl:when test="$this-GT1-node/a:GT1-11='Father' or $this-GT1-node/a:GT1-11='Mother'">19</xsl:when>
				<xsl:when test="$this-GT1-node/a:GT1-11='Grandfather' or $this-GT1-node/a:GT1-11='Grandmother'">04</xsl:when>
				<xsl:when test="$this-GT1-node/a:GT1-11='Granddaughter' or $this-GT1-node/a:GT1-11='Grandson'">05</xsl:when>
				<xsl:when test="$this-GT1-node/a:GT1-11='Wife' or $this-GT1-node/a:GT1-11='Husband' or $this-GT1-node/a:GT1-11='Spouse'">01</xsl:when>
				<xsl:when test="$this-GT1-node/a:GT1-11='Partner'">53</xsl:when>
				<xsl:when test="$this-GT1-node/a:GT1-11='Self'">99</xsl:when>
				<xsl:when test="$this-GT1-node/a:GT1-11='Son' or $this-GT1-node/a:GT1-11='Daughter'">
					<xsl:choose>
						<xsl:when test="../a:PID/a:PID-8='F'">32</xsl:when>
						<xsl:when test="../a:PID/a:PID-8='M'">33</xsl:when>
						<xsl:otherwise>G8</xsl:otherwise>
					</xsl:choose>
				</xsl:when>
				<xsl:otherwise>G8</xsl:otherwise>
			</xsl:choose>			
		</GT1-11>
		<xsl:copy-of select="$this-GT1-node/a:GT1-12"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-13"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-14"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-15"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-16"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-17"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-18"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-19"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-20"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-21"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-22"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-23"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-24"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-25"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-26"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-27"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-28"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-29"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-30"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-31"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-32"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-33"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-34"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-35"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-36"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-37"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-38"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-39"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-40"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-41"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-42"/>
		<xsl:copy-of select="$this-GT1-node/a:GT1-43"/>		
		<!-- strip IN2 jjp 01/25/06 -->
			<!--<xsl:when test="name()='IN2'"/>			
			<xsl:otherwise>
				<xsl:copy-of select="."/>
			</xsl:otherwise>
		</xsl:choose>-->
	</xsl:template>	
	
	<xsl:template name="ORC-template">
	<xsl:param name="this-ORC-node"/>
		<xsl:copy-of select="$this-ORC-node/a:ORC-0"/>
		<xsl:copy-of select="$this-ORC-node/a:ORC-1"/>
		<xsl:copy-of select="$this-ORC-node/a:ORC-2"/>
		<ORC-3>
			<xsl:value-of select="$this-ORC-node/a:ORC-2"/>		
		</ORC-3>
		<xsl:copy-of select="$this-ORC-node/a:ORC-4"/>
		<xsl:copy-of select="$this-ORC-node/a:ORC-5"/>
		<xsl:copy-of select="$this-ORC-node/a:ORC-6"/>
		<xsl:copy-of select="$this-ORC-node/a:ORC-7"/>
		<xsl:copy-of select="$this-ORC-node/a:ORC-8"/>
		<xsl:copy-of select="$this-ORC-node/a:ORC-9"/>
		<xsl:copy-of select="$this-ORC-node/a:ORC-10"/>
		<xsl:copy-of select="$this-ORC-node/a:ORC-11"/>
		<xsl:copy-of select="$this-ORC-node/a:ORC-12"/>
		
		<xsl:for-each select="$this-ORC-node/a:NTE">
			<NTE>
				<xsl:call-template name="NTE-template">
					<xsl:with-param name="this-node" select="."/>
				</xsl:call-template>
			</NTE>
		</xsl:for-each>
		<xsl:for-each select="$this-ORC-node/a:OBR">
			<OBR>
				<xsl:call-template name="OBR-template">
					<xsl:with-param name="this-node" select="."/>
					<!-- No longer needs as client is sending DG1 after OBR 
					<xsl:with-param name="DG1-node" select="$this-ORC-node"/> -->
				</xsl:call-template>
			</OBR>
		</xsl:for-each>
		<!--
		<xsl:for-each select="$this-ORC-node/a:DG1">
			<DG1>
				<xsl:call-template name="DG1-template">
					<xsl:with-param name="this-node" select="."/>
				</xsl:call-template>
			</DG1>
		</xsl:for-each> -->
		
	</xsl:template>
	
	<xsl:template name="DG1-template">
	<xsl:param name="this-node"/>
		<xsl:copy-of select="$this-node/a:DG1-0"/>
		<xsl:copy-of select="$this-node/a:DG1-1"/>
		<DG1-2><xsl:value-of select="'I9'"/></DG1-2>
		<DG1-3>
		<!-- move DG1-4 to DG1-3 jjp 01/25/06 -->
			<DG1-3-0><xsl:value-of select="$this-node/a:DG1-4/a:DG1-4-0"/></DG1-3-0>
			<DG1-3-1><xsl:value-of select="substring($this-node/a:DG1-4/a:DG1-4-1,1,39)"/></DG1-3-1>
			<DG1-3-2><xsl:value-of select="'I9'"/></DG1-3-2>
		</DG1-3>
		<DG1-4><xsl:value-of select="substring($this-node/a:DG1-4/a:DG1-4-1,1,39)"/></DG1-4>
	</xsl:template>
	
	<xsl:template name="OBR-template">
	<xsl:param name="this-node"/>
	<!-- No longer needs as client is sending DG1 after OBR
	<xsl:param name="DG1-node"/> -->
		<xsl:copy-of select="$this-node/a:OBR-0"/>
		<xsl:copy-of select="$this-node/a:OBR-1"/>
		<xsl:copy-of select="$this-node/a:OBR-2"/>
		<OBR-3>
			<xsl:value-of select="$this-node/a:OBR-2"/>
		</OBR-3>		
		<xsl:copy-of select="$this-node/a:OBR-4"/>
		<xsl:copy-of select="$this-node/a:OBR-5"/>
		<xsl:copy-of select="$this-node/a:OBR-6"/>
		<xsl:copy-of select="$this-node/a:OBR-7"/>
		<xsl:copy-of select="$this-node/a:OBR-8"/>
		<xsl:copy-of select="$this-node/a:OBR-9"/>
		<xsl:copy-of select="$this-node/a:OBR-10"/>
		<OBR-11><xsl:value-of select="'N'"/></OBR-11>
		<xsl:copy-of select="$this-node/a:OBR-12"/>
		<xsl:copy-of select="$this-node/a:OBR-13"/>
		<xsl:copy-of select="$this-node/a:OBR-14"/>
		<xsl:copy-of select="$this-node/a:OBR-15"/>
		<xsl:copy-of select="$this-node/a:OBR-16"/>
		<xsl:copy-of select="$this-node/a:OBR-17"/>
		<xsl:copy-of select="$this-node/a:OBR-18"/>
		<xsl:copy-of select="$this-node/a:OBR-19"/>
		<xsl:copy-of select="$this-node/a:OBR-20"/>
		<xsl:copy-of select="$this-node/a:OBR-21"/>
		<xsl:copy-of select="$this-node/a:OBR-22"/>
		<xsl:copy-of select="$this-node/a:OBR-23"/>
		<xsl:copy-of select="$this-node/a:OBR-24"/>
		<xsl:copy-of select="$this-node/a:OBR-25"/>
		<xsl:copy-of select="$this-node/a:OBR-26"/>		
		<OBR-27>
			<xsl:copy-of select="$this-node/a:OBR-27/a:OBR-27-0"/>
			<xsl:copy-of select="$this-node/a:OBR-27/a:OBR-27-1"/>
			<xsl:copy-of select="$this-node/a:OBR-27/a:OBR-27-2"/>
			<xsl:copy-of select="$this-node/a:OBR-27/a:OBR-27-3"/>
			<xsl:copy-of select="$this-node/a:OBR-27/a:OBR-27-4"/>
			<xsl:copy-of select="$this-node/a:OBR-27/a:OBR-27-5"/>
			<!-- if OBR-27-6 is Null fill it with R, otherwise keep it's value jjp 01/25/06 -->
			<xsl:if test="$this-node/a:OBR-27/a:OBR-27-6=''">
				<OBR-27-6><xsl:value-of select="'R'"/></OBR-27-6>
			</xsl:if>
			<xsl:if test="$this-node/a:OBR-27/a:OBR-27-6!=''">
				<OBR-27-6><xsl:value-of select="$this-node/a:OBR-27/a:OBR-27-6"/></OBR-27-6>
			</xsl:if>
		</OBR-27>		
		<xsl:copy-of select="$this-node/a:OBR-28"/>
	
		<xsl:for-each select="$this-node/a:NTE">
			<NTE>
				<xsl:call-template name="NTE-template">
					<xsl:with-param name="this-node" select="."/>
				</xsl:call-template>
			</NTE>
		</xsl:for-each>
		
		<!--<xsl:for-each select="//a:MSH/a:PID/a:ORC/a:DG1">-->
		
		<xsl:for-each select="$this-node/a:DG1">
			<DG1>
				<xsl:call-template name="DG1-template">
					<xsl:with-param name="this-node" select="."/>
				</xsl:call-template>
			</DG1>
		</xsl:for-each>
		<xsl:copy-of select="$this-node/a:OBX"/>
	</xsl:template>
	
	<xsl:template name="NTE-template">
		<xsl:param name="this-node"/>
		<NTE-0><xsl:value-of select="$this-node/a:NTE-0"/></NTE-0>
		<NTE-1><xsl:value-of select="$this-node/a:NTE-1"/></NTE-1>
		<NTE-2><xsl:value-of select="'O'"/></NTE-2>
		<NTE-3><xsl:value-of select="$this-node/a:NTE-3"/></NTE-3>
		<!--<NTE-4><xsl:value-of select="$this-node/a:NTE-4"/></NTE-4>-->
	</xsl:template>
	
	<xsl:template name="PV1-template">
	<xsl:param name="this-PV1-node"/>
		<xsl:copy-of select="$this-PV1-node/a:PV1-0"/>
		<xsl:copy-of select="$this-PV1-node/a:PV1-1"/>
		<xsl:copy-of select="$this-PV1-node/a:PV1-2"/>
		<xsl:copy-of select="$this-PV1-node/a:PV1-3"/>
		<xsl:copy-of select="$this-PV1-node/a:PV1-4"/>
		<xsl:copy-of select="$this-PV1-node/a:PV1-5"/>
		<xsl:copy-of select="$this-PV1-node/a:PV1-6"/>
		
		<xsl:if test="$this-PV1-node/a:PV1-7=''">
			<PV1-7><xsl:value-of select="./a:ORC/a:OBR/a:OBR-16/a:OBR-16-0"/>^<xsl:value-of select="./a:ORC/a:OBR/a:OBR-16/a:OBR-16-1"/>^<xsl:value-of select="./a:ORC/a:OBR/a:OBR-16/a:OBR-16-2"/>^<xsl:value-of select="./a:ORC/a:OBR/a:OBR-16/a:OBR-16-3"/></PV1-7>
			<!--<PV1-7><xsl:value-of select="$this-PV1-node/a:PV1-7"/></PV1-7>-->
		</xsl:if>
		<xsl:if test="not($this-PV1-node/a:PV1-7='')">		
			<PV1-7><xsl:value-of select="$this-PV1-node/a:PV1-7"/></PV1-7>
		</xsl:if>		
		
		<xsl:copy-of select="$this-PV1-node/a:PV1-8"/>		
		<xsl:copy-of select="$this-PV1-node/a:PV1-9"/>
		<xsl:copy-of select="$this-PV1-node/a:PV1-10"/>
		<xsl:copy-of select="$this-PV1-node/a:PV1-11"/>
		<xsl:copy-of select="$this-PV1-node/a:PV1-12"/>
		<xsl:copy-of select="$this-PV1-node/a:PV1-13"/>
		<xsl:copy-of select="$this-PV1-node/a:PV1-14"/>
		<xsl:copy-of select="$this-PV1-node/a:PV1-15"/>
		<xsl:copy-of select="$this-PV1-node/a:PV1-16"/>
		<xsl:copy-of select="$this-PV1-node/a:PV1-17"/>
		<xsl:copy-of select="$this-PV1-node/a:PV1-18"/>
		<xsl:copy-of select="$this-PV1-node/a:PV1-19"/>
	</xsl:template>
</xsl:stylesheet>