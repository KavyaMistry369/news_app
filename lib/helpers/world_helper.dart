import 'dart:convert';

import 'package:http/http.dart' as http;

class WorldHelper {
  WorldHelper._();

  static final WorldHelper worldHelper = WorldHelper._();
  List allWorldNews = [];
  List allBusinessNews = [];
  List allTechnologyNews = [];
  List allEntertainmentNews = [];
  List allSportsNews = [];
  List allScienceNews = [];
  List allHealthNews = [];

  Future<List?> getWorldNews(
      {required String country, required String category}) async {
    http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=02f306e2b0454d4c8a8c1a47c5a28e5d"));

    if (response.statusCode == 200) {
      Map headlines = jsonDecode(response.body);
      allWorldNews = headlines['articles'];
      print(allWorldNews[0]['title']);
      return allWorldNews;
    } else {
      return null;
    }
  }

  Future<List?> getBusinessNews({required String country}) async {
    http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=02f306e2b0454d4c8a8c1a47c5a28e5d"));

    if (response.statusCode == 200) {
      Map headlines = jsonDecode(response.body);
      allBusinessNews = headlines['articles'];
      print(allBusinessNews[0]['title']);
      return allBusinessNews;
    } else {
      return null;
    }
  }

  Future<List?> getTechnologyNews({required String country}) async {
    http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$country&category=technology&apiKey=02f306e2b0454d4c8a8c1a47c5a28e5d"));

    if (response.statusCode == 200) {
      Map headlines = jsonDecode(response.body);
      allTechnologyNews = headlines['articles'];
      print(allTechnologyNews[0]['title']);
      return allTechnologyNews;
    } else {
      return null;
    }
  }

  Future<List?> getEntertainmentNews({required String country}) async {
    http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$country&category=entertainment&apiKey=02f306e2b0454d4c8a8c1a47c5a28e5d"));

    if (response.statusCode == 200) {
      Map headlines = jsonDecode(response.body);
      allEntertainmentNews = headlines['articles'];
      print(allEntertainmentNews[0]['title']);
      return allEntertainmentNews;
    } else {
      return null;
    }
  }

  Future<List?> getSportsNews({required String country}) async {
    http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$country&category=sports&apiKey=02f306e2b0454d4c8a8c1a47c5a28e5d"));

    if (response.statusCode == 200) {
      Map headlines = jsonDecode(response.body);
      allSportsNews = headlines['articles'];
      print(allSportsNews[0]['title']);
      return allSportsNews;
    } else {
      return null;
    }
  }

  Future<List?> getScienceNews({required String country}) async {
    http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$country&category=science&apiKey=02f306e2b0454d4c8a8c1a47c5a28e5d"));

    if (response.statusCode == 200) {
      Map headlines = jsonDecode(response.body);
      allScienceNews = headlines['articles'];
      print(allScienceNews[0]['title']);
      return allScienceNews;
    } else {
      return null;
    }
  }

  Future<List?> getHealthNews({required String country}) async {
    http.Response response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=$country&category=health&apiKey=02f306e2b0454d4c8a8c1a47c5a28e5d"));

    if (response.statusCode == 200) {
      Map headlines = jsonDecode(response.body);
      allHealthNews = headlines['articles'];
      print(allHealthNews[0]['title']);
      return allHealthNews;
    } else {
      return null;
    }
  }
}
