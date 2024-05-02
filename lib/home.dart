import 'dart:async';

import 'package:flutter/material.dart';
import 'package:icapps_torch_compat/icapps_torch_compat.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isFlashOn = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
  }
  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (isFlashOn) {
          TorchCompat.turnOff();
          isFlashOn = false;
        } else {
          TorchCompat.turnOn();
          isFlashOn = true;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: isFlashOn ?  const AssetImage('assets/background_image.jpg'): const AssetImage('assets/background_image_off.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              setState(() {
                if (isFlashOn) {
                  TorchCompat.turnOff();
                  isFlashOn = false;
                } else {
                  TorchCompat.turnOn();
                  isFlashOn = true;
                }
              });
            },
            child: const Icon(Icons.lightbulb),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () {
              _startTimer();
            },
            child: const Icon(Icons.energy_savings_leaf_outlined),
          ),
        ],
      )
    );
  }
}
