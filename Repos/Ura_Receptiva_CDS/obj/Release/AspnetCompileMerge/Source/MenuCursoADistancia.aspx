<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuCursoADistancia.aspx.cs" Inherits="Ura_Receptiva_CDS.MenuCursoADistancia" %>

<?xml version="1.0" encoding="utf-8" ?>
<vxml xml:lang="en-US">

    <form>
        <block>
            <milestone name="MenuGradPresencial" index="24" />
            <disposition id="5666" />
            <menu>
                <prompt>
                    <audio src="MENUCURSOADISTANCIA_INI_01" />
                </prompt>
                <choice dtmf="0" next="#op0" />
                <choice dtmf="1" next="#op1" />
                <choice dtmf="2" next="#op2" />
                <choice dtmf="3" next="#op3" />
                <noinput>
                    <goto next="#NoInput" />
                </noinput>
                <nomatch>
                    <goto next="#NoMatch" />
                </nomatch>
            </menu>
        </block>

        <block name="op0">
            <milestone name="ADistancia_Dig0_VoltarAoMenu" index="25" />
            <disposition id="5667" />
            <goto next="MenuPublicoGeral.aspx" />
        </block>

        <block name="op1">
            <milestone name="ADistancia_Dig1_2ªGraduacaoOuTransferencia" index="26" />
            <prompt>
                <audio src="MENUCURSOADISTANCIA_DIG123_01" />
            </prompt>
            <disposition id="5668" />
            <goto next="Transfer.aspx?menu=cursoadistancia&amp;opcao=1" />
        </block>

        <block name="op2">
            <milestone name="ADistancia_Dig2_FormasDeIngresso" index="27" />
            <prompt>
                <audio src="MENUCURSOADISTANCIA_DIG123_01" />
            </prompt>
            <disposition id="5669" />
            <goto next="Transfer.aspx?menu=cursoadistancia&amp;opcao=2" />
        </block>

        <block name="op3">
            <milestone name="ADistancia_Dig3_ProgramEstudantis" index="28" />
            <prompt>
                <audio src="MENUCURSOADISTANCIA_DIG123_01" />
            </prompt>
            <disposition id="5670" />
            <goto next="Transfer.aspx?menu=cursoadistancia&amp;opcao=3" />
        </block>

        <block name="NoMatch">
            <menu>
                <prompt>
                    <audio src="MENUCURSOADISTANCIA_NOMATCH_01" />
                </prompt>
                <choice dtmf="0" next="#op0" />
                <choice dtmf="1" next="#op1" />
                <choice dtmf="2" next="#op2" />
                <choice dtmf="3" next="#op3" />
                <noinput>
                    <goto next="#MaxNoInput" />
                </noinput>
                <nomatch>
                    <goto next="#MaxNoMatch" />
                </nomatch>
            </menu>
        </block>

        <block name="MaxNoMatch">
            <milestone name="MenuCursoADistancia_RespostaInvalida" index="30" />
            <prompt>
                <audio src="MENUCURSOADISTANCIA_MAXNOMATCH_01" />
            </prompt>
            <disposition id="5672" />
            <goto next="#Encerra" />
        </block>

        <block name="NoInput">
            <menu>
                <prompt>
                    <audio src="MENUCURSOADISTANCIA_NOINPUT_01" />
                </prompt>
                <choice dtmf="0" next="#op0" />
                <choice dtmf="1" next="#op1" />
                <choice dtmf="2" next="#op2" />
                <choice dtmf="3" next="#op3" />
                <noinput>
                    <goto next="#MaxNoInput" />
                </noinput>
                <nomatch>
                    <goto next="#MaxNoMatch" />
                </nomatch>
            </menu>
        </block>

        <block name="MaxNoInput">
            <milestone name="MenuCursoADistancia_SemResposta" index="29" />
            <prompt>
                <audio src="MENUCURSOADISTANCIA_MAXNOINPUT_01" />
            </prompt>
            <disposition id="5671" />
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