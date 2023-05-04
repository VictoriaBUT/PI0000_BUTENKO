import 'package:flutter/material.dart';
import 'classes/machine.dart';
import 'classes/resources.dart';
import 'components/control_panel.dart';
import 'components/display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstScreen(title: 'Flutter Demo Home Page'),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key, required this.title});

  final String title;

  @override
  State<FirstScreen> createState() => _FirstScreen();
}

class _FirstScreen extends State<FirstScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Как вам сделать кофе:',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 70),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown),
                      child: Text(
                        'Здесь',
                      ),
                    ),
                    const SizedBox(width: 70),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown),
                      child: Text('С собой'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MainScreen();
}

class _MainScreen extends State<MainScreen> {

  Resources resources = Resources(300,300,300,300);
  late Machine machine = Machine(resources);

  int codecoffee = 0;
  void _codecoffee(int value) {
    setState(() {
      codecoffee = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      Display(machine: machine),
      ControlPanel(machine: machine),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee Machine'),
        backgroundColor: Colors.brown,
      ),
      body: IndexedStack(
        index: codecoffee,
        children: widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee_outlined),
            label: 'Display',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Control Panel',
          ),
        ],
        currentIndex: codecoffee,
        selectedItemColor: Colors.orange,
        onTap: _codecoffee,
      ),
    );
  }
}
