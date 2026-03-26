<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Ura_wayback_receptivo.Default" %>

<?xml version="1.0" encoding="utf-8" ?>

<vxml xml:lang="en-US">
    <property name="defaultdir" value="IVR\Ura_wayback_receptivo\" />
    <property name="bargein" value="true"/>
    <property name="timeout" value="5"/>
    <property name="fetchtimeout" value="5000" />

    <form id="main">

        <block name="inicio_Fluxo">
            <milestone name="URA_Start" index="01" />
            <disposition id="263" />
        </block>

            <%=GetHorario()%>

    </form>
    
    <catch event="hangup">
        <disconnect triggerasyncevent="false" />
    </catch>

    <catch event="*">
        <disconnect triggerasyncevent="false" />
    </catch>

</vxml>