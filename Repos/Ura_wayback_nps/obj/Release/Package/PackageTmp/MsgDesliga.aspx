<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MsgDesliga.aspx.cs" Inherits="Ura_wayback_nps.MsgDesliga" %>

<?xml version="1.0" encoding="utf-8" ?>
<vxml xml:lang="en-US">

    <form id="main">

        <block>
            <prompt>
                <audio src="MSGDESLIGA_INI_01" />
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
