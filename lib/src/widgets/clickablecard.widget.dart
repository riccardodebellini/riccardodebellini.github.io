import 'package:shadcn_flutter/shadcn_flutter.dart';

class ClickableCard extends StatelessWidget {
  final void Function() onClick;
  final int flex;
  final Widget child;

  const ClickableCard({
    super.key,
    required this.onClick,
    this.flex = 1,
    required this.child,
  });

  factory ClickableCard.column({
    required void Function() onClick,
    int flex = 1,
    required List<Widget> children,
  }) {
    return ClickableCard(
      onClick: onClick,
      flex: flex,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: children,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: flex,
        child: Clickable(
          onPressed: onClick,
          mouseCursor: const WidgetStatePropertyAll(SystemMouseCursors.click),
          child: Card(
            borderRadius: Theme.of(context).borderRadiusMd,
            child: child,
          ),
        ));
  }
}
