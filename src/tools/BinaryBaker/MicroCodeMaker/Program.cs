namespace MicroCodeMaker;

internal class Program
{
    static void Main(string[] args)
    {
        MicroCode[] microCode = [
            new (OpCodes.NOP),
            new (OpCodes.LDA, ControlLines.IO|ControlLines.MI, ControlLines.RO|ControlLines.AI),
            new (OpCodes.ADD, ControlLines.IO|ControlLines.MI, ControlLines.RO|ControlLines.BI, ControlLines.EO|ControlLines.AI),
            new (OpCodes.SUB, ControlLines.IO|ControlLines.MI, ControlLines.RO|ControlLines.BI, ControlLines.EO|ControlLines.AI|ControlLines.SU),
            new (OpCodes.STA, ControlLines.IO|ControlLines.MI, ControlLines.AO|ControlLines.RI),
            new (OpCodes.LDI, ControlLines.IO|ControlLines.AI),
            new (OpCodes.JMP, ControlLines.IO|ControlLines.J),
            new (OpCodes.EX7),
            new (OpCodes.EX8),
            new (OpCodes.EX9),
            new (OpCodes.EXA),
            new (OpCodes.EXB),
            new (OpCodes.EXC),
            new (OpCodes.EXD),
            new (OpCodes.OUT, ControlLines.AO|ControlLines.OI),
            new (OpCodes.HLT, ControlLines.HLT),
            ];

        var codes = microCode.SelectMany((o, i) => o.Steps.Select(s => new { o.OpCode, Step = i.ToString("b3"), Controls = s }));
    }
}

[Flags]
public enum ControlLines
{
    None = 0,

    HLT = 0b1000000000000000,  // Halt clock
    MI = 0b0100000000000000,  // Memory address register in
    RI = 0b0010000000000000,  // RAM data in
    RO = 0b0001000000000000,  // RAM data out
    IO = 0b0000100000000000,  // Instruction register out
    II = 0b0000010000000000,  // Instruction register in
    AI = 0b0000001000000000,  // A register in
    AO = 0b0000000100000000,  // A register out
    EO = 0b0000000010000000,  // ALU out
    SU = 0b0000000001000000,  // ALU subtract
    BI = 0b0000000000100000,  // B register in
    OI = 0b0000000000010000,  // Output register in
    CE = 0b0000000000001000,  // Program counter enable
    CO = 0b0000000000000100,  // Program counter out
    J = 0b0000000000000010,  // Jump (program counter in)
}

public enum OpCodes
{
    NOP = 0x0,
    LDA = 0x1,
    ADD = 0x2,
    SUB = 0x3,
    STA = 0x4,
    LDI = 0x5,
    JMP = 0x6,
    EX7 = 0x7,
    EX8 = 0x8,
    EX9 = 0x9,
    EXA = 0xA,
    EXB = 0xB,
    EXC = 0xC,
    EXD = 0xD,
    OUT = 0xE,
    HLT = 0xF,
}

public readonly record struct MicroCode
{
    public MicroCode(OpCodes opcode, params ControlLines[] steps)
    {
        OpCode = opcode;
        ControlLines[] microSteps = [ControlLines.None, ControlLines.None, ControlLines.None];
        Array.Copy(steps, microSteps, Math.Min(steps.Length, microSteps.Length));
        Steps = [
            ControlLines.MI | ControlLines.CO, ControlLines.RO | ControlLines.II | ControlLines.CE,
            microSteps[0], microSteps[1], microSteps[2],
            ControlLines.None, ControlLines.None, ControlLines.None
            ];
    }

    public OpCodes OpCode { get; init; }
    public ControlLines[] Steps { get; init; }

    public override string ToString() => $"{(int)OpCode:b4} - {OpCode}: {string.Join(";", Steps)}";
}