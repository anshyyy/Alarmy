import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  int _selectedHour = 0;
  int _selectedMinute = 0;
  int _selectedSecond = 0;
  bool _isTimerRunning = false;
  bool _showIcon = false;
  Timer? _timer;
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _timerStartedOnce = false; // Flag to check if the timer was started once

  @override
  void initState() {
    super.initState();
    _getSavedAudioPreference();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showTimePickerDialog();
    });
  }

  Future<void> _showTimePickerDialog() async {
    final pickedTime = await showDialog<Map<String, int>>(
      context: context,
      builder: (context) {
        return TimePickerDialog();
      },
    );

    if (pickedTime != null) {
      setState(() {
        _selectedHour = pickedTime['hour']!;
        _selectedMinute = pickedTime['minute']!;
        _selectedSecond = pickedTime['second']!;
      });
    }
  }

  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }

    setState(() {
      _isTimerRunning = true;
      _timerStartedOnce = true; // Mark that the timer has started once
    });

    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_selectedSecond > 0) {
          _selectedSecond--;
        } else if (_selectedMinute > 0) {
          _selectedMinute--;
          _selectedSecond = 59;
        } else if (_selectedHour > 0) {
          _selectedHour--;
          _selectedMinute = 59;
          _selectedSecond = 59;
        } else {
          _timer!.cancel();
          _isTimerRunning = false;
          if (_timerStartedOnce) {
            _playSound(); // Play sound only if the timer was started at least once
            _showStopDialog();
          }
          print("Timer is completed");
        }
      });
    });
  }

  void _stopTimer() {
    setState(() {
      _isTimerRunning = false;
    });
    _timer?.cancel();
    _audioPlayer.stop(); // Stop the audio when the timer is stopped
  }

  void _toggleTimer() {
    if (_isTimerRunning) {
      _stopTimer();
    } else {
      _startTimer();
    }
  }

  void _handleSingleTap() {
    setState(() {
      _showIcon = !_showIcon;
    });
  }

  Future<void> _playSound() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(AssetSource('sounds/$audio.mp3'));
  }

  String audio = "alarm";

  void _getSavedAudioPreference() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? audioPref = prefs.getString("audio");
    if (audioPref != null) {
      setState(() {
        audio = audioPref;
      });
    }
  }

  Future<void> _showStopDialog() async {
    bool shouldStop = await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return AlertDialog(
              backgroundColor: const Color(0xFF171514),
              title: const Text('Timer Completed'),
              content: const Text(
                  'The timer has completed. Do you want to stop the sound?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pop(true); // Return true to stop the timer
                  },
                  child: Text('Stop'),
                ),
              ],
            );
          },
        ) ??
        false;

    if (shouldStop) {
      _stopTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: _showIcon
            ? [
                IconButton(
                  icon: Icon(Icons.timer),
                  onPressed: _showTimePickerDialog,
                ),
              ]
            : [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: _handleSingleTap,
                  onDoubleTap: _toggleTimer,
                  child: SizedBox(
                    width: constraints.maxWidth,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        '$_selectedHour:$_selectedMinute:$_selectedSecond',
                        style: TextStyle(fontSize: 1),
                      ),
                    ),
                  ),
                ),
                const Spacer()
              ],
            );
          },
        ),
      ),
    );
  }
}

class TimePickerDialog extends StatefulWidget {
  @override
  _TimePickerDialogState createState() => _TimePickerDialogState();
}

class _TimePickerDialogState extends State<TimePickerDialog> {
  final FixedExtentScrollController _controllerHour =
      FixedExtentScrollController(initialItem: 0);
  final FixedExtentScrollController _controllerMinute =
      FixedExtentScrollController(initialItem: 0);
  final FixedExtentScrollController _controllerSecond =
      FixedExtentScrollController(initialItem: 0);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF171514),
      title: Text('Pick Time'),
      content: Container(
        height: 300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTimePickerColumn('Hour', _controllerHour, 100),
            _buildTimePickerColumn('Minute', _controllerMinute, 60),
            _buildTimePickerColumn('Second', _controllerSecond, 60),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop({
              'hour': _controllerHour.selectedItem,
              'minute': _controllerMinute.selectedItem,
              'second': _controllerSecond.selectedItem,
            });
          },
          child: Text('OK'),
        ),
      ],
    );
  }

  Widget _buildTimePickerColumn(
      String label, FixedExtentScrollController controller, int itemCount) {
    return Column(
      children: [
        Text(label,
            style: const TextStyle(color: Colors.blueGrey, fontSize: 18)),
        Container(
          width: 100,
          height: 150,
          child: ListWheelScrollView.useDelegate(
            controller: controller,
            itemExtent: 50,
            physics: FixedExtentScrollPhysics(),
            overAndUnderCenterOpacity: 0.5,
            perspective: 0.003,
            diameterRatio: 1.5,
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                return Center(
                  child: Text(
                    index.toString(),
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                );
              },
              childCount: itemCount,
            ),
          ),
        ),
      ],
    );
  }
}
