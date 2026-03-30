<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PergSejaEAluno.aspx.cs" Inherits="Ura_Receptiva_CDS.PergSejaEAluno" %>

<?xml version="1.0" encoding="utf-8" ?>
<vxml xml:lang="en-US">

    <form>
        <block>
            <milestone name="PerguntaSeJaEAluno" index="2" />
            <disposition id="5644" />
            <menu>
                <prompt>
                    <audio src="PERGSEJAEALUNO_INI_01" />
                </prompt>
                <choice dtmf="1" next="#op1" />
                <choice dtmf="2" next="#op2" />
                <noinput>
                    <goto next="#NoInput" />
                </noinput>
                <nomatch>
                    <goto next="#NoMatch" />
                </nomatch>
            </menu>
        </block>
        <block name="op1">
            <milestone name="Dig1_NaoEAluno" index="3" />
             <prompt>
                <audio src="PERGSEJAEALUNO_DIG1_01" />
            </prompt>
            <disposition id="5645" />
            <goto next="MenuPublicoGeral.aspx" />
        </block>

        <block name="op2">
            <milestone name="Dig3_Ealuno" index="4" />
            <disposition id="5646" />
            <goto next="PergFalarMatricula.aspx" />
        </block>

        <block name="NoMatch">
            <menu>
                <prompt>
                    <audio src="PERGSEJAEALUNO_NOMATCH_01" />
                </prompt>
                <choice dtmf="1" next="#op1" />
                <choice dtmf="2" next="#op2" />
                <noinput>
                    <goto next="#MaxNoInput" />
                </noinput>
                <nomatch>
                    <goto next="#MaxNoMatch" />
                </nomatch>
            </menu>
        </block>

        <block name="MaxNoMatch">
            <milestone name="PerguntaSeJaEAluno_RespInvalida_Desliga" index="6" />
            <prompt>
                <audio src="PERGSEJAEALUNO_MAXNOMATCH_01" />
            </prompt>
            <disposition id="5648" />
            <goto next="#Encerra" />
        </block>

        <block name="NoInput">
            <menu>
                <prompt>
                    <audio src="PERGSEJAEALUNO_NOINPUT_01" />
                </prompt>
                <choice dtmf="1" next="#op1" />
                <choice dtmf="2" next="#op2" />
                <noinput>
                    <goto next="#MaxNoInput" />
                </noinput>
                <nomatch>
                    <goto next="#MaxNoMatch" />
                </nomatch>
            </menu>
        </block>

        <block name="MaxNoInput">
            <milestone name="PerguntaSeJaEAluno_SemResposta_Desliga" index="5" />
            <prompt>
                <audio src="PERGSEJAEALUNO_MAXNOINPUT_01" />
            </prompt>
            <disposition id="5647" />
            <goto next="#Encerra" />
        </block>

        <block name="Encerra">
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
