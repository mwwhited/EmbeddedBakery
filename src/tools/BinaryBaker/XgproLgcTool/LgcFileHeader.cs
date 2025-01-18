namespace XgproLgcTool;

public record LgcFileHeader
{
    public uint AllCrc32 { get; init; }
    public uint UIFlag { get; init; }
    public uint ItemCount { get; init; }
    public long ItemStart { get; init; }

    public static LgcFileHeader Read(BinaryReader reader) =>
        new()
        {
            AllCrc32 = reader.ReadUInt32(),
            UIFlag = reader.ReadUInt32(),
            ItemCount = reader.ReadUInt32(),
            ItemStart = reader.ReadInt64()
        };

    public void Write(BinaryWriter writer)
    {
        writer.Write(AllCrc32);
        writer.Write(UIFlag);
        writer.Write(ItemCount);
        writer.Write(ItemStart);
    }
}

