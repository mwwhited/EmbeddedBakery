
namespace WhitedUS.Net.HTTP
{
    public struct RssItem
    {
        public char[] Title;
        public char[] Uri;

        public override string ToString()
        {
            return new string(Title) + " - " + new string(Uri);
        }
    }
}
