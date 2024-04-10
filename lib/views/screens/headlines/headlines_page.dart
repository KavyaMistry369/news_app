import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/libraries.dart';

class HeadlinesPage extends StatefulWidget {
  const HeadlinesPage({super.key});

  @override
  State<HeadlinesPage> createState() => _HeadlinesPageState();
}

class _HeadlinesPageState extends State<HeadlinesPage> {
  @override
  Widget build(BuildContext context) {
    List allHeadlines = HeadlineHelper.headlineHelper.allHeadlines;

    return Consumer<Pagecontroller>(builder: (context, p, _) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Provider.of<Pagecontroller>(context, listen: false)
                    .changeTheme();
              },
              icon: Provider.of<Pagecontroller>(context, listen: false).isDark
                  ? Icon(Icons.sunny)
                  : Icon(Icons.dark_mode)),
          actions: [
            IconButton(
                onPressed: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) =>
                        StatefulBuilder(builder: (context, setState) {
                      return AlertDialog.adaptive(
                        title: const Text("Select Country"),
                        alignment: Alignment.center,
                        actions: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RadioListTile(
                                  title: Text("India"),
                                  value: selectCountry.IN,
                                  groupValue: p.select,
                                  onChanged: (v) {
                                    setState(() {
                                      p.setCountry(val: v!);
                                      Navigator.of(context).pop();
                                      log(v.name);
                                    });
                                  }),
                              RadioListTile(
                                  title: Text("America"),
                                  value: selectCountry.US,
                                  groupValue: p.select,
                                  onChanged: (selectCountry? v) {
                                    setState(() {
                                      p.setCountry(val: v!);
                                      Navigator.of(context).pop();
                                      log(v.name);
                                    });
                                  }),
                              RadioListTile(
                                  title: Text("Canada"),
                                  value: selectCountry.CA,
                                  groupValue: p.select,
                                  onChanged: (selectCountry? v) {
                                    setState(() {
                                      p.setCountry(val: v!);
                                      Navigator.of(context).pop();
                                      log(v.name);
                                    });
                                  }),
                              RadioListTile(
                                  title: Text("China"),
                                  value: selectCountry.CN,
                                  groupValue: p.select,
                                  onChanged: (selectCountry? v) {
                                    setState(() {
                                      p.setCountry(val: v!);
                                      Navigator.of(context).pop();
                                      log(v.name);
                                    });
                                  }),
                              RadioListTile(
                                  title: Text("Russia"),
                                  value: selectCountry.RU,
                                  groupValue: p.select,
                                  onChanged: (selectCountry? v) {
                                    setState(() {
                                      p.setCountry(val: v!);
                                      Navigator.of(context).pop();
                                      log(v.name);
                                    });
                                  }),
                            ],
                          )
                        ],
                      );
                    }),
                  );
                },
                icon: Icon(Icons.language))
          ],
          centerTitle: true,
          title: const Text(
            "Top Headlines",
            style: TextStyle(fontSize: 22),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: FutureBuilder(
              future: HeadlineHelper.headlineHelper.getHeadlinesNews(),
            builder: (context, snapshot) {
              return ListView.builder(
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
              );
            }
          ),
        ),
      );
    });
  }
}
