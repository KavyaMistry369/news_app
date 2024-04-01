import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class SearchHelper {
  SearchHelper._();

  static final SearchHelper searchHelper = SearchHelper._();

  String type = "india";
  String api =
      "https://newsapi.org/v2/everything?q=gujarat&sortBy=publishedAt&apiKey=02f306e2b0454d4c8a8c1a47c5a28e5d";
  List searchedNews = [];
  List defaultNews = [];

  Future<List?> getSearchNews({required String query}) async {
    type = query;

    http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q=$query&sortBy=publishedAt&apiKey=02f306e2b0454d4c8a8c1a47c5a28e5d"));

    if (response.statusCode == 200) {
      Map headlines = jsonDecode(response.body);
      searchedNews = headlines['articles'];
      log(searchedNews[0]['title']);
      return searchedNews;
    } else {
      return null;
    }
  }

  Future<List?> getDefaultNews() async {
    http.Response response = await http.get(Uri.parse(api));

    if (response.statusCode == 200) {
      Map headlines = jsonDecode(response.body);
      defaultNews = headlines['articles'];
      log(defaultNews[0]['title']);
      return defaultNews;
    } else {
      return null;
    }
  }
}
