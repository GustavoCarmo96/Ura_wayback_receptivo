<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuPosGraduacao.aspx.cs" Inherits="Ura_Receptiva_CDS.MenuPosGraduacao" %>

<?xml version="1.0" encoding="utf-8" ?>
<vxml xml:lang="en-US">

    <form>
        <block>
            <milestone name="MenuPosGraduacao" index="31" />
            <disposition id="5673" />
            <menu>
                <prompt>
                    <audio src="MENUPOSGRADUACAO_INI_01" />
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
            <milestone name="PosGrad_Dig0_VoltarAoMenu" index="32" />
            <disposition id="5674" />
            <goto next="MenuPublicoGeral.aspx" />
        </block>

        <block name="op1">
            <milestone name="PosGrad_Dig1_EAD_Transf" index="33" />
            <prompt>
                <audio src="MENUPOSGRADUACAO_DIG123_01" />
            </prompt>
            <disposition id="5675" />
            <goto next="Transfer.aspx?menu=posgraduacao&amp;opcao=1" />
        </block>

        <block name="op2">
            <milestone name="PosGrad_Dig2_PosPresencial_Transf" index="34" />
            <prompt>
                <audio src="MENUPOSGRADUACAO_DIG123_01" />
            </prompt>
            <disposition id="5676" />
            <goto next="Transfer.aspx?menu=posgraduacao&amp;opcao=2" />
        </block>

        <block name="op3">
            <milestone name="PosGrad_Dig3_Doutorado_Mestrado_Transf" index="35" />
            <prompt>
                <audio src="MENUPOSGRADUACAO_DIG123_01" />
            </prompt>
            <disposition id="5677" />
            <goto next="Transfer.aspx?menu=posgraduacao&amp;opcao=3" />
        </block>

        <block name="NoMatch">
            <menu>
                <prompt>
                    <audio src="MENUPOSGRADUACAO_NOMATCH_01" />
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
            <milestone name="MenuPosGraduacao_RespostaInválida" index="37" />
            <prompt>
                <audio src="MENUPOSGRADUACAO_MAXNOMATCH_01" />
            </prompt>
            <disposition id="5679" />
            <goto next="#Encerra" />
        </block>

        <block name="NoInput">
            <menu>
                <prompt>
                    <audio src="MENUPOSGRADUACAO_NOINPUT_01" />
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
            <milestone name="MenuPosGraduacao_SemResposta" index="36" />
            <prompt>
                <audio src="MENUPOSGRADUACAO_MAXNOINPUT_01" />
            </prompt>
            <disposition id="5678" />
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