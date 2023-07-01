import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Ornek extends StatefulWidget {
  const Ornek({Key? key}) : super(key: key);

  @override
  State<Ornek> createState() => _OrnekState();
}

class _OrnekState extends State<Ornek> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  String videoUrl =
      "assets/videos/video.mp4";

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset(videoUrl)
      ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MyCustomVideoPlayer(
            customVideoPlayerController: _customVideoPlayerController
        ),
      ),
    );
  }
}
class MyCustomVideoPlayer extends StatefulWidget {
  final CustomVideoPlayerController customVideoPlayerController;

  const MyCustomVideoPlayer({super.key, required this.customVideoPlayerController});

  @override
  _MyCustomVideoPlayerState createState() => _MyCustomVideoPlayerState();
}

class _MyCustomVideoPlayerState extends State<MyCustomVideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.customVideoPlayerController
          .videoPlayerController.value.aspectRatio,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          VideoPlayer(widget.customVideoPlayerController.videoPlayerController),
          VideoProgressIndicator(
            widget.customVideoPlayerController.videoPlayerController,
            allowScrubbing: true,
            padding: const EdgeInsets.all(8.0),
          ),
        ],
      ),
    );
  }
}

class CustomVideoPlayerController {
  final BuildContext context;
  final VideoPlayerController videoPlayerController;

  CustomVideoPlayerController({
    required this.context,
    required this.videoPlayerController,
  });

  void dispose() {
    videoPlayerController.dispose();
  }
}