import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/common/styles/widget_login_sing_up/costome_shapes/curved_shapes/curved_edges.dart';

class TCurvedEdgeWidget extends StatelessWidget {
  const TCurvedEdgeWidget({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TCustomCurvedEdges(), child: child);
  }
}
