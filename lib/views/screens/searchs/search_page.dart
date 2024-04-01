import 'package:flutter/material.dart';
import 'package:news_app/libraries.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    List searchNews = SearchHelper.searchHelper.searchedNews;

    return Consumer<Searchcontroller>(builder: (context, p, _) {
      TextEditingController controller = TextEditingController();
      return Scaffold(
        appBar: AppBar(
          title: CupertinoTextField(
            controller: controller,
            placeholder: "search",
            style: TextStyle(color: Colors.white),
            suffix: IconButton(
                onPressed: () {
                  p.searchNews(value: controller.text);
                },
                icon: Icon(Icons.search)),
            decoration: BoxDecoration(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: searchNews.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(MyRoutes.wbSearch, arguments: index);
                      },
                      child: Column(
                        children: [
                          (searchNews[index]['urlToImage'] != null)
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    "${searchNews[index]['urlToImage']}",
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
                            "${searchNews[index]['title']}",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  const Divider(color: Colors.grey, thickness: 1),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
