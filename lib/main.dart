import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double xPosition = 0;
  double yPosition = 0;

  _dragUpdateDetails(DragUpdateDetails details) => setState(() {
        xPosition += details.delta.dx;
        yPosition += details.delta.dy;
      });

  _mathDo(Size size) {
    double quarterRang = (size.width / 4);
    print('x position $xPosition');
    print('Q quarterRang $quarterRang');

    if (xPosition <= (quarterRang - 25)) {
      setState(() {
        xPosition = ((size.width / 4)) / 2 - 50 / 2;
        yPosition = size.height / 2 - 50 / 2;
      });
    } else if (xPosition >= quarterRang - 25 &&
        xPosition <= (quarterRang * 2) - 25) {
      setState(() {
        xPosition = (quarterRang * 2) / 2 + 25;
        yPosition = size.height / 2 - 50 / 2;
      });
    } else if (xPosition >= (quarterRang * 2) - 25 &&
        xPosition <= (quarterRang * 3) - 25) {
      setState(() {
        xPosition = (quarterRang * 3) / 2 + 75;
        yPosition = size.height / 2 - 50 / 2;
      });
    } else {
      setState(() {
        xPosition = (quarterRang * 4) / 2 + 125;
        yPosition = size.height / 2 - 50 / 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: size.height - 30,
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(color: Colors.red),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(color: Colors.yellow),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(color: Colors.blue),
                        ),
                        flex: 1,
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(color: Colors.green),
                            ),
                          ],
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                  Positioned(
                      left: (size.width / 4) / 2 - 30,
                      top: (size.height) / 2 - 30,
                      child: Container(
                        height: 60,
                        width: 60,
                        color: Colors.black,
                      )),
                  Positioned(
                      left: (size.width / 3) * 2 / 2 - 14,
                      top: (size.height) / 2 - 30,
                      child: Container(
                        height: 60,
                        width: 60,
                        color: Colors.black,
                      )),
                  Positioned(
                      left: (size.width / 2) * 2 / 2 + 18,
                      top: (size.height) / 2 - 30,
                      child: Container(
                        height: 60,
                        width: 60,
                        color: Colors.black,
                      )),
                  Positioned(
                      left: (size.width) - 86,
                      top: (size.height) / 2 - 30,
                      child: Container(
                        height: 60,
                        width: 60,
                        color: Colors.black,
                      )),
                  Positioned(
                    left: xPosition,
                    top: yPosition,
                    child: GestureDetector(
                      onPanUpdate: (details) => _dragUpdateDetails(details),
                      onPanEnd: (v) => _mathDo(size),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: (size.width / 4) + 25,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                'Q1',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: (size.width / 4),
                            color: Colors.purple,
                            child: Center(
                              child: Text(
                                'Q2',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            width: (size.width / 4),
                            color: Colors.pink,
                            child: Center(
                              child: Text(
                                'Q3',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
