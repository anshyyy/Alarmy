import 'package:flutter/material.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({Key? key}) : super(key: key);

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  Stream<String> _clockStream() {
    return Stream<String>.periodic(const Duration(seconds: 1), (int count) {
      return _formattedTime();
    });
  }

  String _formattedTime() {
    final now = DateTime.now();
    return "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: SizedBox(
                width: constraints.maxWidth,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: StreamBuilder<String>(
                    stream: _clockStream(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.active ||
                          snapshot.connectionState == ConnectionState.waiting) {
                        return Text(
                          snapshot.data ?? '',
                          style: TextStyle(fontSize: 100),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
