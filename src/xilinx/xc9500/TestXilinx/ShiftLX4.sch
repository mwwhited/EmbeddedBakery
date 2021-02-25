<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="A2" />
        <signal name="A3" />
        <signal name="CS" />
        <signal name="S0" />
        <signal name="S1" />
        <signal name="S2" />
        <signal name="S3" />
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <signal name="A0" />
        <signal name="A1" />
        <port polarity="Input" name="A2" />
        <port polarity="Input" name="A3" />
        <port polarity="Input" name="CS" />
        <port polarity="Output" name="S0" />
        <port polarity="Output" name="S1" />
        <port polarity="Output" name="S2" />
        <port polarity="Output" name="S3" />
        <port polarity="Input" name="A0" />
        <port polarity="Input" name="A1" />
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
        <block symbolname="obuft4" name="XLXI_19">
            <blockpin signalname="A3" name="I0" />
            <blockpin signalname="A0" name="I1" />
            <blockpin signalname="A1" name="I2" />
            <blockpin signalname="A2" name="I3" />
            <blockpin signalname="CS" name="T" />
            <blockpin signalname="S0" name="O0" />
            <blockpin signalname="S1" name="O1" />
            <blockpin signalname="S2" name="O2" />
            <blockpin signalname="S3" name="O3" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="A2">
            <wire x2="1408" y1="1040" y2="1040" x1="1232" />
            <wire x2="1424" y1="1040" y2="1040" x1="1408" />
            <wire x2="1488" y1="1040" y2="1040" x1="1424" />
            <wire x2="1488" y1="1040" y2="1104" x1="1488" />
            <wire x2="1648" y1="1104" y2="1104" x1="1488" />
            <wire x2="1808" y1="1104" y2="1104" x1="1648" />
        </branch>
        <branch name="A3">
            <wire x2="1408" y1="1104" y2="1104" x1="1232" />
            <wire x2="1424" y1="1104" y2="1104" x1="1408" />
            <wire x2="1424" y1="1056" y2="1104" x1="1424" />
            <wire x2="1648" y1="1056" y2="1056" x1="1424" />
            <wire x2="1808" y1="912" y2="912" x1="1648" />
            <wire x2="1648" y1="912" y2="1056" x1="1648" />
        </branch>
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
        <iomarker fontsize="28" x="1760" y="848" name="CS" orien="R180" />
        <instance x="1808" y="1136" name="XLXI_19" orien="R0" />
        <iomarker fontsize="28" x="1232" y="1104" name="A3" orien="R180" />
        <iomarker fontsize="28" x="1232" y="1040" name="A2" orien="R180" />
        <iomarker fontsize="28" x="1232" y="976" name="A1" orien="R180" />
        <iomarker fontsize="28" x="1232" y="912" name="A0" orien="R180" />
        <branch name="A0">
            <wire x2="1520" y1="912" y2="912" x1="1232" />
            <wire x2="1520" y1="912" y2="976" x1="1520" />
            <wire x2="1808" y1="976" y2="976" x1="1520" />
        </branch>
        <branch name="A1">
            <wire x2="1504" y1="976" y2="976" x1="1232" />
            <wire x2="1504" y1="976" y2="1040" x1="1504" />
            <wire x2="1808" y1="1040" y2="1040" x1="1504" />
        </branch>
    </sheet>
</drawing>