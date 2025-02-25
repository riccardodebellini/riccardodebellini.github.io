import 'package:portfolio/src/widgets/sizebased.widget.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Divider(
          height: 60.0,
        ).withPadding(
            horizontal: SizeBased(context,
                    ifSmall: 20.0, ifLarge: 200.0, breakpoint: 1000)
                .get()),
        const Text("Sito protetto da Copyright - (C) 2025 Riccardo Debellini")
            .muted()
            .small()
            .withPadding(
                left: SizeBased(context,
                        ifSmall: 20.0, ifLarge: 200.0, breakpoint: 1000)
                    .get(),
                right: SizeBased(context,
                        ifSmall: 20.0, ifLarge: 200.0, breakpoint: 1000)
                    .get(),
                bottom: 30)
      ],
    );
  }
}
