<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transfer.aspx.cs" Inherits="Ura_wayback_receptivo.Transfer" %>

<?xml version="1.0" encoding="utf-8" ?>

<vxml xml:lang="en-US">
    <form id="main">

        <block name="">
            <%=GetTransfer() %>
        </block>

    </form>

    <block name="Ura_WayBack_NPS">
      <milestone name="URA_Start" index="02" />
      <disposition id="73" />
    </block>

    <catch event="hangup">
        <disconnect triggerasyncevent="false" />
    </catch>

    <catch event="*">
        <disconnect triggerasyncevent="false" />
    </catch>

</vxml>
