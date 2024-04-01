import 'package:flutter/material.dart';
import 'package:news_app/libraries.dart';

class WorldPage extends StatefulWidget {
  const WorldPage({super.key});

  @override
  State<WorldPage> createState() => _WorldPageState();
}

class _WorldPageState extends State<WorldPage> {
  List businessNews = WorldHelper.worldHelper.allBusinessNews;
  List technologyNews = WorldHelper.worldHelper.allTechnologyNews;
  List entertainmentNews = WorldHelper.worldHelper.allEntertainmentNews;
  List sportsNews = WorldHelper.worldHelper.allSportsNews;
  List scienceNews = WorldHelper.worldHelper.allScienceNews;
  List healthNews = WorldHelper.worldHelper.allHealthNews;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Consumer<Pagecontroller>(builder: (context, p, _) {
        return Scaffold(
          appBar: AppBar(
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.business_center),
              ),
              Tab(
                icon: Icon(Icons.phone_android),
              ),
              Tab(
                icon: Icon(Icons.movie),
              ),
              Tab(
                icon: Icon(Icons.sports_basketball_rounded),
              ),
              Tab(
                icon: Icon(Icons.science),
              ),
              Tab(
                icon: Icon(Icons.health_and_safety),
              ),
            ]),
            centerTitle: true,
            title: Column(
              children: [
                CupertinoSlidingSegmentedControl<country>(
                  groupValue: p.segmented,
                  onValueChanged: (country? value) {
                    if (value != null) {
                      p.cSegmented(value: value);
                    }
                  },
                  children: <country, Widget>{
                    country.IN: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Flag_of_India.png/2560px-Flag_of_India.png",
                      width: 50,
                    ),
                    country.US: Image.network(
                      "https://upload.wikimedia.org/wikipedia/en/thumb/a/a4/Flag_of_the_United_States.svg/1024px-Flag_of_the_United_States.svg.png",
                      width: 50,
                    ),
                    country.CA: Image.network(
                      "https://img.freepik.com/free-vector/illustration-canada-flag_53876-27114.jpg?size=626&ext=jpg&ga=GA1.1.1803636316.1711843200&semt=ais",
                      width: 50,
                    ),
                    country.CN: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2e/Flag_of_China.png/1280px-Flag_of_China.png",
                      width: 50,
                    ),
                    country.RU: Image.network(
                      "https://upload.wikimedia.org/wikipedia/en/thumb/f/f3/Flag_of_Russia.svg/1280px-Flag_of_Russia.svg.png",
                      width: 50,
                    ),
                  },
                ),
              ],
            ),
          ),
          body: TabBarView(children: [
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: businessNews.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(MyRoutes.wbOne, arguments: index);
                        },
                        child: Column(
                          children: [
                            (businessNews[index]['urlToImage'] != null)
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      "${businessNews[index]['urlToImage']}",
                                      width: 450,
                                    ))
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        "https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${businessNews[index]['title']}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(color: Colors.grey, thickness: 1),
                  ],
                ),
              ),
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: technologyNews.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(MyRoutes.wbTwo, arguments: index);
                        },
                        child: Column(
                          children: [
                            (technologyNews[index]['urlToImage'] != null)
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      "${technologyNews[index]['urlToImage']}",
                                      width: 450,
                                    ))
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        "https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${technologyNews[index]['title']}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(color: Colors.grey, thickness: 1),
                  ],
                ),
              ),
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: entertainmentNews.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(MyRoutes.wbThree, arguments: index);
                        },
                        child: Column(
                          children: [
                            (entertainmentNews[index]['urlToImage'] != null)
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      "${entertainmentNews[index]['urlToImage']}",
                                      width: 450,
                                    ))
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        "https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${entertainmentNews[index]['title']}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(color: Colors.grey, thickness: 1),
                  ],
                ),
              ),
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: sportsNews.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(MyRoutes.wbFour, arguments: index);
                        },
                        child: Column(
                          children: [
                            (sportsNews[index]['urlToImage'] != null)
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      "${sportsNews[index]['urlToImage']}",
                                      width: 450,
                                    ))
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        "https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${sportsNews[index]['title']}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(color: Colors.grey, thickness: 1),
                  ],
                ),
              ),
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: scienceNews.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(MyRoutes.wbFive, arguments: index);
                        },
                        child: Column(
                          children: [
                            (scienceNews[index]['urlToImage'] != null)
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      "${scienceNews[index]['urlToImage']}",
                                      width: 450,
                                    ))
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        "https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${scienceNews[index]['title']}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(color: Colors.grey, thickness: 1),
                  ],
                ),
              ),
            ),
            ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: healthNews.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(MyRoutes.wbSix, arguments: index);
                        },
                        child: Column(
                          children: [
                            (healthNews[index]['urlToImage'] != null)
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      "${healthNews[index]['urlToImage']}",
                                      width: 450,
                                    ))
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                        "https://thumbs.dreamstime.com/b/news-woodn-dice-depicting-letters-bundle-small-newspapers-leaning-left-dice-34802664.jpg")),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${healthNews[index]['title']}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(color: Colors.grey, thickness: 1),
                  ],
                ),
              ),
            )
          ]),
        );
      }),
    );
  }
}
