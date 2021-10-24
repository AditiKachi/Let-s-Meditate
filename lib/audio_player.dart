// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';

// class AudioFile extends StatefulWidget {
//   @override
//   _AudioFileState createState() => _AudioFileState();
// }

// class _AudioFileState extends State<AudioFile>
//     with SingleTickerProviderStateMixin {
//   late AnimationController iconController;
//   bool isAnimated = false;
//   bool showPlay = true;
//   bool shopPause = false;

//   AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
//   //late final String AudioPath;
//   @override
//   void initState() {
//     super.initState();
//     iconController = AnimationController(
//         vsync: this, duration: Duration(milliseconds: 1000));
//     audioPlayer.open(Audio('assets/focusmusic.mp3'),
//         autoStart: false, showNotification: false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     int _value = 6;
//     return Scaffold(
//         backgroundColor: Colors.greenAccent,
//         body: Center(
//           child: Column(
//             children: [
//               SizedBox(height: 2),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   InkWell(
//                     child: Icon(CupertinoIcons.backward_fill),
//                     onTap: () {
//                       audioPlayer.seekBy(Duration(seconds: -10));
//                     },
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       AnimateIcon();
//                     },
//                     child: AnimatedIcon(
//                       icon: AnimatedIcons.play_pause,
//                       progress: iconController,
//                       size: 50,
//                       color: Colors.black,
//                     ),
//                   ),
//                   InkWell(
//                     child: Icon(CupertinoIcons.forward_fill),
//                     onTap: () {
//                       audioPlayer.seekBy(Duration(seconds: 10));
//                       audioPlayer.seek(Duration(seconds: 10));
//                       audioPlayer.next();
//                     },
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }

//   void AnimateIcon() {
//     setState(() {
//       isAnimated = !isAnimated;
//       if (isAnimated) {
//         iconController.forward();
//         audioPlayer.play();
//       } else {
//         iconController.reverse();
//         audioPlayer.pause();
//       }
//     });
//   }

//   void dispose() {
//     iconController.dispose();
//     audioPlayer.dispose();
//     super.dispose();
//   }
// }
