import 'package:flutter/material.dart';
import 'package:news_app/libraries.dart';

class WBFour extends StatelessWidget {
  const WBFour({super.key});

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: WebUri(WorldHelper.worldHelper.allSportsNews[index]['url'])),
        onWebViewCreated: (controller) {
          Provider.of<WebController>(context, listen: false)
              .init(controller: controller);
        },
      ),
    );
  }
}
