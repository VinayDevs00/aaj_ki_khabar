import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YoutubeScreen extends StatelessWidget {
  const YoutubeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebView.platform = SurfaceAndroidWebView();
    return Container(
      child: WebView(

        initialUrl: "https://www.youtube.com/c/aajkikhabar1/Home",
        javascriptMode: JavascriptMode.unrestricted,

      ),
    );
  }
}
