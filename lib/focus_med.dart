import 'package:flutter/material.dart';
import 'package:meditation/main.dart';
import 'package:meditation/music_player.dart';

class FocusMeditationScreen extends StatefulWidget {
  const FocusMeditationScreen({Key? key}) : super(key: key);

  @override
  _FocusMeditationScreenState createState() => _FocusMeditationScreenState();
}

class _FocusMeditationScreenState extends State<FocusMeditationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()))),
        title: Text(
          "Focus Meditation",
          style: TextStyle(
              fontFamily: "Times new Roman",
              fontSize: 25.0,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.greenAccent,
        elevation: 0.0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            width: 500,
            height: 130,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              //borderRadius: BorderRadius.circular(25),
              color: Colors.greenAccent,
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                "Choose a target for your focus\nRelax your body\nTurn your attention on target\nFeel the music",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  FocusCard(
                    title: 'Focus Music1',
                    img: 'assets/focus1.jpeg',
                    audioPath: 'assets/focusmusic.mp3',
                  ),
                  FocusCard(
                      title: 'Focus Music2',
                      img: 'assets/focus1.jpeg',
                      audioPath: 'assets/Audios/focusmusic2.mp3'),
                  FocusCard(
                      title: 'Focus Music3',
                      img: 'assets/focus1.jpeg',
                      audioPath: 'assets/Audios/focusmusic3.mp3'),
                  FocusCard(
                      title: 'Focus Music4',
                      img: 'assets/focus1.jpeg',
                      audioPath: 'assets/Audios/focusmusic4.mp3'),
                ],
              )),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: FlatButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => HomePage())),
                  child: Text("Back",
                      style: TextStyle(
                        fontFamily: "Times New Roman",
                        fontSize: 13,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  color: Colors.greenAccent,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class FocusCard extends StatelessWidget {
  const FocusCard(
      {required this.title, required this.img, required this.audioPath});
  final String title;
  final String img;
  final String audioPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 6,
        shadowColor: Colors.grey,
        child: Row(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    img,
                    fit: BoxFit.fill,
                    width: 90,
                    height: 90,
                  ),
                ),
                Positioned.fill(
                    child: IconButton(
                  onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => MusicPlayerScreen(audioPath))),
                  icon: Icon(Icons.play_circle_fill_outlined),
                  color: Colors.black,
                ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "$title",
                style: TextStyle(
                    fontFamily: "Times new Roman",
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
