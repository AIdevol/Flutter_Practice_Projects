import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class WhatsAppHome extends StatelessWidget {
  final List<CameraDescription>? cameras;

  WhatsAppHome({required this.cameras});

  @override
  Widget build(BuildContext context) {
    if (cameras == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // Use the cameras here
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp Home"),
      ),
      body: Center(
        child: Text("Camera count: ${cameras!.length}"),
      ),
    );
  }
}
