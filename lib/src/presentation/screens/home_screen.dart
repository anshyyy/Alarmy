<<<<<<< HEAD
import 'dart:async';

import 'package:alarmy/src/presentation/screens/clock_screen.dart';
import 'package:alarmy/src/presentation/screens/setting_screen.dart';
import 'package:alarmy/src/presentation/screens/stopwatch_screen.dart';
import 'package:alarmy/src/presentation/screens/timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showAppBar = true;
  Timer? _inactivityTimer;

  String _option = "Clock";

  @override
  void initState() {
    super.initState();
    _startInactivityTimer();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  void _startInactivityTimer() {
    _inactivityTimer?.cancel();
    if (_option != "Settings") {
      _inactivityTimer = Timer(const Duration(seconds: 10), () {
        setState(() {
          _showAppBar = false;
        });
      });
    } else {
      setState(() {
        _showAppBar = true;
      });
    }
  }

  void _resetInactivityTimer() {
    setState(() {
      _showAppBar = true;
    });
    _startInactivityTimer();
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel();
    super.dispose();
  }

  void _onOptionSelected(String option) {
    // Handle the selected option
    print("Selected option: $option");
    setState(() {
      _option = option;
    });
    _startInactivityTimer();
  }

  Widget bodyWidget(String option) {
    switch (option) {
      case "Clock":
        return ClockScreen();
      case "Timer":
        return TimerScreen();
      case "Stop Watch":
        return StopwatchScreen();
      case "Settings":
        return SettingScreen();
      default:
        return SettingScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _resetInactivityTimer,
      child: Scaffold(
        appBar: _showAppBar
            ? AppBar(
                title: Text(_option == "Settings" ? "Settings" : ""),
                actions: [
                  PopupMenuButton<String>(
                    color: const Color(0xFF171514),
                    icon: Icon(Icons.more_vert), // Icon for the button
                    onSelected: _onOptionSelected,
                    itemBuilder: (BuildContext context) {
                      return {
                        'Clock': Icons.access_time,
                        'Timer': Icons.hourglass_empty,
                        'Stop Watch': Icons.timer,
                        'Settings': Icons.settings
                      }.entries.map<PopupMenuEntry<String>>((entry) {
                        return PopupMenuItem<String>(
                          value: entry.key,
                          child: Row(
                            children: [
                              Icon(entry.value),
                              SizedBox(width: 8),
                              Text(entry.key),
                            ],
                          ),
                        );
                      }).toList();
                    },
                  ),
                ],
              )
            : null,
        body: bodyWidget(_option),
      ),
    );
  }
}
=======
import 'dart:async';

import 'package:alarmy/src/presentation/screens/clock_screen.dart';
import 'package:alarmy/src/presentation/screens/setting_screen.dart';
import 'package:alarmy/src/presentation/screens/stopwatch_screen.dart';
import 'package:alarmy/src/presentation/screens/timer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showAppBar = true;
  Timer? _inactivityTimer;

  String _option = "Clock";

  @override
  void initState() {
    super.initState();
    _startInactivityTimer();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  void _startInactivityTimer() {
    _inactivityTimer?.cancel();
    if (_option != "Settings") {
      _inactivityTimer = Timer(const Duration(seconds: 10), () {
        setState(() {
          _showAppBar = false;
        });
      });
    } else {
      setState(() {
        _showAppBar = true;
      });
    }
  }

  void _resetInactivityTimer() {
    setState(() {
      _showAppBar = true;
    });
    _startInactivityTimer();
  }

  @override
  void dispose() {
    _inactivityTimer?.cancel();
    super.dispose();
  }

  void _onOptionSelected(String option) {
    // Handle the selected option
    print("Selected option: $option");
    setState(() {
      _option = option;
    });
    _startInactivityTimer();
  }

  Widget bodyWidget(String option) {
    switch (option) {
      case "Clock":
        return ClockScreen();
      case "Timer":
        return TimerScreen();
      case "Stop Watch":
        return StopwatchScreen();
      case "Settings":
        return SettingScreen();
      default:
        return SettingScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _resetInactivityTimer,
      child: Scaffold(
        appBar: _showAppBar
            ? AppBar(
                title: Text(_option == "Settings" ? "Settings" : ""),
                actions: [
                  PopupMenuButton<String>(
                    color: const Color(0xFF171514),
                    icon: Icon(Icons.more_vert), // Icon for the button
                    onSelected: _onOptionSelected,
                    itemBuilder: (BuildContext context) {
                      return {
                        'Clock': Icons.access_time,
                        'Timer': Icons.hourglass_empty,
                        'Stop Watch': Icons.timer,
                        'Settings': Icons.settings
                      }.entries.map<PopupMenuEntry<String>>((entry) {
                        return PopupMenuItem<String>(
                          value: entry.key,
                          child: Row(
                            children: [
                              Icon(entry.value),
                              SizedBox(width: 8),
                              Text(entry.key),
                            ],
                          ),
                        );
                      }).toList();
                    },
                  ),
                ],
              )
            : null,
        body: bodyWidget(_option),
      ),
    );
  }
}
>>>>>>> main
