namespace XgproLgcTool;

public class LgcLogicVector
{
    public const int Size = 24; // 24 bytes per vector
    public byte[] Data { get; init; } = new byte[Size];

    public static LgcLogicVector Read(BinaryReader reader) =>
        new () { Data = reader.ReadBytes(Size) };

    public void Write(BinaryWriter writer)
    {
        writer.Write(Data);
    }
}

