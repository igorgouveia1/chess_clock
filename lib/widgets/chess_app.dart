// chamar o app de blitzchess clock
import 'dart:async';
import 'package:flutter/material.dart';

class ChessApp extends StatefulWidget {
  const ChessApp({super.key});

  @override
  State<ChessApp> createState() => _ChessAppState();
}

class _ChessAppState extends State<ChessApp> {
  final Color lightGreenBlue = const Color(0xFF55efc4);
  // Using hex value for the color
  final Color cityLight = const Color(0xFFdfe6e9);
  // Using hex value for the color
  Duration timeLeft = const Duration(minutes: 5);
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
            const DrawerHeader(child: Text('teste')),
            ListTile(
              title: const Text('Definir tempo para 1 minuto'),
              onTap: () {
                setState(() {
                  timeLeft = const Duration(minutes: 1);
                  isRunning = false;
                });
                timer.cancel();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Definir tempo para 3 minuto'),
              onTap: () {
                setState(() {
                  timeLeft = const Duration(minutes: 3);
                  isRunning = false;
                });
                timer.cancel();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Definir tempo para 5 minuto'),
              onTap: () {
                setState(() {
                  timeLeft = const Duration(minutes: 5);
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
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2.05,
                width: double.infinity,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Color(0xFF55efc4)),
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  child: Text(
                    '${timeLeft.inMinutes.remainder(60).toString().padLeft(2, '0')}:'
                    '${timeLeft.inSeconds.remainder(60).toString().padLeft(2, '0')}:'
                    '${timeLeft.inMilliseconds.remainder(60).toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 96),
                  ),
                  onPressed: () {
                    if (isRunning) {
                      timer.cancel();
                      setState(() {
                        isRunning = false;
                      });
                    } else {
                      timer =
                          Timer.periodic(const Duration(seconds: 1), (timer) {
                        setState(() {
                          timeLeft -= const Duration(seconds: 1);
                        });
                        if (timeLeft.inSeconds == 0) {
                          timer.cancel();
                          setState(() {
                            isRunning = false;
                          });
                        }
                      });
                      setState(() {
                        isRunning = true;
                      });
                    }
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2.05,
                width: double.infinity,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                    foregroundColor:
                        MaterialStatePropertyAll(Color(0xFF55efc4)),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                  ),
                  child: Text(
                    '${timeLeft.inMinutes.remainder(60).toString().padLeft(2, '0')}:'
                    '${timeLeft.inSeconds.remainder(60).toString().padLeft(2, '0')}:'
                    '${timeLeft.inMilliseconds.remainder(60).toString().padLeft(2, '0')}',
                    style: const TextStyle(fontSize: 96),
                  ),
                  onPressed: () {
                    if (isRunning) {
                      timer.cancel();
                      setState(() {
                        isRunning = false;
                      });
                    } else {
                      timer =
                          Timer.periodic(const Duration(seconds: 1), (timer) {
                        setState(() {
                          timeLeft -= const Duration(seconds: 1);
                        });
                        if (timeLeft.inSeconds == 0) {
                          timer.cancel();
                          setState(() {
                            isRunning = false;
                          });
                        }
                      });
                      setState(() {
                        isRunning = true;
                      });
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
