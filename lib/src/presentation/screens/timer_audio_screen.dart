import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerAudio extends StatefulWidget {
  const TimerAudio({super.key});

  @override
  State<TimerAudio> createState() => _TimerAudioState();
}

class _TimerAudioState extends State<TimerAudio> {
  List<String> alarmsName = ['alarm', "bedside", "alarm2", "loud", "digital"];
  String? _currentlyPlaying; // Track the currently playing alarm

  final AudioPlayer _audioPlayer = AudioPlayer();

  void _setSavedAudioPreference(String alarmName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("audio", alarmName);
  }

  Future<void> _playSound(String name) async {
    await _audioPlayer.play(AssetSource('sounds/$name.mp3'));
    setState(() {
      _currentlyPlaying = name;
    });
  }

  Future<void> _stopSound() async {
    await _audioPlayer.stop();
    setState(() {
      _currentlyPlaying = null;
    });
  }

  @override
  void initState() {
    super.initState();

    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        _currentlyPlaying = null;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer Audio"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 10),
        child: ListView.builder(
          itemCount: alarmsName.length,
          itemBuilder: (context, index) {
            String alarmName = alarmsName[index];
            bool isPlaying = _currentlyPlaying == alarmName;
            return InkWell(
              onTap: () {
                print("currently tapped ${alarmName}");
                _setSavedAudioPreference(alarmName);
                Navigator.of(context).pop(alarmName);
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(alarmName),
                    IconButton(
                      onPressed: () {
                        if (isPlaying) {
                          _stopSound();
                        } else {
                          _playSound(alarmName);
                        }
                      },
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
