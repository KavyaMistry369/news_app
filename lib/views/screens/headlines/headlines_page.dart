import 'package:flutter/material.dart';
import 'package:news_app/libraries.dart';

class HeadlinesPage extends StatelessWidget {
  const HeadlinesPage({super.key});

  @override
  Widget build(BuildContext context) {
    List allHeadlines = HeadlineHelper.headlineHelper.allHeadlines;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Top Headlines",
          style: TextStyle(fontSize: 22),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: allHeadlines.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(MyRoutes.wbHeadline, arguments: index);
                    },
                    child: Column(
                      children: [
                        (allHeadlines[index]['urlToImage'] != null)
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "${allHeadlines[index]['urlToImage']}",
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
                          "${allHeadlines[index]['title']}",
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
      ),
    );
  }
}
