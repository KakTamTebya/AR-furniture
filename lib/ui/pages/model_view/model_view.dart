import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:ar_furniture/constants.dart';

class ModelView extends StatelessWidget {
  final String modelUrl;

  const ModelView({required this.modelUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_sharp, color: kBottomNavBarColor),
          onPressed: () => Navigator.pop(context),
          ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 1,
              color: kBottomNavBarColor.withOpacity(0.7),
              width: 56,
            ),
          ),
        ),
      ),
      body: ModelViewer(
        backgroundColor: kBackgroundColor,
        src: modelUrl,
        alt: 'A 3D model of an astronaut',
      ),
    );
  }
}
