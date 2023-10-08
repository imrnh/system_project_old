import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:twilite/widgets/music_discovery/cover_image_with_wrapper.dart';
import 'package:twilite/widgets/music_discovery/play_music_button.dart';
import 'package:twilite/widgets/music_discovery/possible_similarities_card.dart';
import 'package:twilite/widgets/music_discovery/song_annotation_bar.dart';
import 'package:twilite/widgets/topbars.dart';

class DiscoveredMusicViewPage extends StatefulWidget {
  const DiscoveredMusicViewPage({super.key});

  @override
  State<DiscoveredMusicViewPage> createState() =>
      _DiscoveredMusicViewPageState();
}

class _DiscoveredMusicViewPageState extends State<DiscoveredMusicViewPage> {
  void lyricsViewPressed() {
    print("Do something to change the screen to view the lyrics.");
  }

  @override
  Widget build(BuildContext context) {
    //fetch this data from api.
    String songTitle = "Rhythm Inside";
    String songArtist = "Calum Scott";
    String songAnnotation =
        "In publishing and graphic design, Lorem ipsum is a placeholder commonly used to demonstrate the visual form of a document or text";
    String playUrl = "https://youtu.be/-gA3H3clEqk";

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Stack(
              children: [
                getDiscoveredMusicCoverWidget(
                    context, "assets/images/cover.jpg", songTitle, songArtist),
                getTransparentTopBar(lyricsViewPressed),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            getSongAnnotationBar(context, songAnnotation),
            const SizedBox(height: 70),
            playSongButton(
                context,
                playUrl,
                const Color.fromRGBO(162, 128, 114, 1),
                const Color.fromRGBO(255, 255, 255, 1)),
            const SizedBox(
              height: 130,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Text("Possible Similarities",
                    style: GoogleFonts.inter(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ))),
            const SizedBox(
              height: 50,
            ),
            possibleSimilarDiscoveriesCard(
                context,
                "assets/images/song_2.jpg",
                "Shohorer Duita Gaan",
                "Hatirpool Session",
                "https://youtu.be/ng74uaBTC4s"),
            const SizedBox(height: 34),
            possibleSimilarDiscoveriesCard(
                context,
                "assets/images/song_1.jpg",
                "Lie to me",
                "5 seconds of summer",
                "https://youtu.be/ng74uaBTC4s"),
            const SizedBox(height: 34),
            possibleSimilarDiscoveriesCard(
                context,
                "assets/images/song_3.jpg",
                "Kodom",
                "Blue Jeans",
                "https://youtu.be/G8SKzENt8Is"),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
