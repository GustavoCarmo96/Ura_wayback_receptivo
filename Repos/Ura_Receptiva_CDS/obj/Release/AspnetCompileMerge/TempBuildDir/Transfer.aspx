<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transfer.aspx.cs" Inherits="Ura_Receptiva_CDS.Transfer" %>

<?xml version="1.0" encoding="utf-8" ?>

<vxml xml:lang="en-US">
    <form id="main">

        <block name="Transfer">
            <%=GetTransfer() %>
        </block>

    </form>

    <catch event="hangup">
        <disconnect triggerasyncevent="false" />
    </catch>

    <catch event="*">
        <disconnect triggerasyncevent="false" />
    </catch>

</vxml>