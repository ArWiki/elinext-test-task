class CountryTile {
  final CountrySourceTile source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  CountryTile({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
}

class CountrySourceTile {
  final String id;
  final String name;

  CountrySourceTile({
    this.id,
    this.name,
  });
}
