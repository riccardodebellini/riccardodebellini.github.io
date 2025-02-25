import 'package:shadcn_flutter/shadcn_flutter.dart';

class SizeBased {
  final dynamic ifSmall;
  final dynamic ifLarge;
  final int breakpoint;
  final BuildContext context;

  const SizeBased(
    this.context, {
    required this.ifSmall,
    required this.ifLarge,
    this.breakpoint = 800,
  });

  get() {
    final size = MediaQuery.of(context).size.width;
    bool isLarge = true;
    size < breakpoint ? isLarge = false : null;
    if (isLarge) return ifLarge;
    return ifSmall;
  }
}
