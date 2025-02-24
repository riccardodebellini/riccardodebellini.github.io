import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/src/widgets/footer.widget.dart';
import 'package:portfolio/src/widgets/homepage.widget.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      child: ListView(
        controller: _controller,
        children: [
          Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                const Spacer(),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style.copyWith(
                        fontSize:
                            Theme.of(context).typography.x6Large.fontSize),
                    children: [
                      const TextSpan(
                        text: 'Ciao.\nMi chiamo ',
                      ),
                      TextSpan(
                          text: 'Riccardo',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary)),
                    ],
                  ),
                ),
                const Gap(10),
                const Text(
                  'Ho 16 anni e sviluppo app per passione',
                  textAlign: TextAlign.center,
                ).lead(),
                const Gap(10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OutlineButton(
                      child: const Text("Su di me"),
                      onPressed: () {
                        context.go('/aboutme');
                      },
                    ),
                    const Gap(10),
                    PrimaryButton(
                      trailing: Icon(
                        LucideIcons.arrow_right,
                        size: DefaultTextStyle.of(context).style.fontSize,
                      ),
                      onPressed: () {
                        context.go('/projects');
                      },
                      child: const Text("I miei Progetti"),
                    ),
                  ],
                ),
                const Gap(20),
                const Alert(
                  title: Text('Sito non completo'),
                  content: Text(
                      'Molte pagine non sono terminate e/o pronte per il mobile.\nAspettati errori e/o pagine vuote (404).'),
                  leading: Icon(LucideIcons.badge_alert),
                ),
                const Spacer(),
                IconButton.primary(
                  icon: const Icon(LucideIcons.chevrons_down),
                  onPressed: () {
                    _controller.animateTo(context.size!.height,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeOut);
                  },
                )
              ])
              .sized(height: MediaQuery.of(context).size.height - 120)
              .withPadding(horizontal: 20, bottom: 60),
          const HomePageWidget(),
          const FooterWidget()
        ],
      ),
    );
  }
}
