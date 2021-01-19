class ApiLoadCountryResponse {
  final status;
  final totalResults;
  final ApiLoadCountryArticlesResponse articles;

  ApiLoadCountryResponse(
    this.status,
    this.totalResults,
    this.articles,
    Map<String, dynamic> json,
  );

  static ApiLoadCountryResponse fromJson(Map<String, dynamic> json) {
    final status = json['status'];
    final totalResults = json['totalResults'];
    final articles = json['articles'];
    return ApiLoadCountryResponse(
      status,
      totalResults,
      articles == null
          ? null
          : ApiLoadCountryArticlesResponse.fromJson(articles),
      json,
    );
  }
}

class ApiLoadCountryArticlesResponse {
  final ApiLoadCountryArticlesSourceResponse source;
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
  final String content;

  ApiLoadCountryArticlesResponse(
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    Map<String, dynamic> json,
  );

  static ApiLoadCountryArticlesResponse fromJson(Map<String, dynamic> json) {
    final source = json['source'];
    final author = json['author'];
    final title = json['title'];
    final description = json['description'];
    final url = json['url'];
    final urlToImage = json['urlToImage'];
    final publishedAt = json['publishedAt'];
    final content = json['content'];
    return ApiLoadCountryArticlesResponse(
      source == null
          ? null
          : ApiLoadCountryArticlesSourceResponse.fromJson(source),
      author,
      title,
      description,
      url,
      urlToImage,
      publishedAt,
      content,
      json,
    );
  }
}

class ApiLoadCountryArticlesSourceResponse {
  final String id;
  final String name;

  ApiLoadCountryArticlesSourceResponse(
    this.id,
    this.name,
  );

  static ApiLoadCountryArticlesSourceResponse fromJson(
          Map<String, dynamic> json) =>
      ApiLoadCountryArticlesSourceResponse(
        json['id'],
        json['name'],
      );
}
