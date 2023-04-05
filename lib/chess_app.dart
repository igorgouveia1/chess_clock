import 'dart:async';

import 'package:chess_clock/shared/schemes/color_schemes.g.dart';
import 'package:flutter/material.dart';

class ChessApp extends StatefulWidget {
  const ChessApp({super.key});

  @override
  State<ChessApp> createState() => _ChessAppState();
}

class _ChessAppState extends State<ChessApp> {
  int _timeLeft1 = 300; // 5 minutos em segundos
  int _timeLeft2 = 300; // 5 minutos em segundos
  Timer? _timer1;
  Timer? _timer2;

  void _startTimer1() {
    _timer1 = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (_timeLeft1 > 0) {
          _timeLeft1--;
        } else {
          _timer1?.cancel();
        }
      });
    });
  }

  void _startTimer2() {
    _timer2 = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        if (_timeLeft2 > 0) {
          _timeLeft2--;
        } else {
          _timer2?.cancel();
        }
      });
    });
  }

  void _pauseTimer1() {
    if (_timer1 != null) {
      _timer1!.cancel();
      _timer1 = null;
      setState(() {
        _timeLeft1 = _timeLeft1;
      });
    }
  }

  void _pauseTimer2() {
    if (_timer2 != null) {
      _timer2!.cancel();
      _timer2 = null;
      setState(() {
        _timeLeft2 = _timeLeft2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.05,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_timer1 == null) {
                      _startTimer1();
                    } else {
                      _pauseTimer1();
                      _startTimer2();
                    }

                    if (_timer2 != null) {
                      _pauseTimer1();
                    }
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all(lightColorScheme.onPrimary),
                    backgroundColor:
                        MaterialStateProperty.all(lightColorScheme.primary),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  child: Text(
                    _timeLeft1 > 0
                        ? '${_timeLeft1 ~/ 60}:${(_timeLeft1 % 60).toString().padLeft(2, '0')}'
                        : '00:00',
                    style: const TextStyle(fontSize: 64),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.05,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_timer2 == null) {
                      _startTimer2();
                    } else {
                      _pauseTimer2();
                      _startTimer1();
                    }
                    if (_timer1 != null) {
                      _pauseTimer2();
                    }
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all(lightColorScheme.primary),
                    backgroundColor:
                        MaterialStateProperty.all(lightColorScheme.onPrimary),
                    shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero)),
                  ),
                  child: Text(
                    _timeLeft2 > 0
                        ? '${_timeLeft2 ~/ 60}:${(_timeLeft2 % 60).toString().padLeft(2, '0')}'
                        : '00:00',
                    style: const TextStyle(fontSize: 64),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
