


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poi_maps/screens/reviews/controller/reviews_controller.dart';
import 'package:poi_maps/utils/constants/colors.dart';
import 'package:webview_flutter/webview_flutter.dart' as web;

class HkWebView extends StatefulWidget {
  const HkWebView({super.key});

  @override
  State<HkWebView> createState() => _HkWebViewState();
}

class _HkWebViewState extends State<HkWebView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReviewsController());
    return Scaffold(
      body: SafeArea(
        child: web.WebViewWidget(controller: web.WebViewController()
          ..setJavaScriptMode(web.JavaScriptMode.unrestricted)
          ..setBackgroundColor(HkColors.black)
          ..setNavigationDelegate(web.NavigationDelegate(
            onProgress: (progress) {},
            onPageStarted: (url) {},
            onPageFinished: (url) {},
            onWebResourceError: (error) {},
            onNavigationRequest: (request) {
              if(request.url.startsWith('https://www.youtube.com/')){
                return web.NavigationDecision.prevent;
              }
              return web.NavigationDecision.navigate;
            },
          )
          )..loadRequest(Uri.parse('https://www.google.com/maps/place/?q=place_id:${controller.placeId}#review'))
          ,),
      )
    );
  }
}
