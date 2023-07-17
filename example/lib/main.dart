import 'package:flutter/material.dart';

import 'package:flutter_tilt/flutter_tilt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tilt Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const TiltDemo(),
    );
  }
}

class TiltDemo extends StatefulWidget {
  const TiltDemo({super.key});

  @override
  State<TiltDemo> createState() => _TiltDemoState();
}

class _TiltDemoState extends State<TiltDemo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: Center(
        child: Tilt(
          borderRadius: BorderRadius.circular(24),
          tiltConfig: const TiltConfig(angle: 15),
          lightConfig: const LightConfig(
            minIntensity: 0.1,
          ),
          shadowConfig: const ShadowConfig(
            minIntensity: 0.05,
            maxIntensity: 0.4,
            offsetFactor: 0.08,
            minBlurRadius: 10,
            maxBlurRadius: 15,
          ),
          childInner: [
            Positioned.fill(
              top: -20,
              child: Center(
                child: TiltParallax(
                  size: const Offset(-20, -20),
                  child: Text(
                    '$_counter',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: TiltParallax(
                size: const Offset(25, 25),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: FloatingActionButton(
                    onPressed: _incrementCounter,
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
            ),
          ],
          child: const MyHomePage(title: 'Flutter Tilt Demo'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 450,
      child: Scaffold(
        backgroundColor: const Color(0x206D6E6F),
        appBar: AppBar(
          title: Text(
            widget.title,
            style: const TextStyle(fontSize: 18),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text(
                'You have pushed the button this many times',
                style: TextStyle(fontSize: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
