<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CS" />
        <signal name="S0" />
        <signal name="S1" />
        <signal name="S2" />
        <signal name="S3" />
        <signal name="XLXN_50" />
        <signal name="XLXN_51" />
        <signal name="XLXN_52" />
        <signal name="XLXN_53" />
        <signal name="Cin" />
        <signal name="A0" />
        <signal name="A1" />
        <signal name="A2" />
        <signal name="A3" />
        <signal name="B0" />
        <signal name="B1" />
        <signal name="B2" />
        <signal name="B3" />
        <signal name="Cout" />
        <signal name="OFL" />
        <port polarity="Input" name="CS" />
        <port polarity="Output" name="S0" />
        <port polarity="Output" name="S1" />
        <port polarity="Output" name="S2" />
        <port polarity="Output" name="S3" />
        <port polarity="Input" name="Cin" />
        <port polarity="Input" name="A0" />
        <port polarity="Input" name="A1" />
        <port polarity="Input" name="A2" />
        <port polarity="Input" name="A3" />
        <port polarity="Input" name="B0" />
        <port polarity="Input" name="B1" />
        <port polarity="Input" name="B2" />
        <port polarity="Input" name="B3" />
        <port polarity="Output" name="Cout" />
        <port polarity="Output" name="OFL" />
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
        <blockdef name="add4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="112" y1="-832" y2="-804" x1="112" />
            <line x2="112" y1="-832" y2="-832" x1="64" />
            <line x2="64" y1="-832" y2="-832" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="384" y1="-352" y2="-352" x1="448" />
            <line x2="384" y1="-416" y2="-416" x1="448" />
            <line x2="384" y1="-480" y2="-480" x1="448" />
            <line x2="384" y1="-544" y2="-544" x1="448" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <line x2="64" y1="-576" y2="-576" x1="0" />
            <line x2="64" y1="-640" y2="-640" x1="0" />
            <line x2="64" y1="-704" y2="-704" x1="0" />
            <line x2="384" y1="-64" y2="-64" x1="240" />
            <line x2="240" y1="-124" y2="-64" x1="240" />
            <line x2="336" y1="-128" y2="-148" x1="336" />
            <line x2="336" y1="-128" y2="-128" x1="384" />
            <line x2="64" y1="-736" y2="-816" x1="384" />
            <line x2="384" y1="-160" y2="-736" x1="384" />
            <line x2="384" y1="-80" y2="-160" x1="64" />
            <line x2="64" y1="-416" y2="-80" x1="64" />
            <line x2="64" y1="-448" y2="-416" x1="144" />
            <line x2="144" y1="-480" y2="-448" x1="64" />
            <line x2="64" y1="-816" y2="-480" x1="64" />
            <line x2="384" y1="-64" y2="-64" x1="448" />
            <line x2="384" y1="-128" y2="-128" x1="448" />
        </blockdef>
        <block symbolname="obuft4" name="XLXI_5">
            <blockpin signalname="XLXN_50" name="I0" />
            <blockpin signalname="XLXN_51" name="I1" />
            <blockpin signalname="XLXN_52" name="I2" />
            <blockpin signalname="XLXN_53" name="I3" />
            <blockpin signalname="CS" name="T" />
            <blockpin signalname="S0" name="O0" />
            <blockpin signalname="S1" name="O1" />
            <blockpin signalname="S2" name="O2" />
            <blockpin signalname="S3" name="O3" />
        </block>
        <block symbolname="add4" name="XLXI_8">
            <blockpin signalname="A0" name="A0" />
            <blockpin signalname="A1" name="A1" />
            <blockpin signalname="A2" name="A2" />
            <blockpin signalname="A3" name="A3" />
            <blockpin signalname="B0" name="B0" />
            <blockpin signalname="B1" name="B1" />
            <blockpin signalname="B2" name="B2" />
            <blockpin signalname="B3" name="B3" />
            <blockpin signalname="Cin" name="CI" />
            <blockpin signalname="Cout" name="CO" />
            <blockpin signalname="OFL" name="OFL" />
            <blockpin signalname="XLXN_50" name="S0" />
            <blockpin signalname="XLXN_51" name="S1" />
            <blockpin signalname="XLXN_52" name="S2" />
            <blockpin signalname="XLXN_53" name="S3" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2064" y="1184" name="XLXI_5" orien="R0" />
        <branch name="CS">
            <wire x2="2048" y1="896" y2="896" x1="2016" />
            <wire x2="2064" y1="896" y2="896" x1="2048" />
        </branch>
        <branch name="S0">
            <wire x2="2304" y1="960" y2="960" x1="2288" />
            <wire x2="2320" y1="960" y2="960" x1="2304" />
        </branch>
        <branch name="S1">
            <wire x2="2304" y1="1024" y2="1024" x1="2288" />
            <wire x2="2320" y1="1024" y2="1024" x1="2304" />
        </branch>
        <branch name="S2">
            <wire x2="2304" y1="1088" y2="1088" x1="2288" />
            <wire x2="2320" y1="1088" y2="1088" x1="2304" />
        </branch>
        <branch name="S3">
            <wire x2="2304" y1="1152" y2="1152" x1="2288" />
            <wire x2="2320" y1="1152" y2="1152" x1="2304" />
        </branch>
        <branch name="XLXN_50">
            <wire x2="2064" y1="960" y2="960" x1="1920" />
        </branch>
        <branch name="XLXN_51">
            <wire x2="2064" y1="1024" y2="1024" x1="1920" />
        </branch>
        <branch name="XLXN_52">
            <wire x2="2064" y1="1088" y2="1088" x1="1920" />
        </branch>
        <branch name="XLXN_53">
            <wire x2="2064" y1="1152" y2="1152" x1="1920" />
        </branch>
        <branch name="Cin">
            <wire x2="1472" y1="672" y2="672" x1="1440" />
        </branch>
        <branch name="A0">
            <wire x2="1472" y1="800" y2="800" x1="1440" />
        </branch>
        <branch name="A1">
            <wire x2="1472" y1="864" y2="864" x1="1440" />
        </branch>
        <branch name="A2">
            <wire x2="1472" y1="928" y2="928" x1="1440" />
        </branch>
        <branch name="A3">
            <wire x2="1472" y1="992" y2="992" x1="1440" />
        </branch>
        <branch name="B0">
            <wire x2="1472" y1="1120" y2="1120" x1="1440" />
        </branch>
        <branch name="B1">
            <wire x2="1472" y1="1184" y2="1184" x1="1440" />
        </branch>
        <branch name="B2">
            <wire x2="1472" y1="1248" y2="1248" x1="1440" />
        </branch>
        <branch name="B3">
            <wire x2="1472" y1="1312" y2="1312" x1="1440" />
        </branch>
        <branch name="Cout">
            <wire x2="1952" y1="1440" y2="1440" x1="1920" />
        </branch>
        <branch name="OFL">
            <wire x2="1952" y1="1376" y2="1376" x1="1920" />
        </branch>
        <instance x="1472" y="1504" name="XLXI_8" orien="R0" />
        <iomarker fontsize="28" x="2320" y="960" name="S0" orien="R0" />
        <iomarker fontsize="28" x="2320" y="1024" name="S1" orien="R0" />
        <iomarker fontsize="28" x="2320" y="1088" name="S2" orien="R0" />
        <iomarker fontsize="28" x="2320" y="1152" name="S3" orien="R0" />
        <iomarker fontsize="28" x="2016" y="896" name="CS" orien="R180" />
        <iomarker fontsize="28" x="1440" y="672" name="Cin" orien="R180" />
        <iomarker fontsize="28" x="1440" y="800" name="A0" orien="R180" />
        <iomarker fontsize="28" x="1440" y="864" name="A1" orien="R180" />
        <iomarker fontsize="28" x="1440" y="928" name="A2" orien="R180" />
        <iomarker fontsize="28" x="1440" y="992" name="A3" orien="R180" />
        <iomarker fontsize="28" x="1440" y="1120" name="B0" orien="R180" />
        <iomarker fontsize="28" x="1440" y="1184" name="B1" orien="R180" />
        <iomarker fontsize="28" x="1440" y="1248" name="B2" orien="R180" />
        <iomarker fontsize="28" x="1440" y="1312" name="B3" orien="R180" />
        <iomarker fontsize="28" x="1952" y="1440" name="Cout" orien="R0" />
        <iomarker fontsize="28" x="1952" y="1376" name="OFL" orien="R0" />
    </sheet>
</drawing>