import 'dart:async';
import 'package:flutter/material.dart';
import 'blitz_clock_buttom2.dart';

class BlitzClockButton1 extends StatefulWidget {
  final Duration initialTime;
  final Color buttonColor;
  final Color textColor;
  // ignore: library_private_types_in_public_api
  static final GlobalKey<_BlitzClockButton1State> firstButtonKey = GlobalKey();

  const BlitzClockButton1({
    Key? key,
    required this.initialTime,
    required this.buttonColor,
    required this.textColor,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BlitzClockButton1State createState() => _BlitzClockButton1State();
}

class _BlitzClockButton1State extends State<BlitzClockButton1> {
  late Timer _timer;
  bool _isRunning = false;
  Duration _timeLeft = Duration.zero;

  @override
  void initState() {
    _timeLeft = widget.initialTime;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.05,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(widget.buttonColor),
          foregroundColor: MaterialStateProperty.all(widget.textColor),
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
        ),
        child: Text(
          '${_timeLeft.inMinutes.remainder(60).toString().padLeft(2, '0')}:'
          '${_timeLeft.inSeconds.remainder(60).toString().padLeft(2, '0')}',
          style: const TextStyle(fontSize: 96),
        ),
        onPressed: () {
          if (_isRunning) {
            _timer.cancel();
            setState(() {
              _isRunning = false;
              BlitzClockButton2.secondButtonKey.currentState!.performClick();
            });
          } else {
            _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
              setState(() {
                _timeLeft -= const Duration(seconds: 1);
              });
              if (_timeLeft.inSeconds == 0) {
                _timer.cancel();
                setState(() {
                  _isRunning = false;
                });
              }
            });
            setState(() {
              _isRunning = true;
            });
          }
        },
      ),
    );
  }

  void onPressed() {}

  void performClick() {}
}
