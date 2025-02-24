import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/src/widgets/sizebased.widget.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import 'clickablecard.widget.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

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
              children: [_projectsCard(context)],
            ).sized(height: 250),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                _contactCard(context),
              ],
            ).sized(height: 250),
          ],
        ).withPadding(horizontal: 20),
        ifLarge: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _projectsCard(context),
                const Gap(10),
                _contactCard(context)
              ],
            ).sized(height: 300).withPadding(
                horizontal: SizeBased(context,
                        ifSmall: 20.0, ifLarge: 200.0, breakpoint: 1000)
                    .get()),
          ],
        )).get();
  }
}

ClickableCard _projectsCard(BuildContext context) {
  return ClickableCard.column(
    onClick: () {
      context.go('/projects');
    },
    flex: 2,
    children: [
      const Icon(
        LucideIcons.folder_code,
        size: 32,
      ),
      const Gap(16),
      const Text('Progetti').semiBold().large(),
      const Gap(8),
      const Text(
              'I miei progetti, attivi e passati, da Scratch a Flutter, passando per Python, Fortran, HTML e UI-UX/Graphic Design.')
          .muted(),
    ],
  );
}

ClickableCard _contactCard(BuildContext context) {
  return ClickableCard.column(
    children: [
      const Icon(
        LucideIcons.user,
        size: 32,
      ),
      const Gap(16),
      const Text('Contatti').semiBold().large(),
      const Gap(8),
      const Text(
              'Entra in contatto con me, scopri il mio profilo GitHub e molto altro')
          .muted(),
    ],
    onClick: () {
      context.go('/contact');
    },
  );
}
