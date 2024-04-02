import 'package:flutter/cupertino.dart';


import '../helpers/world_helper.dart';

enum country { IN, US, CA, CN, RU }

enum selectCountry{IN,US,CA,CN,RU}

enum category { business, technology, entertainment, sports, science, health }

class Pagecontroller extends ChangeNotifier {
  PageController myPageController = PageController(initialPage: 0);

  int myIndex = 0;
  country segmented = country.IN;
  category segment = category.business;
  selectCountry select = selectCountry.IN;


  void setCountry({required selectCountry val}){
    select = val;
    notifyListeners();
  }


  void changeMyPage({required int index}) {
    myPageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.linear);
    myIndex = index;
    notifyListeners();
  }

  void cSegmented({required country value}) {
    segmented = value;
    WorldHelper.worldHelper.getBusinessNews(country: value.name);
    WorldHelper.worldHelper.getTechnologyNews(country: value.name);
    WorldHelper.worldHelper.getEntertainmentNews(country: value.name);
    WorldHelper.worldHelper.getSportsNews(country: value.name);
    WorldHelper.worldHelper.getScienceNews(country: value.name);
    WorldHelper.worldHelper.getHealthNews(country: value.name);
    notifyListeners();
  }
}
