import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:ar_furniture/ui/reused_widgets/appbar_leading_underline.dart';
import 'package:auto_route/annotations.dart';

@RoutePage()
class ModelPage extends StatelessWidget {

  final String modelUrl;

  const ModelPage({
    required this.modelUrl,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_sharp, color: theme.primaryColor),
          onPressed: () => Navigator.pop(context),
          ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: AppBarLeadingUnderline(),
        ),
      ),
      body: ModelViewer(
        backgroundColor: theme.scaffoldBackgroundColor,
        src: modelUrl,
      ),
    );
  }
}
