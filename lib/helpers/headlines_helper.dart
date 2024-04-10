import 'package:http/http.dart' as http;
import 'package:news_app/libraries.dart';

class HeadlineHelper {
  HeadlineHelper._();

  static final HeadlineHelper headlineHelper = HeadlineHelper._();

  List allHeadlines = [];
  List allsetHeadlines = [];

  Future<List?> getHeadlinesNews() async {
    http.Response response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=02f306e2b0454d4c8a8c1a47c5a28e5d"));

    if (response.statusCode == 200) {
      Map headlines = jsonDecode(response.body);
      allHeadlines = headlines['articles'];
      print(allHeadlines);
      return allHeadlines;
    } else {
      return null;
    }
  }

  Future<List?> countryHeadlinesNews({required String select}) async {
    http.Response response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=$select&apiKey=02f306e2b0454d4c8a8c1a47c5a28e5d"));

    if (response.statusCode == 200) {
      Map headlines = jsonDecode(response.body);
      allHeadlines = headlines['articles'];
      print(allHeadlines);
      return allHeadlines;
    } else {
      return null;
    }
  }

}
