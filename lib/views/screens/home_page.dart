import 'package:flutter/material.dart';
import 'package:news_app/libraries.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Pagecontroller>(builder: (context, provider, _) {
      return Scaffold(
        body: PageView(
          onPageChanged: (value) =>
              Provider.of<Pagecontroller>(context, listen: false)
                  .changeMyPage(index: value),
          controller: Provider.of<Pagecontroller>(context).myPageController,
          children: [
            HeadlinesPage(),
            SearchPage(),
            WorldPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: CupertinoColors.activeBlue,
            currentIndex: provider.myIndex,
            onTap: (index) {
              provider.changeMyPage(index: index);
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.view_headline), label: "Headlines"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.web), label: "World"),
            ]),
      );
    });
  }
}
