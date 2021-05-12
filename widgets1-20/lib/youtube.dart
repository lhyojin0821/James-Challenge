import 'package:flutter/material.dart';
import 'package:widgets/kakaomapPage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePage extends StatelessWidget {
  String videoPath = 'https://youtu.be/KlJAiwwGHMg';
  String videoId = 'KlJAiwwGHMg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Youtube'),
      ),
      body: Column(
        children: [
          Center(
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                  initialVideoId: videoId,
                  flags: YoutubePlayerFlags(
                    mute: false,
                    autoPlay: false,
                  )),
            ),
          ),
          GestureDetector(
            child: Text('다음페이지'),
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return KaKaoMapPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
