import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:portfolio/src/widgets/sizebased.widget.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'clickablecard.widget.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizeBased(context,
        breakpoint: 600,
        ifSmall: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [_githubCard],
            ).sized(height: 250),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                _instagramCard,
              ],
            ).sized(height: 250),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [_mailCard],
            ).sized(height: 250),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                _binaryBearsCard,
              ],
            ).sized(height: 250),
          ],
        ).withPadding(horizontal: 20),
        ifLarge: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [_githubCard, const Gap(10), _instagramCard],
            ).sized(height: 300).withPadding(
                horizontal: SizeBased(context,
                        ifSmall: 20.0, ifLarge: 200.0, breakpoint: 1000)
                    .get()),
            const Gap(10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [_mailCard, const Gap(10), _binaryBearsCard],
            ).sized(height: 300).withPadding(
                horizontal: SizeBased(context,
                        ifSmall: 20.0, ifLarge: 200.0, breakpoint: 1000)
                    .get()),
          ],
        )).get();
  }
}

final ClickableCard _githubCard = ClickableCard.column(
  onClick: () {
    const url = 'https://github.com/riccardodebellini/';
    launchUrl(Uri.parse(url));
  },
  flex: 2,
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
);

final ClickableCard _instagramCard = ClickableCard.column(
  children: [
    const Icon(
      LucideIcons.instagram,
      size: 32,
    ),
    const Gap(16),
    const Text('Instagram').semiBold().large(),
    const Gap(8),
    const Text(
            'Visita il mio profilo Instagram e segumi, anche se in realtà non posto nulla!')
        .muted(),
  ],
  onClick: () {
    const url = 'https://instagram.com/riccardodebellini/';
    launchUrl(Uri.parse(url));
  },
);
final ClickableCard _mailCard = ClickableCard.column(
  children: [
    const Icon(
      LucideIcons.mail,
      size: 32,
    ),
    const Gap(16),
    const Text('Email').semiBold().large(),
    const Gap(8),
    const Text('Inviami una mail').muted(),
  ],
  onClick: () {
    const url = 'mailto:riccardodebellini+info@gmail.com';
    launchUrl(Uri.parse(url));
  },
);
final ClickableCard _binaryBearsCard = ClickableCard.column(
  flex: 2,
  onClick: () {
    const url = 'https://binarybears.it';
    launchUrl(Uri.parse(url));
  },
  children: [
    Row(
      children: [
        const Icon(
          LucideIcons.code_xml,
          size: 32,
        ),
        const VerticalDivider(
          width: 16,
          thickness: 2,
        ).sized(height: 16),
        const Icon(
          LucideIcons.graduation_cap,
          size: 32,
        )
      ],
    ),
    const Gap(16),
    const Text('BinaryBears.it').semiBold().large(),
    const Gap(8),
    const Text(
            'Il club di informatica della mia scuola, dove ho imparato a programmare.\n(thanks to @EneaMontoli)')
        .muted(),
  ],
);
