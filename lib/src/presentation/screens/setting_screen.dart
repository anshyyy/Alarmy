import 'package:alarmy/src/presentation/screens/developer_screen.dart';
import 'package:alarmy/src/presentation/screens/timer_audio_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  String audio = "alarm";

  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    _getSavedAudioPreference();
  }

  void _getSavedAudioPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? audioPref = prefs.getString("audio");
    if (audioPref != null) {
      setState(() {
        audio = audioPref;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () async {
              String? alarmName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => TimerAudio()));
              if (alarmName != null) {
                setState(() {
                  audio = alarmName;
                });
              }
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Timer Audio",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        audio,
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DeveloperScreen()));
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              width: size.width,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Developer Contact",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
