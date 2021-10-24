import 'package:flutter/material.dart';
import 'package:meditation/Models/progress_operation.dart';
import 'package:meditation/card.dart';
import 'package:meditation/chakra_med.dart';
import 'package:meditation/focus_med.dart';
import 'package:meditation/mantra_med.dart';
import 'package:meditation/nothing_med.dart';
import 'package:meditation/progress.dart';
import 'package:meditation/side_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProgressOperation>(
        create: (context) => ProgressOperation(),
        child: MaterialApp(
            title: "Let's Meditate!",
            routes: {
              '/addprogress': (context) => const AddProgress(),
            },
            theme: ThemeData(
              primaryColor: Colors.greenAccent,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: HomePage()));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        elevation: 0.0,
      ),
      drawer: SideBar(),
      body: Column(
        children: <Widget>[
          Container(
              width: 500,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                //borderRadius: BorderRadius.circular(25),
                color: Colors.greenAccent,
              ),
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Hey, \nWelcome Back!",
                style: TextStyle(
                    fontFamily: "Times new Roman",
                    fontSize: 30.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
          Padding(padding: EdgeInsets.only(top: 30)),
          Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  padding: EdgeInsets.all(15),
                  children: <Widget>[
                MeditationCard('Focus meditation', 'assets/focus.jpeg',
                    FocusMeditationScreen()),
                MeditationCard('Mantra meditation', 'assets/yoga.jpeg',
                    MantraMeditationScreen()),
                MeditationCard('Chakra meditation', 'assets/chakra.jpeg',
                    ChakraMeditationScreen()),
                MeditationCard(
                    'Nothing', 'assets/nothing.jpeg', NothingScreen()),
              ])),
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 20),
            child: FlatButton(
              onPressed: () {
                Navigator.pushNamed(context, '/addprogress');
              },
              child: Text(
                "Progress",
                style: TextStyle(
                    fontFamily: "Times New Roman",
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              color: Colors.greenAccent,
              minWidth: 350,
              height: 45,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
          )
        ],
      ),
    );
  }
}
