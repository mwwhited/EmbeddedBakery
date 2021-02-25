<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="A0" />
        <signal name="B0" />
        <signal name="A1" />
        <signal name="B1" />
        <signal name="A2" />
        <signal name="B2" />
        <signal name="A3" />
        <signal name="B3" />
        <signal name="CS" />
        <signal name="S0" />
        <signal name="S1" />
        <signal name="S2" />
        <signal name="S3" />
        <port polarity="Input" name="A0" />
        <port polarity="Input" name="B0" />
        <port polarity="Input" name="A1" />
        <port polarity="Input" name="B1" />
        <port polarity="Input" name="A2" />
        <port polarity="Input" name="B2" />
        <port polarity="Input" name="A3" />
        <port polarity="Input" name="B3" />
        <port polarity="Input" name="CS" />
        <port polarity="Output" name="S0" />
        <port polarity="Output" name="S1" />
        <port polarity="Output" name="S2" />
        <port polarity="Output" name="S3" />
        <blockdef name="obuft4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-288" y2="-288" x1="0" />
            <line x2="64" y1="-256" y2="-192" x1="64" />
            <line x2="64" y1="-224" y2="-256" x1="128" />
            <line x2="128" y1="-192" y2="-224" x1="64" />
            <line x2="64" y1="-192" y2="-128" x1="64" />
            <line x2="64" y1="-160" y2="-192" x1="128" />
            <line x2="128" y1="-128" y2="-160" x1="64" />
            <line x2="64" y1="-224" y2="-224" x1="0" />
            <line x2="128" y1="-224" y2="-224" x1="224" />
            <line x2="64" y1="-160" y2="-160" x1="0" />
            <line x2="128" y1="-160" y2="-160" x1="224" />
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-96" y2="-96" x1="224" />
            <line x2="64" y1="-96" y2="-96" x1="0" />
            <line x2="64" y1="-128" y2="-64" x1="64" />
            <line x2="64" y1="-96" y2="-128" x1="128" />
            <line x2="128" y1="-64" y2="-96" x1="64" />
            <line x2="64" y1="-288" y2="-288" x1="96" />
            <line x2="96" y1="-240" y2="-288" x1="96" />
            <line x2="96" y1="-176" y2="-208" x1="96" />
            <line x2="96" y1="-112" y2="-144" x1="96" />
            <line x2="96" y1="-48" y2="-80" x1="96" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <block symbolname="obuft4" name="XLXI_5">
            <blockpin signalname="XLXN_2" name="I0" />
            <blockpin signalname="XLXN_3" name="I1" />
            <blockpin signalname="XLXN_4" name="I2" />
            <blockpin signalname="XLXN_5" name="I3" />
            <blockpin signalname="CS" name="T" />
            <blockpin signalname="S0" name="O0" />
            <blockpin signalname="S1" name="O1" />
            <blockpin signalname="S2" name="O2" />
            <blockpin signalname="S3" name="O3" />
        </block>
        <block symbolname="or2" name="XLXI_10">
            <blockpin signalname="B0" name="I0" />
            <blockpin signalname="A0" name="I1" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_11">
            <blockpin signalname="B1" name="I0" />
            <blockpin signalname="A1" name="I1" />
            <blockpin signalname="XLXN_3" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_12">
            <blockpin signalname="B2" name="I0" />
            <blockpin signalname="A2" name="I1" />
            <blockpin signalname="XLXN_4" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_13">
            <blockpin signalname="B3" name="I0" />
            <blockpin signalname="A3" name="I1" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_2">
            <wire x2="1328" y1="752" y2="752" x1="1312" />
            <wire x2="1584" y1="752" y2="752" x1="1328" />
            <wire x2="1584" y1="752" y2="912" x1="1584" />
            <wire x2="1808" y1="912" y2="912" x1="1584" />
        </branch>
        <branch name="A0">
            <wire x2="1040" y1="720" y2="720" x1="704" />
            <wire x2="1056" y1="720" y2="720" x1="1040" />
        </branch>
        <branch name="B0">
            <wire x2="880" y1="1136" y2="1136" x1="704" />
            <wire x2="880" y1="784" y2="1136" x1="880" />
            <wire x2="1040" y1="784" y2="784" x1="880" />
            <wire x2="1056" y1="784" y2="784" x1="1040" />
        </branch>
        <branch name="A1">
            <wire x2="864" y1="768" y2="768" x1="704" />
            <wire x2="864" y1="768" y2="896" x1="864" />
            <wire x2="1040" y1="896" y2="896" x1="864" />
            <wire x2="1056" y1="896" y2="896" x1="1040" />
        </branch>
        <branch name="B1">
            <wire x2="864" y1="1184" y2="1184" x1="704" />
            <wire x2="864" y1="960" y2="1184" x1="864" />
            <wire x2="1040" y1="960" y2="960" x1="864" />
            <wire x2="1056" y1="960" y2="960" x1="1040" />
        </branch>
        <branch name="A2">
            <wire x2="848" y1="816" y2="816" x1="704" />
            <wire x2="848" y1="816" y2="1056" x1="848" />
            <wire x2="1040" y1="1056" y2="1056" x1="848" />
            <wire x2="1056" y1="1056" y2="1056" x1="1040" />
        </branch>
        <branch name="B2">
            <wire x2="816" y1="1232" y2="1232" x1="704" />
            <wire x2="816" y1="1120" y2="1232" x1="816" />
            <wire x2="1040" y1="1120" y2="1120" x1="816" />
            <wire x2="1056" y1="1120" y2="1120" x1="1040" />
        </branch>
        <branch name="A3">
            <wire x2="832" y1="864" y2="864" x1="704" />
            <wire x2="832" y1="864" y2="1216" x1="832" />
            <wire x2="1040" y1="1216" y2="1216" x1="832" />
            <wire x2="1056" y1="1216" y2="1216" x1="1040" />
        </branch>
        <branch name="B3">
            <wire x2="1040" y1="1280" y2="1280" x1="704" />
            <wire x2="1056" y1="1280" y2="1280" x1="1040" />
        </branch>
        <instance x="1808" y="1136" name="XLXI_5" orien="R0" />
        <branch name="CS">
            <wire x2="1792" y1="848" y2="848" x1="1760" />
            <wire x2="1808" y1="848" y2="848" x1="1792" />
        </branch>
        <branch name="S0">
            <wire x2="2048" y1="912" y2="912" x1="2032" />
            <wire x2="2064" y1="912" y2="912" x1="2048" />
        </branch>
        <branch name="S1">
            <wire x2="2048" y1="976" y2="976" x1="2032" />
            <wire x2="2064" y1="976" y2="976" x1="2048" />
        </branch>
        <branch name="S2">
            <wire x2="2048" y1="1040" y2="1040" x1="2032" />
            <wire x2="2064" y1="1040" y2="1040" x1="2048" />
        </branch>
        <branch name="S3">
            <wire x2="2048" y1="1104" y2="1104" x1="2032" />
            <wire x2="2064" y1="1104" y2="1104" x1="2048" />
        </branch>
        <iomarker fontsize="28" x="2064" y="912" name="S0" orien="R0" />
        <iomarker fontsize="28" x="2064" y="976" name="S1" orien="R0" />
        <iomarker fontsize="28" x="2064" y="1040" name="S2" orien="R0" />
        <iomarker fontsize="28" x="2064" y="1104" name="S3" orien="R0" />
        <branch name="XLXN_3">
            <wire x2="1328" y1="928" y2="928" x1="1312" />
            <wire x2="1328" y1="928" y2="976" x1="1328" />
            <wire x2="1808" y1="976" y2="976" x1="1328" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="1328" y1="1088" y2="1088" x1="1312" />
            <wire x2="1808" y1="1040" y2="1040" x1="1328" />
            <wire x2="1328" y1="1040" y2="1088" x1="1328" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1328" y1="1248" y2="1248" x1="1312" />
            <wire x2="1808" y1="1104" y2="1104" x1="1328" />
            <wire x2="1328" y1="1104" y2="1248" x1="1328" />
        </branch>
        <iomarker fontsize="28" x="1760" y="848" name="CS" orien="R180" />
        <iomarker fontsize="28" x="704" y="1280" name="B3" orien="R180" />
        <iomarker fontsize="28" x="704" y="1232" name="B2" orien="R180" />
        <iomarker fontsize="28" x="704" y="1184" name="B1" orien="R180" />
        <iomarker fontsize="28" x="704" y="1136" name="B0" orien="R180" />
        <iomarker fontsize="28" x="704" y="720" name="A0" orien="R180" />
        <iomarker fontsize="28" x="704" y="768" name="A1" orien="R180" />
        <iomarker fontsize="28" x="704" y="816" name="A2" orien="R180" />
        <iomarker fontsize="28" x="704" y="864" name="A3" orien="R180" />
        <instance x="1056" y="848" name="XLXI_10" orien="R0" />
        <instance x="1056" y="1024" name="XLXI_11" orien="R0" />
        <instance x="1056" y="1184" name="XLXI_12" orien="R0" />
        <instance x="1056" y="1344" name="XLXI_13" orien="R0" />
    </sheet>
</drawing>