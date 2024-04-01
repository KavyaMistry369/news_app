import 'package:flutter/widgets.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebController extends ChangeNotifier {
  InAppWebViewController? inAppWebViewController;

  init({required InAppWebViewController controller}) {
    inAppWebViewController = controller;
    notifyListeners();
  }
}
