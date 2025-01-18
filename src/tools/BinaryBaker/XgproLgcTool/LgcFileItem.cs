using System.Text;


namespace XgproLgcTool;

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

