import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/common/styles/widget_login_sing_up/costome_shapes/container/circle_container.dart';
import 'package:flutter_application_1/common/styles/widget_login_sing_up/costome_shapes/curved_shapes/curved_edge_widget.dart';
import 'package:flutter_application_1/utills/constants/colors.dart';

class TCurvedHeaderedgewidget extends StatelessWidget {
  const TCurvedHeaderedgewidget({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.primaryColor,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            Positioned(
              top: -200,
              right: -250,
              child: TcircleContainer(
                  backgroundcolor: TColors.textWhite.withOpacity(0.1)),
            ),
            Positioned(
              top: 70,
              right: -300,
              child: TcircleContainer(
                  backgroundcolor: TColors.textWhite.withOpacity(0.1)),
            ),
            child
          ],
        ),
      ),
    );
  }
}
