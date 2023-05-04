import 'package:flutter/material.dart';
import 'resources.dart';

void main() {
  runApp(const MyApp());
}

const List<String> list = <String>[' - ','Экспрессо', 'Will be later'];

class Machine {

  Resources resources;
  Machine(this.resources);

  bool isAvaliable() {
    if (resources.water >= 100 && resources.coffeeBeans >= 50)
      return true;
    else
      return false;
  }

  makingExpresso() {
    if (isAvaliable() == true) {
      resources.coffeeBeans -= 50;
      resources.water -= 100;
    }
  }
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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Machine myclass = new Machine();

  String dropdownValue = list.first;
  String text = 'Ожидание';
  int codecoffee = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  Text('Выберете кофе:   '),
                  DropdownButton(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple, ),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                        for (int i = 0; i < list.length; i++)
                          {
                            if(value == list[i])
                              {
                                codecoffee = i;
                                break;
                              }
                          }
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, textAlign: TextAlign.center),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        dropdownValue;
                      });
                      if(myclass.isAvaliable() == true && codecoffee == 1)
                        {
                          setState(() {
                            myclass.makingExpresso();
                            text = 'Кофе готовится';
                            Future.delayed(Duration(milliseconds: 10000), () {
                              setState(() {
                                text = 'Кофе готово';
                              });
                            });
                          });
                        }
                      else
                        {
                          setState(() {
                            text = 'Не хватает ингредиентов';
                          });
                        }
                    },
                    child: Text('Приготовить'),
                  ),
                  Text(text)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
