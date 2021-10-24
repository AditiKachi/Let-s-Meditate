import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meditation/focus_med.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen(this.musicPath);
  @required
  final String musicPath;

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController iconController;
  bool isAnimated = false;
  bool showPlay = true;
  bool shopPause = false;

  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  //late final String AudioPath;
  @override
  void initState() {
    super.initState();
    iconController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    audioPlayer.open(Audio(widget.musicPath),
        autoStart: false, showNotification: true);
  }

  void AnimateIcon() {
    setState(() {
      isAnimated = !isAnimated;
      if (isAnimated) {
        iconController.forward();
        audioPlayer.play();
      } else {
        iconController.reverse();
        audioPlayer.pause();
      }
    });
  }

  void dispose() {
    iconController.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double ScreenWidth = MediaQuery.of(context).size.width;
    final double Screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (context) => FocusMeditationScreen()))),
          backgroundColor: Colors.greenAccent,
          elevation: 0.0,
        ),
        body: Center(
            child: Column(children: <Widget>[
          SizedBox(height: 20),
          Container(
            height: Screenheight * 0.25,
            width: ScreenWidth * 0.35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage('assets/focus1.jpeg'), fit: BoxFit.fill)),
          ),
          SizedBox(height: 40),
          Text("20 Minutes Meditation",
              style: TextStyle(
                  fontFamily: "Times New Roman",
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 30),
          Container(
            height: Screenheight * 0.40,
            width: ScreenWidth * 0.90,
            // color: Colors.transparent,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Icon(CupertinoIcons.backward_fill),
                        onTap: () {
                          audioPlayer.seekBy(Duration(seconds: -10));
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          AnimateIcon();
                        },
                        child: AnimatedIcon(
                          icon: AnimatedIcons.play_pause,
                          progress: iconController,
                          size: 50,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                        child: Icon(CupertinoIcons.forward_fill),
                        onTap: () {
                          audioPlayer.seekBy(Duration(seconds: 10));
                          audioPlayer.seek(Duration(seconds: 10));
                          audioPlayer.next();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ])));
  }
}
