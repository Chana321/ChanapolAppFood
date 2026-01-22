import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPudding extends StatefulWidget {
  final String title;
  final String videoUrl;
  const VideoPudding({super.key, required this.title, required this.videoUrl});

  @override
  State<VideoPudding> createState() => _VideoPuddingState();
}

class _VideoPuddingState extends State<VideoPudding> {
  late VideoPlayerController controller;
  bool isInitialized = false;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.asset(widget.videoUrl)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            isInitialized = true;
          });
          controller.play();
        }
      });

    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 35, 35, 35),
      ),
      body: isInitialized
          ? Column(
              children: [
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: controller.value.aspectRatio,
                      child: VideoPlayer(controller),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: VideoProgressIndicator(
                    controller,
                    allowScrubbing: true,
                    colors: VideoProgressColors(
                      playedColor: Colors.red,
                      bufferedColor: Colors.grey,
                      backgroundColor: Colors.white24,
                    ),
                  ),
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        final current = controller.value.position;
                        final target = current - Duration(seconds: 10);
                        controller.seekTo(
                          target < Duration.zero ? Duration.zero : target,
                        );
                      },
                      icon: Icon(
                        Icons.replay_10,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),

                    SizedBox(width: 20),

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          controller.value.isPlaying
                              ? controller.pause()
                              : controller.play();
                        },
                        icon: Icon(
                          controller.value.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),

                    SizedBox(width: 20),

                    IconButton(
                      onPressed: () {
                        final current = controller.value.position;
                        final total = controller.value.duration;
                        final target = current + Duration(seconds: 10);
                        controller.seekTo(target > total ? total : target);
                      },
                      icon: Icon(
                        Icons.forward_10,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 30),
              ],
            )
          : Center(child: CircularProgressIndicator(color: Colors.white)),
    );
  }
}
