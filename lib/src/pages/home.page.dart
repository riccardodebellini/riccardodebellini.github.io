import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/src/widgets/footer.widget.dart';
import 'package:portfolio/src/widgets/sizebased.widget.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      child: ListView(
        children: [
          Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [


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
                      child: const Text("Contattami"),
                      onPressed: () {
                        context.go('/contact');
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
                  content: Text('Molte pagine non sono terminate e/o pronte per il mobile.\nAspettati errori e/o pagine vuote (404).'),
                  leading: Icon(LucideIcons.badge_alert),
                ),
              ]).sized(height: MediaQuery.of(context).size.height),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Card(child: Text('</>')),
              ),
              Gap(10),
              Expanded(child: Card(child: Text("</>")))
            ],
          ).sized(height: 400).withPadding(
              horizontal: SizeBased(context, ifSmall: 20.0, ifLarge: 200.0, breakpoint: 1000).get()),
          const FooterWidget()
        ],
      ),
    );
  }
}
