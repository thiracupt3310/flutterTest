import 'package:flutter/material.dart';
import './Food.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "paiwan app",
      home: MyHomePage(),
      theme: ThemeData(primarySwatch: Colors.lightBlue),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int number = 0;
  List<Food> menu = [
    Food("beef", "500", "assets/images/beef.jpg"),
    Food("pork", "300", "assets/images/pork.jpg"),
    Food("fish", "200", "assets/images/fish.jpg")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Dart "),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        // mainAxisAlignment: MainAxisAlignment,
        child: Column(
          children: [
            Container(
              child: Text("Count Menu: " + number.toString(), style: TextStyle(fontSize: 30),),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              height: 500,
              child: ListView.builder(
                  itemCount: menu.length,
                  itemBuilder: (BuildContext context, int index) {
                    Food food = menu[index];
                    return ListTile(
                      leading: Image.asset(food.image),
                      title: Text(
                        food.name,
                        style: TextStyle(fontSize: 30),
                      ),
                      subtitle: Text("price: " + food.price + " Bath"),
                      onTap: () {
                        print("you choose: " + food.name);
                      },
                    );
                  }),
            ),
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNumber,
        child: Icon(Icons.add),
      ),
    );
  }

  void addNumber() {
    setState(() {
      number++;
      menu.add(Food("beef", "500", "assets/images/beef.jpg"));
    });
  }

  List<Widget> getData(int count) {
    List<Widget> data = [];
    for (var i = 0; i < count; i++) {
      var menu = ListTile(
          title: Text("Menu ${i + 1}"),
          subtitle: Text(
            "pork ${i + 1}",
          ));
      data.add(menu);
    }
    data.add(Text(
      number.toString(),
      style: TextStyle(fontSize: 60),
    ));

    return data;
  }
}
