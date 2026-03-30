<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ura_Receptiva_CDS.Default" %>

<?xml version="1.0" encoding="utf-8" ?>

<vxml xml:lang="en-US">

    <property name="defaultdir" value="IVR\URA_Receptiva_CDS\" />
    <%-- Pasta com audios da URA --%>
    <property name="bargein" value="true" />
    <property name="timeout" value="10" />
    <property name="fetchtimeout" value="5000" />


    <form id="main">
        <block name="inicio_Fluxo">
            <disposition id="5240" />
            <milestone name="URA_IniciouFluxo" index="1" />
            <submit next="PergSejaEAluno.aspx" namelist="ani dnis devicename callId ivrcampaignid callid" />
        </block>
    </form>

    <catch event="hangup">
        <disconnect triggerasyncevent="false" />
    </catch>

    <catch event="*">
        <disconnect triggerasyncevent="false" />
    </catch>

</vxml>
