import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:news_app/helpers/headlines_helper.dart';


import '../helpers/world_helper.dart';

enum country { IN, US, CA, CN, RU }

enum selectCountry{IN,US,CA,CN,RU}

enum category { business, technology, entertainment, sports, science, health }

class Pagecontroller extends ChangeNotifier {
  PageController myPageController = PageController(initialPage: 0);

  int myIndex = 0;
  bool isDark = false;
  country segmented = country.IN;
  category segment = category.business;
  selectCountry select = selectCountry.IN;

   Pagecontroller(){
     HeadlineHelper.headlineHelper.countryHeadlinesNews(select: selectCountry.IN.name);
   }

   void changeTheme(){
     isDark=!isDark;
     notifyListeners();
   }

  Future<void> setCountry({required selectCountry val})async{
    select = val;
    log(val.name);
    await HeadlineHelper.headlineHelper.countryHeadlinesNews(select: val.name);
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
