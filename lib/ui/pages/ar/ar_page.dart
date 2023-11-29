import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:auto_route/annotations.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:ar_furniture/ui/reused_widgets/text_elevated_button.dart';
import 'package:ar_furniture/generated/l10n.dart';

import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';

@RoutePage()
class ArPage extends StatefulWidget {

  final String glbUrl;

  const ArPage({
    super.key,
    required this.glbUrl,
  });

  @override
  State<ArPage> createState() => _ArPageState();
}

class _ArPageState extends State<ArPage> {
  late ARSessionManager arSessionManager;
  late ARObjectManager arObjectManager;
  late ARAnchorManager arAnchorManager;
  late ARNode? _node;
  late ARAnchor? _anchor;

  @override
  void dispose() {
    super.dispose();
    arSessionManager.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ARView(
            onARViewCreated: onARViewCreated,
            planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: TextElevatedButton(
                function: onRemoveEverything, 
                text: S.of(context).removeModel,
            ),
          ),
        ],
      )
    );
  }

  void onARViewCreated(
      ARSessionManager sessionManager,
      ARObjectManager objectManager,
      ARAnchorManager anchorManager,
      ARLocationManager locationManager) {
    arSessionManager = sessionManager;
    arObjectManager = objectManager;
    arAnchorManager = anchorManager;
    arSessionManager.onInitialize(
      showFeaturePoints: false,
      showWorldOrigin: true,
      handlePans: true,
      handleRotation: true,
    );
    arObjectManager.onInitialize();

    arSessionManager.onPlaneOrPointTap = onPlaneOrPointTapped;
  }

  Future<void> onRemoveEverything() async {
    if (_anchor != null) {
      arAnchorManager.removeAnchor(_anchor!);
    }
    _anchor = null;
  }

  Future<void> onPlaneOrPointTapped(
      List<ARHitTestResult> hitTestResults) async {
    if (_node != null && _anchor != null){
      return;
    }
    var singleHitTestResult = hitTestResults.firstWhereOrNull(
            (hitTestResult) => hitTestResult.type == ARHitTestResultType.plane);
    if (singleHitTestResult == null) {
      return;
    }
    var newAnchor =
    ARPlaneAnchor(transformation: singleHitTestResult.worldTransform);
    bool didAddAnchor = await arAnchorManager.addAnchor(newAnchor) ?? false;
    if (!didAddAnchor) {
      arSessionManager.onError(S.current.arError);
    }
    _anchor = newAnchor;
    var newNode = ARNode(
        type: NodeType.webGLB,
        uri: widget.glbUrl,
        position: Vector3(0.0, 0.0, 0.0),
    );
    bool didAddNodeToAnchor = await arObjectManager.addNode(
        newNode, planeAnchor: newAnchor) ?? false;
    if (!didAddNodeToAnchor){
      arSessionManager.onError(S.current.arError);
      _anchor = null;
      arAnchorManager.removeAnchor(newAnchor);
    }
    _node = newNode;
  }
}
