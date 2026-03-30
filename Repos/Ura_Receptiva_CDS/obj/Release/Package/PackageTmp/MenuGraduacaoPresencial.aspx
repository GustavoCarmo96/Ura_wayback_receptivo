<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuGraduacaoPresencial.aspx.cs" Inherits="Ura_Receptiva_CDS.MenuGraduacaoPresencial" %>

<?xml version="1.0" encoding="utf-8" ?>
<vxml xml:lang="en-US">

    <form>
        <block>
            <milestone name="MenuGradPresencial" index="17" />
            <disposition id="5659" />
            <menu>
                <prompt>
                    <audio src="MENUGRADPRESENCIAL_INI_01" />
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
            <milestone name="Presenc_Dig0_VoltarAoMenu" index="18" />
            <disposition id="5660" />
            <goto next="MenuPublicoGeral.aspx" />
        </block>

        <block name="op1">
            <milestone name="Presenc_Dig1_2ªGraduacaoOuTransferencia" index="19" />
            <prompt>
                <audio src="MENUGRADPRESENCIAL_DIG123_01" />
            </prompt>
            <disposition id="5661" />
            <goto next="Transfer.aspx?menu=gradpresencial&amp;opcao=1" />
        </block>

        <block name="op2">
            <milestone name="Presenc_Dig2_FormasDeIngresso" index="20" />
            <prompt>
                <audio src="MENUGRADPRESENCIAL_DIG123_01" />
            </prompt>
            <disposition id="5662" />
            <goto next="Transfer.aspx?menu=gradpresencial&amp;opcao=2" />
        </block>

        <block name="op3">
            <milestone name="Presenc_Dig3_ProgramEstudantis" index="21" />
            <prompt>
                <audio src="MENUGRADPRESENCIAL_DIG123_01" />
            </prompt>
            <disposition id="5663" />
            <goto next="Transfer.aspx?menu=gradpresencial&amp;opcao=3" />
        </block>

        <block name="NoMatch">
            <menu>
                <prompt>
                    <audio src="MENUGRADPRESENCIAL_NOMATCH_01" />
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
            <milestone name="PerguntaSeJaEAluno_RespInvalida_Desliga" index="23" />
            <prompt>
                <audio src="MENUGRADPRESENCIAL_MAXNOMATCH_01" />
            </prompt>
            <disposition id="5665" />
            <goto next="#Encerra" />
        </block>

        <block name="NoInput">
            <menu>
                <prompt>
                    <audio src="MENUGRADPRESENCIAL_NOINPUT_01" />
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
            <milestone name="PerguntaSeJaEAluno_SemResposta_Desliga" index="22" />
            <prompt>
                <audio src="MENUGRADPRESENCIAL_MAXNOINPUT_01" />
            </prompt>
            <disposition id="5664" />
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