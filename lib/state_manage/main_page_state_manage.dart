import 'package:flutter/material.dart';
import 'package:bottomsheetexample/main_page.dart';
import 'package:video_player/video_player.dart';

abstract class MainPageStateManage extends State<MainPage>{
  String videoUrl = "https://assets/videos/video.mp4";
  bool isLoading = false;
  late VideoPlayerController videoPlayerController;

  void _changeLoading(){
    setState(() {
      isLoading = !isLoading;
    });
  }
  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset(videoUrl);
    initAlizePlayer();
  }

  Future<void> initAlizePlayer() async {
    _changeLoading();
    await videoPlayerController.initialize().then((value) {
      videoPlayerController.play();
      initSetState();
    });
    _changeLoading();
  }

  void initSetState(){setState(() {});}

}