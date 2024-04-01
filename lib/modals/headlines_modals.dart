class HeadlinesModal {
  final String title;
  final String des;
  final String image;
  final String url;

  HeadlinesModal(
      {required this.title,
      required this.des,
      required this.image,
      required this.url});

  factory HeadlinesModal.fromMap({required Map data}) {
    return HeadlinesModal(
        title: data['title'],
        des: data['description'],
        image: data['urlToImage'],
        url: data['url']);
  }
}
