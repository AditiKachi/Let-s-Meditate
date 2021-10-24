import 'package:flutter/material.dart';
import 'package:meditation/main.dart';

class AboutUsInfo extends StatelessWidget {
  const AboutUsInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("About App"),
          backgroundColor: Colors.greenAccent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage())),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 10, left: 10)),
            Text(
                "We are Providing you free bunch of musics that you can listen while meditate.\n"
                "In this particular App we have mentioned 4 different types of Meditation\n"
                "Doing this is you can relax your mind and also maintain focus on particular work\n"
                "We also Provided the progress field, where you can update your daily progress of your meditation"
                "\nso, Without wasting any time let's Meditate!!!",
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: "times new roman",
                ))
          ],
        ));
  }
}
