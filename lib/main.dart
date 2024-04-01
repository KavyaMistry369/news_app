import 'package:flutter/material.dart';
import 'package:news_app/libraries.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HeadlineHelper.headlineHelper.getHeadlinesNews();
  SearchHelper.searchHelper.getDefaultNews();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Pagecontroller(),
        ),
        ChangeNotifierProvider(
          create: (context) => WebController(),
        ),
        ChangeNotifierProvider(
          create: (context) => Searchcontroller(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: CupertinoColors.activeBlue,
      ),
      routes: {
        '/': (context) => const SplashPage(),
        MyRoutes.home: (context) => const HomePage(),
        MyRoutes.headline: (context) => const HeadlinesPage(),
        MyRoutes.search: (context) => const SearchPage(),
        MyRoutes.country: (context) => const WorldPage(),
        MyRoutes.wbHeadline: (context) => const WBHeadlines(),
        MyRoutes.wbSearch: (context) => const WBSearch(),
        MyRoutes.wbOne: (context) => const WBOne(),
        MyRoutes.wbTwo: (context) => const WBTwo(),
        MyRoutes.wbThree: (context) => const WBThree(),
        MyRoutes.wbFour: (context) => const WBFour(),
        MyRoutes.wbFive: (context) => const WBFive(),
        MyRoutes.wbSix: (context) => const WBSix(),
      },
    );
  }
}
