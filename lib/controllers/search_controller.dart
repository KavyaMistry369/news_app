import 'package:flutter/cupertino.dart';
import 'package:news_app/helpers/search_helper.dart';

class Searchcontroller extends ChangeNotifier {
  TextEditingController controller = TextEditingController();

  void searchNews({required String value}) {
    SearchHelper.searchHelper.getSearchNews(query: value);
    notifyListeners();
  }
}
