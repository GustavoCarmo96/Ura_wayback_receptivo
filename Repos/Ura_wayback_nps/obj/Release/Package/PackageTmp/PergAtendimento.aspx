<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PergAtendimento.aspx.cs" Inherits="Ura_wayback_nps.PergAtendimento" %>

<?xml version="1.0" encoding="utf-8" ?>
<vxml xml:lang="en-US">

    <form id="main">

        <block name="URA_PergAtendimentoRecebido">
            <milestone name="URA_PergAtendimentoRecebido" index="07" />
            <disposition id="278" />
            <menu>
                <prompt>
                    <audio src="PERGATENDIMENTO_INI_01" />
                </prompt>
                <noinput>
                    <goto next="#NoInput" />
                </noinput>
                <nomatch>
                    <goto next="#NoMatch" />
                </nomatch>
                <choice dtmf="1" next="#Op1" />
                <choice dtmf="2" next="#Op2" />
                <choice dtmf="3" next="#Op3" />
                <choice dtmf="4" next="#Op4" />
                <choice dtmf="5" next="#Op5" />
            </menu>
        </block>

        <block name="Op1">
            <milestone name="URA_Digitou1_PergAtendimento" index="08" />
            <disposition id="279" />
            <submit next="PergRecomendacao.aspx" namelist="Dnis Ani callid" />
        </block>

        <block name="Op2">
            <milestone name="URA_Digitou2_PergAtendimento" index="09" />
            <disposition id="280" />
            <submit next="PergRecomendacao.aspx" namelist="Dnis Ani callid" />
        </block>

        <block name="Op3">
            <milestone name="URA_Digitou3__PergAtendimento" index="10" />
            <disposition id="281" />
            <submit next="PergRecomendacao.aspx" namelist="Dnis Ani callid" />
        </block>

        <block name="Op4">
            <milestone name="URA_Digitou4__PergAtendimento" index="11" />
            <disposition id="282" />
            <submit next="PergRecomendacao.aspx" namelist="Dnis Ani callid" />
        </block>

        <block name="Op5">
            <milestone name="URA_Digitou5__PergAtendimento" index="12" />
            <disposition id="283" />
            <submit next="PergRecomendacao.aspx" namelist="Dnis Ani callid" />
        </block>

        <block name="NoInput">
            <menu>
                <prompt>
                    <audio src="PERGATENDIMENTO_NOINPUT_01" />
                </prompt>
                <noinput>
                    <goto next="#MaxNoInput" />
                </noinput>
                <nomatch>
                    <goto next="#MaxNoMatch" />
                </nomatch>
                <choice dtmf="1" next="#Op1" />
                <choice dtmf="2" next="#Op2" />
                <choice dtmf="3" next="#Op3" />
                <choice dtmf="4" next="#Op4" />
                <choice dtmf="5" next="#Op5" />
            </menu>
        </block>

        <block name="NoMatch">
            <menu>
                <prompt>
                    <audio src="PERGATENDIMENTO_NOMATCH_01" />
                </prompt>
                <noinput>
                    <goto next="#MaxNoInput" />
                </noinput>
                <nomatch>
                    <goto next="#MaxNoMatch" />
                </nomatch>
                <choice dtmf="1" next="#Op1" />
                <choice dtmf="2" next="#Op2" />
                <choice dtmf="3" next="#Op3" />
                <choice dtmf="4" next="#Op4" />
                <choice dtmf="5" next="#Op5" />
            </menu>
        </block>

        <block name="MaxNoInput">
            <milestone name="URA_NaoDigitou_PergAtendimento" index="13" />
            <disposition id="284" />
            <submit next="MsgDesliga.aspx" namelist="Dnis Ani callid" />
        </block>

        <block name="MaxNoMatch">
            <milestone name="URA_OpcaoInvalida_PergAtendimento" index="14" />
            <disposition id="285" />
            <submit next="MsgDesliga.aspx" namelist="Dnis Ani callid" />
        </block>


    </form>

    <catch event="hangup">
        <disconnect triggerasyncevent="false" />
    </catch>

    <catch event="*">
        <disconnect triggerasyncevent="false" />
    </catch>

</vxml>
