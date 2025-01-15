using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.Json;


namespace XgproLgcTool;

public class LgcFile
{
    public required LgcFileHeader Header { get; init; }
    public List<LgcFileItem> Items { get; init; } = new();

    public static LgcFile ParseLGCFile(string filePath)
    {
        using var stream = File.OpenRead(filePath);
        using var reader = new BinaryReader(stream);

        var header = LgcFileHeader.Read(reader);
        var items = new List<LgcFileItem>();

        for (int i = 0; i < header.ItemCount; i++)
        {
            stream.Seek(header.ItemStart + i * LgcFileItem.Size, SeekOrigin.Begin);
            items.Add(LgcFileItem.Read(reader));
        }

        return new LgcFile { Header = header, Items = items };
    }

    public void WriteLgc(string filePath)
    {
        using var stream = File.Create(filePath);
        using var writer = new BinaryWriter(stream);

        Header.Write(writer);
        foreach (var item in Items)
        {
            item.Write(writer);
        }
    }

    public string ToJson() => JsonSerializer.Serialize(this, new JsonSerializerOptions { WriteIndented = true });

    public static LgcFile? FromJson(string json) => JsonSerializer.Deserialize<LgcFile>(json);
}

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

public class LgcFileItem
{
    public const int Size = 64; // Example size, adapt as needed
    public uint VectorCount { get; init; }
    public required string ItemName { get; init; }
    public float VoltageLevel { get; init; }
    public uint PinCount { get; init; }
    public List<LgcLogicVector> LogicVectors { get; init; } = [];

    public static LgcFileItem Read(BinaryReader reader)
    {
        LgcFileItem item = new ()
        {
            VectorCount = reader.ReadUInt32(),
            ItemName = Encoding.ASCII.GetString(reader.ReadBytes(32)).TrimEnd('\0'),
            VoltageLevel = reader.ReadSingle(),
            PinCount = reader.ReadUInt32(),
        };

        for (int i = 0; i < item.VectorCount; i++)
        {
            item.LogicVectors.Add(LgcLogicVector.Read(reader));
        }

        return item;
    }

    public void Write(BinaryWriter writer)
    {
        writer.Write(VectorCount);
        writer.Write(Encoding.ASCII.GetBytes(ItemName.PadRight(32, '\0')));
        writer.Write(VoltageLevel);
        writer.Write(PinCount);

        foreach (var vector in LogicVectors)
        {
            vector.Write(writer);
        }
    }
}

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

