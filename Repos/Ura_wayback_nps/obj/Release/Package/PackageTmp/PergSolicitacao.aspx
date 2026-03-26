<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PergSolicitacao.aspx.cs" Inherits="Ura_wayback_nps.PergSolicitacao" %>

<?xml version="1.0" encoding="utf-8" ?>
<vxml xml:lang="en-US">

    <form id="main">

        <block name="PergSolicitacaoFoiResolvida">
            <milestone name="PergSolicitacaoFoiResolvida" index="02" />
            <disposition id="273" />
            <menu>
                <prompt>
                    <audio src="PERGSOLICITACAO_INI_01" />
                </prompt>
                <noinput>
                    <goto next="#NoInput" />
                </noinput>
                <nomatch>
                    <goto next="#NoMatch" />
                </nomatch>
                <choice dtmf="1" next="#Op1" />
                <choice dtmf="2" next="#Op2" />
            </menu>
        </block>

        <block name="Op1">
            <milestone name="URA_Digitou1_SolicitacaoFoiResolvida" index="03" />
            <disposition id="274" />
            <submit next="PergAtendimento.aspx" namelist="Dnis Ani callid" />
        </block>

        <block name="Op2">
            <milestone name="URA_Digitou2_SolicitacaoNaoFoiResolvida" index="04" />
            <disposition id="275" />
            <submit next="PergAtendimento.aspx" namelist="Dnis Ani callid" />
        </block>

        <block name="NoInput">
            <milestone name="pergSolicitacaoNoInput" index="02" />
            <menu>
                <prompt>
                    <audio src="PERGSOLICITACAO_NOINPUT_01" />
                </prompt>
                <noinput>
                    <goto next="#MaxNoInput" />
                </noinput>
                <nomatch>
                    <goto next="#MaxNoMatch" />
                </nomatch>
                <choice dtmf="1" next="#Op1" />
                <choice dtmf="2" next="#Op2" />
            </menu>
        </block>

        <block name="NoMatch">
            <milestone name="pergSolicitacaoNoMatch" index="02" />
            <menu>
                <prompt>
                    <audio src="PERGSOLICITACAO_NOMATCH_01" />
                </prompt>
                <noinput>
                    <goto next="#MaxNoInput" />
                </noinput>
                <nomatch>
                    <goto next="#MaxNoMatch" />
                </nomatch>
                <choice dtmf="1" next="#Op1" />
                <choice dtmf="2" next="#Op2" />
            </menu>
        </block>

        <block name="MaxNoInput">
            <milestone name="URA_NaoDigitou_PergSolicitacao" index="05" />
            <disposition id="276" />
            <submit next="MsgDesliga.aspx" namelist="Dnis Ani callid" />
        </block>

        <block name="MaxNoMatch">
            <milestone name="URA_OpcaoInvalida_PergSolicitacao" index="06" />
            <disposition id="277" />
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
