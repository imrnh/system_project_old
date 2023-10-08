import 'package:flutter/material.dart';
import 'package:twilite/api/sample_lyrics.dart';
import 'package:twilite/pages/friends/chat.dart';
import 'package:twilite/pages/homepage.dart';
import 'package:twilite/pages/music_discovery/discovered_music_view.dart';
import 'package:twilite/pages/music_discovery/lyrics_view.dart';
import 'package:twilite/widgets/appbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String appName = "Twilite";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: ChatPage(myUID: "2343", frUID: "4009viodsf"),
    );
  }
}


// LyricsViewPage(
// songName: "Rhythm Inside",
// songArtist: "Calum Scott",
// lyricsText: sampleLyrics(),
// songUUID: "192032",
// gradientBeingColor: const Color.fromRGBO(162, 128, 114, .56),
// gradientEndColor: const Color.fromRGBO(184, 159, 149, 0.41)),