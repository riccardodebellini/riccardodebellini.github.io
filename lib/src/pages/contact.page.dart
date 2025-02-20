import 'package:flutter_lucide/flutter_lucide.dart';
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
                    const TextSpan(
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
              const Gap(10),
              const Text(
                'Scopri tutti i miei canali social!',
                textAlign: TextAlign.center,
              ).lead(),
            ]).sized(height: MediaQuery.of(context).size.height / 2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
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
                        LucideIcons.github,
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
            ),
            const Gap(10),
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
                      LucideIcons.instagram,
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
        const Gap(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
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
                        LucideIcons.mail,
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
            ),
            const Gap(10),
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
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   Row(
                      children: [
                        const Icon(
                          LucideIcons.code_xml,
                          size: 32,
                        ),
                   const VerticalDivider(width: 16, thickness: 2,).sized(height: 16),
                        const Icon(LucideIcons.graduation_cap, size: 32,)                      ],
                    ),
                    const Gap(16),
                    const Text('BinaryBears.it')
                        .semiBold()
                        .large(),
                    const Gap(8),
                    const Text(
                        'Il club di informatica della mia scuola, dove ho imparato a programmare.\n(thanks to @EneaMontoli)')
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
        const FooterWidget()
      ],
    );
  }
}
