<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PergRecomendacao.aspx.cs" Inherits="Ura_wayback_nps.PergRecomendacao" %>

<?xml version="1.0" encoding="utf-8" ?>
<vxml xml:lang="en-US">

    <form id="main">

        <block name="URA_PergProbabilidade">
            <milestone name="URA_PergProbabilidade" index="15" />
            <disposition id="286" />
            <menu>
                <prompt>
                    <audio src="PERGRECOMENDACAO_INI_01" />
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
            <milestone name="URA_Digitou1_PergProbabilidade" index="16" />
            <disposition id="287" />
            <submit next="PergRecomendacao.aspx" namelist="Dnis Ani callid" />
        </block>

        <block name="Op2">
            <milestone name="URA_Digitou2_PergProbabilidade" index="17" />
            <disposition id="288" />
            <submit next="PergRecomendacao.aspx" namelist="Dnis Ani callid" />
        </block>

        <block name="Op3">
            <milestone name="URA_Digitou3_PergProbabilidade" index="18" />
            <disposition id="289" />
            <submit next="PergRecomendacao.aspx" namelist="Dnis Ani callid" />
        </block>

        <block name="Op4">
            <milestone name="URA_Digitou4_PergProbabilidade" index="19" />
            <disposition id="290" />
            <submit next="PergRecomendacao.aspx" namelist="Dnis Ani callid" />
        </block>

        <block name="Op5">
            <milestone name="URA_Digitou5_PergProbabilidade" index="20" />
            <disposition id="291" />
            <submit next="PergRecomendacao.aspx" namelist="Dnis Ani callid" />
        </block>

        <block name="NoInput">
            <menu>
                <prompt>
                    <audio src="PERGRECOMENDACAO_NOINPUT_01" />
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
                    <audio src="PERGRECOMENDACAO_NOMATCH_01" />
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
            <milestone name="URA_NaoDigitou_PergProbabilidade" index="21" />
            <disposition id="292" />
            <submit next="MsgDesliga.aspx" namelist="Dnis Ani callid" />
        </block>

        <block name="MaxNoMatch">
            <milestone name="URA_OpcaoInvalida_PergProbabilidade" index="22" />
            <disposition id="293" />
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
