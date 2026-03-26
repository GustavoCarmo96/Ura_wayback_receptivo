<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MsgAgradece.aspx.cs" Inherits="Ura_wayback_nps.MsgAgradece" %>

<?xml version="1.0" encoding="utf-8" ?>
<vxml xml:lang="en-US">

    <form id="main">

        <block>
            <prompt>
                <audio src="MSGAGRADECE_INI_01" />
            </prompt>
            <disconnect triggerasyncevent="false" />
        </block>

    </form>

    <catch event="hangup">
        <disconnect triggerasyncevent="false" />
    </catch>

    <catch event="*">
        <disconnect triggerasyncevent="false" />
    </catch>

</vxml>
