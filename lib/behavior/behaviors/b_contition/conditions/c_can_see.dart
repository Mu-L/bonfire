import 'package:bonfire/behavior/behaviors/b_contition/condition.dart';
import 'package:bonfire/bonfire.dart';

class CCanSee extends Condition {
  final GameComponent target;
  final double radiusVision;
  final double? visionAngle;
  final double angle;
  final Function(GameComponent)? observed;

  CCanSee({
    required this.target,
    this.radiusVision = 32,
    this.visionAngle,
    this.angle = 3.14159,
    this.observed,
  });
  @override
  bool execute(GameComponent comp, BonfireGameInterface game) {
    if (comp is Vision) {
      bool see = false;
      comp.seeComponent(
        target,
        radiusVision: radiusVision,
        visionAngle: visionAngle,
        angle: angle,
        observed: (c) {
          observed?.call(c);
          return see = true;
        },
      );
      return see;
    } else {
      return false;
    }
  }
}
