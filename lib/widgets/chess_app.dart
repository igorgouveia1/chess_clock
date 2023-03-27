// chamar o app de blitzchess clock
import 'dart:async';
import 'package:flutter/material.dart';

import 'blitz_clock_buttom1.dart';
import 'blitz_clock_buttom2.dart';

class ChessApp extends StatefulWidget {
  const ChessApp({super.key});

  @override
  State<ChessApp> createState() => _ChessAppState();
}

class _ChessAppState extends State<ChessApp> {
  final Color lightGreenBlue = const Color(0xFF55efc4);
  final Color cityLight = const Color(0xFFdfe6e9);
  Duration timeLeft1 = const Duration(minutes: 5);
  Duration timeLeft2 = const Duration(minutes: 5);
  bool isRunning = false;
  late Timer timer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xFFdfe6e9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFdfe6e9),
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Time Control')),
            ListTile(
              title: const Text('1 min'),
              onTap: () {
                setState(() {
                  timeLeft1 = const Duration(minutes: 1);
                  timeLeft2 = const Duration(minutes: 1);
                  isRunning = false;
                });
                timer.cancel();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('3 min'),
              onTap: () {
                setState(() {
                  timeLeft1 = const Duration(minutes: 3);
                  timeLeft2 = const Duration(minutes: 3);
                  isRunning = false;
                });
                timer.cancel();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('5 min'),
              onTap: () {
                setState(() {
                  timeLeft1 = const Duration(minutes: 5);
                  timeLeft2 = const Duration(minutes: 5);
                  isRunning = false;
                });
                timer.cancel();
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            BlitzClockButton1(
              buttonColor: lightGreenBlue,
              textColor: cityLight,
              initialTime: timeLeft1,
            ),
            BlitzClockButton2(
              buttonColor: cityLight,
              textColor: lightGreenBlue,
              initialTime: timeLeft2,
            ),
          ],
        ),
      ),
    );
  }
}
