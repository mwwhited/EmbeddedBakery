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

