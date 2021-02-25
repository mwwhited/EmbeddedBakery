<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_12" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_18" />
        <signal name="XLXN_19" />
        <signal name="XLXN_20" />
        <signal name="Result3" />
        <signal name="Result0" />
        <signal name="Result1" />
        <signal name="Result2" />
        <blockdef name="AdderX4">
            <timestamp>2011-2-5T22:4:48</timestamp>
            <rect width="256" x="64" y="-704" height="640" />
            <line x2="80" y1="-768" y2="-704" x1="80" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="112" y1="0" y2="-64" x1="112" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-192" y2="-192" x1="320" />
            <line x2="384" y1="-128" y2="-128" x1="320" />
        </blockdef>
        <blockdef name="AndX4">
            <timestamp>2011-2-5T21:49:2</timestamp>
            <rect width="256" x="64" y="-648" height="572" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="160" y1="0" y2="-76" x1="160" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
        </blockdef>
        <blockdef name="OrX4">
            <timestamp>2011-2-5T21:50:33</timestamp>
            <rect width="256" x="64" y="-648" height="572" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="160" y1="0" y2="-76" x1="160" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
        </blockdef>
        <blockdef name="XorX4">
            <timestamp>2011-2-5T21:50:5</timestamp>
            <rect width="256" x="64" y="-648" height="572" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="160" y1="0" y2="-76" x1="160" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
        </blockdef>
        <blockdef name="ShiftLX4">
            <timestamp>2011-2-5T21:52:16</timestamp>
            <line x2="160" y1="0" y2="-64" x1="160" />
            <rect width="256" x="64" y="-328" height="264" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="NotX4">
            <timestamp>2011-2-5T21:51:53</timestamp>
            <line x2="160" y1="0" y2="-64" x1="160" />
            <rect width="256" x="64" y="-328" height="264" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="d3_8e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-576" y2="-576" x1="0" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="320" y1="-576" y2="-576" x1="384" />
            <line x2="320" y1="-512" y2="-512" x1="384" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <rect width="256" x="64" y="-640" height="576" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
        </blockdef>
        <block symbolname="XorX4" name="XLXI_10">
            <blockpin name="A0" />
            <blockpin name="A1" />
            <blockpin name="A2" />
            <blockpin name="A3" />
            <blockpin name="B0" />
            <blockpin name="B1" />
            <blockpin name="B2" />
            <blockpin name="B3" />
            <blockpin name="CS" />
            <blockpin name="S0" />
            <blockpin name="S1" />
            <blockpin name="S2" />
            <blockpin name="S3" />
        </block>
        <block symbolname="ShiftLX4" name="XLXI_11">
            <blockpin name="A0" />
            <blockpin name="A1" />
            <blockpin name="A2" />
            <blockpin name="A3" />
            <blockpin name="CS" />
            <blockpin name="S0" />
            <blockpin name="S1" />
            <blockpin name="S2" />
            <blockpin name="S3" />
        </block>
        <block symbolname="NotX4" name="XLXI_12">
            <blockpin name="CS" />
            <blockpin name="A0" />
            <blockpin name="A1" />
            <blockpin name="A2" />
            <blockpin name="A3" />
            <blockpin name="S0" />
            <blockpin name="S1" />
            <blockpin name="S2" />
            <blockpin name="S3" />
        </block>
        <block symbolname="d3_8e" name="XLXI_13">
            <blockpin name="A0" />
            <blockpin name="A1" />
            <blockpin name="A2" />
            <blockpin name="E" />
            <blockpin name="D0" />
            <blockpin name="D1" />
            <blockpin name="D2" />
            <blockpin name="D3" />
            <blockpin name="D4" />
            <blockpin name="D5" />
            <blockpin name="D6" />
            <blockpin name="D7" />
        </block>
        <block symbolname="AdderX4" name="XLXI_7">
            <blockpin name="A0" />
            <blockpin name="A1" />
            <blockpin name="A2" />
            <blockpin name="A3" />
            <blockpin name="Cin" />
            <blockpin name="CS" />
            <blockpin name="B0" />
            <blockpin name="B1" />
            <blockpin name="B2" />
            <blockpin name="B3" />
            <blockpin signalname="XLXN_12" name="S0" />
            <blockpin signalname="XLXN_13" name="S1" />
            <blockpin signalname="XLXN_14" name="S2" />
            <blockpin signalname="XLXN_15" name="S3" />
            <blockpin name="Cout" />
            <blockpin name="OFL" />
        </block>
        <block symbolname="AndX4" name="XLXI_8">
            <blockpin name="B0" />
            <blockpin name="B1" />
            <blockpin name="B2" />
            <blockpin name="B3" />
            <blockpin signalname="Result0" name="S0" />
            <blockpin signalname="Result1" name="S1" />
            <blockpin signalname="Result2" name="S2" />
            <blockpin signalname="Result3" name="S3" />
            <blockpin name="CS" />
            <blockpin name="A0" />
            <blockpin name="A1" />
            <blockpin name="A2" />
            <blockpin name="A3" />
        </block>
        <block symbolname="OrX4" name="XLXI_9">
            <blockpin name="A0" />
            <blockpin name="A1" />
            <blockpin name="A2" />
            <blockpin name="A3" />
            <blockpin name="B0" />
            <blockpin name="B1" />
            <blockpin name="B2" />
            <blockpin name="B3" />
            <blockpin name="CS" />
            <blockpin signalname="XLXN_16" name="S0" />
            <blockpin signalname="XLXN_18" name="S1" />
            <blockpin signalname="XLXN_19" name="S2" />
            <blockpin signalname="XLXN_20" name="S3" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2128" y="1056" name="XLXI_10" orien="R0">
        </instance>
        <instance x="2112" y="1504" name="XLXI_11" orien="R0">
        </instance>
        <instance x="2096" y="1968" name="XLXI_12" orien="R0">
        </instance>
        <instance x="112" y="2704" name="XLXI_13" orien="R0" />
        <instance x="1344" y="832" name="XLXI_7" orien="R0">
        </instance>
        <instance x="1344" y="1568" name="XLXI_8" orien="R0">
        </instance>
        <instance x="1328" y="2448" name="XLXI_9" orien="R0">
        </instance>
        <branch name="XLXN_12">
            <wire x2="1776" y1="352" y2="352" x1="1728" />
        </branch>
        <branch name="XLXN_13">
            <wire x2="1776" y1="416" y2="416" x1="1728" />
        </branch>
        <branch name="XLXN_14">
            <wire x2="1776" y1="480" y2="480" x1="1728" />
        </branch>
        <branch name="XLXN_15">
            <wire x2="1776" y1="544" y2="544" x1="1728" />
        </branch>
        <branch name="XLXN_16">
            <wire x2="1776" y1="1904" y2="1904" x1="1712" />
        </branch>
        <branch name="XLXN_18">
            <wire x2="1776" y1="1968" y2="1968" x1="1712" />
        </branch>
        <branch name="XLXN_19">
            <wire x2="1776" y1="2032" y2="2032" x1="1712" />
        </branch>
        <branch name="XLXN_20">
            <wire x2="1776" y1="2096" y2="2096" x1="1712" />
        </branch>
        <branch name="Result3">
            <wire x2="1776" y1="1216" y2="1216" x1="1728" />
        </branch>
        <branch name="Result0">
            <wire x2="1776" y1="1024" y2="1024" x1="1728" />
        </branch>
        <branch name="Result1">
            <wire x2="1776" y1="1088" y2="1088" x1="1728" />
        </branch>
        <branch name="Result2">
            <wire x2="1776" y1="1152" y2="1152" x1="1728" />
        </branch>
    </sheet>
</drawing>