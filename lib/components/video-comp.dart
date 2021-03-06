import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoComp extends StatefulWidget {
  // This will contain the URL/asset path which we want to play
  final VideoPlayerController videoPlayerController;
  final bool looping;

  VideoComp({
    @required this.videoPlayerController,
    this.looping,
    Key key,
  }) : super(key: key);

  @override
  _VideoCompState createState() => _VideoCompState();
}

class _VideoCompState extends State<VideoComp> {
  var chewieController;
  VideoPlayerController videoCtr;
  @override
  void initState() {
    super.initState();
    // Wrapper on top of the videoPlayerController
    chewieController = ChewieController(
      videoPlayerController: videoCtr,
      aspectRatio: 3 / 2,
      autoPlay: true,
      autoInitialize: true,
      looping: false,

      // Try playing around with some of these other options:
      showControls: false,
      materialProgressColors: new ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.blue,
        backgroundColor: Colors.grey,
        bufferedColor: Colors.lightGreen,
      ),
      placeholder: new Container(
        color: Colors.grey,
      ),
      // autoInitialize: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Chewie(
        controller: chewieController,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // IMPORTANT to dispose of all the used resources
    widget.videoPlayerController.dispose();
  }
}
