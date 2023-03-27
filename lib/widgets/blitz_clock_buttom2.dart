import 'dart:async';
import 'package:chess_clock/widgets/blitz_clock_buttom1.dart';
import 'package:flutter/material.dart';

class BlitzClockButton2 extends StatefulWidget {
  final Duration initialTime;
  final Color buttonColor;
  final Color textColor;
  // ignore: library_private_types_in_public_api
  static final GlobalKey<_BlitzClockButton2State> secondButtonKey = GlobalKey();

  const BlitzClockButton2({
    Key? key,
    required this.initialTime,
    required this.buttonColor,
    required this.textColor,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BlitzClockButton2State createState() => _BlitzClockButton2State();
}

class _BlitzClockButton2State extends State<BlitzClockButton2> {
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

              // ignore: unnecessary_null_comparison
              if (BlitzClockButton1.firstButtonKey != null) {
                BlitzClockButton1.firstButtonKey.currentState!.performClick();
              }
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
