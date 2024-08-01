import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../routes/common_routing/app_pages.dart';

class PaymentWebView extends StatefulWidget {
  String url;
  PaymentWebView({required this.url});
  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
        body: WebView(
      onPageFinished: (url) {
        if (url.contains('WWW')) {
          print('7777');
        }
      },
          navigationDelegate: (request){
            if(request.url.contains('success')) {

           Get.rootDelegate.backUntil(Routes.HOME);
              // return NavigationDecision.prevent;
            }

            return NavigationDecision.navigate;
          },
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
    ));
  }
}
