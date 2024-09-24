import 'package:flutter/material.dart';

class ImageBackgroundScaffold extends StatelessWidget {
  const ImageBackgroundScaffold(
      {super.key, this.appBar, this.drawer, this.child});
  final AppBar? appBar;
  final Drawer? drawer;
  final Widget? child;

  final backgroundImage = const DecorationImage(
      image: AssetImage('assets/images/background.png'), fit: BoxFit.cover);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: drawer,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(image: backgroundImage),
        child: SafeArea(
          child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black],
                      stops: [0.5, 0.9],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              child: child),
        ),
      ),
    );
  }
}
