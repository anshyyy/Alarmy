import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Developer"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Anshuman Sharma"),
            Row(
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: InkWell(
                    onTap: () async {
                      final Uri _url = Uri.parse("https://x.com/_anshyyy");
                      if (!await launchUrl(_url,
                          mode: LaunchMode.inAppBrowserView)) {
                        throw Exception('Could not launch $_url');
                      }
                    },
                    child: Image(
                      image: AssetImage("assets/twitter.png"),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 25,
                  height: 25,
                  child: InkWell(
                    onTap: () async {
                      final Uri _url =
                          Uri.parse("https://www.linkedin.com/in/anshyyy/");
                      if (!await launchUrl(_url,
                          mode: LaunchMode.inAppBrowserView)) {
                        throw Exception('Could not launch $_url');
                      }
                    },
                    child: Image(
                      image: AssetImage("assets/link.png"),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
