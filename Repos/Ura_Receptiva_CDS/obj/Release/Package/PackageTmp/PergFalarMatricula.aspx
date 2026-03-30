<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PergFalarMatricula.aspx.cs" Inherits="Ura_Receptiva_CDS.PergFalarMatricula" %>

<?xml version="1.0" encoding="utf-8" ?>
<vxml xml:lang="en-US">

    <form>
        <block>
            <milestone name="PergFalarMatricula" index="38" />
            <disposition id="5680" />
            <menu>
                <prompt>
                    <audio src="PERGFALARMATRICULA_INI_01" />
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
            <milestone name="Dig1_NaoEAluno" index="39" />
             <prompt>
                <audio src="PERGFALARMATRICULA_DIG1_01" />
            </prompt>
            <disposition id="5681" />
            <goto next="#Encerra" />
        </block>

        <block name="op2">
            <milestone name="Dig3_Ealuno" index="40" />
             <prompt>
                <audio src="PERGFALARMATRICULA_DIG2_01" />
            </prompt>
            <disposition id="5682" />
            <goto next="MenuPublicoGeral.aspx" />
        </block>

        <block name="NoMatch">
            <menu>
                <prompt>
                    <audio src="PERGFALARMATRICULA_NOMATCH_01" />
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
            <milestone name="PergFalarMatricula_RespostaInvalida" index="42" />
            <prompt>
                <audio src="PERGFALARMATRICULA_MAXNOMATCH_01" />
            </prompt>
            <disposition id="5684" />
            <goto next="#Encerra" />
        </block>

        <block name="NoInput">
            <menu>
                <prompt>
                    <audio src="PERGFALARMATRICULA_NOINPUT_01" />
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
            <milestone name="PergFalarMatricula_SemResposta" index="41" />
            <prompt>
                <audio src="PERGFALARMATRICULA_MAXNOINPUT_01" />
            </prompt>
            <disposition id="5683" />
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

