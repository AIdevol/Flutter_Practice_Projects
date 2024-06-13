import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_books/core/auth/login/login.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController _controller;

  @override
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/Splash_screen.mp4');
    _initializeVideoPlayer();
  }

  void _initializeVideoPlayer() async {
    try {
      await _controller.initialize();
      _controller.addListener(() {
        if (_controller.value.isPlaying) {
          return;
        }
        Get.to(LoginScreen());
      });
      setState(() {
        _controller.play();
      });
    } catch (e) {
      print('Error initializing video: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Container(
                    height: double.infinity,
                    width: 200,
                    child: VideoPlayer(_controller)),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
