<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuPublicoGeral.aspx.cs" Inherits="Ura_Receptiva_CDS.MenuPublicoGeral" %>

<?xml version="1.0" encoding="utf-8" ?>
<vxml xml:lang="en-US">

    <form>
        <block>
            <milestone name="MenuPublicoGeral" index="7" />
            <disposition id="5649" />
            <menu>
                <prompt>
                    <audio src="MENUPUBLICOGERAL_INI_01" />
                </prompt>
                <choice dtmf="1" next="#op1" />
                <choice dtmf="2" next="#op2" />
                <choice dtmf="3" next="#op3" />
                <choice dtmf="4" next="#op4" />
                <choice dtmf="5" next="#op5" />
                <choice dtmf="6" next="#op6" />
                <choice dtmf="7" next="#op7" />
                <noinput>
                    <goto next="#NoInput" />
                </noinput>
                <nomatch>
                    <goto next="#NoMatch" />
                </nomatch>
            </menu>
        </block>

        <block name="op1">
            <milestone name="Dig1_Medicina_Transfere" index="8" />
            <prompt>
                <audio src="MENUPUBLICOGERAL_DIG1_01" />
            </prompt>
            <disposition id="5650" />
            <goto next="Transfer.aspx?menu=publico&amp;opcao=1" />
        </block>

        <block name="op2">
            <milestone name="Dig2_GradPresencial" index="9" />
            <disposition id="5651" />
            <goto next="MenuGraduacaoPresencial.aspx" />
        </block>

        <block name="op3">
            <milestone name="Dig3_GradADistancia" index="10" />
            <disposition id="5652" />
            <goto next="MenuCursoADistancia.aspx" />
        </block>

        <block name="op4">
            <milestone name="Dig4_PosGraduacao" index="11" />
            <disposition id="5653" />
            <goto next="MenuPosGraduacao.aspx" />
        </block>

        <block name="op5">
            <milestone name="Dig5_CursosTecnicos_Transfere" index="12" />
            <prompt>
                <audio src="MENUPUBLICOGERAL_DIG5_01" />
            </prompt>
            <disposition id="5654" />
            <goto next="Transfer.aspx?menu=publico&amp;opcao=5" />
        </block>

        <block name="op6">
            <milestone name="Dig6_CursosLivres_Transfere" index="13" />
            <prompt>
                <audio src="MENUPUBLICOGERAL_DIG6_01" />
            </prompt>
            <disposition id="5655" />
            <goto next="Transfer.aspx?menu=publico&amp;opcao=6" />
        </block>

        <block name="op7">
            <milestone name="Dig7_Colégios_Desliga" index="14" />
            <prompt>
                <audio src="MENUPUBLICOGERAL_DIG7_01" />
            </prompt>
            <disposition id="5656" />
            <goto next="#Encerra" />
        </block>

        <block name="NoMatch">
            <menu>
                <prompt>
                    <audio src="MENUPUBLICOGERAL_NOMATCH_01" />
                </prompt>
                <choice dtmf="1" next="#op1" />
                <choice dtmf="2" next="#op2" />
                <choice dtmf="3" next="#op3" />
                <choice dtmf="4" next="#op4" />
                <choice dtmf="5" next="#op5" />
                <choice dtmf="6" next="#op6" />
                <choice dtmf="7" next="#op7" />
                <noinput>
                    <goto next="#MaxNoInput" />
                </noinput>
                <nomatch>
                    <goto next="#MaxNoMatch" />
                </nomatch>
            </menu>
        </block>

        <block name="MaxNoMatch">
            <milestone name="MenuPublicoGeral_RespostaInvalida" index="16" />
            <prompt>
                <audio src="MENUPUBLICOGERAL_MAXNOMATCH_01" />
            </prompt>
            <disposition id="5658" />
            <goto next="#Encerra" />
        </block>

        <block name="NoInput">
            <menu>
                <prompt>
                    <audio src="MENUPUBLICOGERAL_NOINPUT_01" />
                </prompt>
                <choice dtmf="1" next="#op1" />
                <choice dtmf="2" next="#op2" />
                <choice dtmf="3" next="#op3" />
                <choice dtmf="4" next="#op4" />
                <choice dtmf="5" next="#op5" />
                <choice dtmf="6" next="#op6" />
                <choice dtmf="7" next="#op7" />
                <noinput>
                    <goto next="#MaxNoInput" />
                </noinput>
                <nomatch>
                    <goto next="#MaxNoMatch" />
                </nomatch>
            </menu>
        </block>

        <block name="MaxNoInput">
            <milestone name="MenuPublicoGeral_SemResposta" index="15" />
            <prompt>
                <audio src="MENUPUBLICOGERAL_MAXNOINPUT_01" />
            </prompt>
            <disposition id="5657" />
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