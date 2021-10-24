import 'package:flutter/material.dart';
import 'package:meditation/main.dart';
import 'package:meditation/music_player.dart';

class MantraMeditationScreen extends StatefulWidget {
  // const MantraMeditationScreen(this.MusicPath);
  // @required
  // final String MusicPath;

  @override
  _MantraMeditationScreenState createState() => _MantraMeditationScreenState();
}

class _MantraMeditationScreenState extends State<MantraMeditationScreen> {
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
          "Mantra Meditation",
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
            height: 140,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              //borderRadius: BorderRadius.circular(25),
              color: Colors.greenAccent,
            ),
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Sit in the posture of meditation.\nChoose a mantra.\nIn your mind, repeat the mantra.\nYou can coordinate the mantra with the rhythm of your breathing.",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                  child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  MantraCard(
                    title: 'Mantra 1',
                    img: 'assets/focus1.jpeg',
                    audioPath: 'assets/Audios/mantramusic.mp3',
                  ),
                  MantraCard(
                      title: 'Mantra 2',
                      img: 'assets/focus1.jpeg',
                      audioPath: 'assets/Audios/mantramusic2.mp3'),
                  MantraCard(
                      title: 'Mantra 3',
                      img: 'assets/focus1.jpeg',
                      audioPath: 'assets/Audios/mantramusic3.mp3'),
                  MantraCard(
                      title: 'Mantra 4',
                      img: 'assets/focus1.jpeg',
                      audioPath: 'assets/Audios/mantramusic4.mp3'),
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

class MantraCard extends StatelessWidget {
  const MantraCard(
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
