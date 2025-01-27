import 'package:portfolio/src/widgets/sizebased.widget.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import '../widgets/footer.widget.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
                      fontSize: Theme.of(context).typography.x6Large.fontSize),
                  children: [
                    TextSpan(
                      text: 'Restiamo in ',
                    ),
                    TextSpan(
                        text: 'contatto!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary)),
                  ],
                ),
              ),
              Gap(10),
              Text(
                'Scopri tutti i miei canali social!',
                textAlign: TextAlign.center,
              ).lead(),
            ]).sized(height: MediaQuery.of(context).size.height / 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Clickable(
                onPressed: () {

                },
                mouseCursor:
                    const WidgetStatePropertyAll(SystemMouseCursors.click),
                child: Card(
                  borderRadius: Theme.of(context).borderRadiusMd,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        RadixIcons.githubLogo,
                        size: 32,
                      ),
                      const Gap(16),
                      const Text('Github').semiBold().large(),
                      const Gap(8),
                      const Text(
                              'Visita il mio profilo Github e trova tutto il mio codice open-source, segnala problemi e bug e contribuisci ai miei progetti!!')
                          .muted(),
                    ],
                  ),
                ),
              ),
              flex: 2,
            ),
            Gap(10),
            Expanded(child: Clickable(
              onPressed: () {

              },
              mouseCursor: const WidgetStatePropertyAll(
                  SystemMouseCursors.click),
              child: Card(
                borderRadius: Theme.of(context).borderRadiusMd,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      RadixIcons.instagramLogo,
                      size: 32,
                    ),
                    const Gap(16),
                    const Text('Instagram')
                        .semiBold()
                        .large(),
                    const Gap(8),
                    const Text(
                        'Visita il mio profilo Instagram e segumi, anche se in realtà non posto nulla!')
                        .muted(),
                  ],
                ),
              ),
            ),)
          ],
        ).sized(height: 300).withPadding(
            horizontal:
                SizeBased(context, ifSmall: 20.0, ifLarge: 200.0, breakpoint: 1000)
                    .get()),
        Gap(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Clickable(
                onPressed: () {

                },
                mouseCursor:
                const WidgetStatePropertyAll(SystemMouseCursors.click),
                child: Card(
                  borderRadius: Theme.of(context).borderRadiusMd,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        RadixIcons.envelopeClosed,
                        size: 32,
                      ),
                      const Gap(16),
                      const Text('Email').semiBold().large(),
                      const Gap(8),
                      const Text(
                          'Inviami una mail')
                          .muted(),
                    ],
                  ),
                ),
              ),
              flex: 1,
            ),
            Gap(10),
            Expanded(
              flex: 2,
              child: Clickable(
              onPressed: () {

              },
              mouseCursor: const WidgetStatePropertyAll(
                  SystemMouseCursors.click),
              child: Card(
                borderRadius: Theme.of(context).borderRadiusMd,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      RadixIcons.code,
                      size: 32,
                    ),
                    const Gap(16),
                    const Text('BinaryBears.it')
                        .semiBold()
                        .large(),
                    const Gap(8),
                    const Text(
                        'Il club di informatica della mia scuola, dove ho imparato a programmare.\n(thanks to @eneamontoli)')
                        .muted(),
                  ],
                ),
              ),
            ),)
          ],
        ).sized(height: 300).withPadding(
            horizontal:
            SizeBased(context, ifSmall: 20.0, ifLarge: 200.0, breakpoint: 1000)
                .get()),
        FooterWidget()
      ],
    );
  }
}
