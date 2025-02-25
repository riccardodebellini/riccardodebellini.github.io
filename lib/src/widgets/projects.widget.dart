import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/src/widgets/sizebased.widget.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import 'clickablecard.widget.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({super.key});

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
              children: [_myBookshelfCard(context)],
            ).sized(height: 300),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [_fantaProfCard(context)],
            ).sized(height: 300),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [_myDiarioCard(context)],
            ).sized(height: 300),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [_loginTerminalCard(context)],
            ).sized(height: 300),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [_materialComponentsCard(context)],
            ).sized(height: 300),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [_rdGamesCard(context)],
            ).sized(height: 300),

          ],
        ).gap(10).withPadding(horizontal: 20),
        ifLarge: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [_myBookshelfCard(context)],
            ).sized(height: 300).withPadding(
                horizontal: SizeBased(context,
                    ifSmall: 20.0, ifLarge: 200.0, breakpoint: 1000)
                    .get()),
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [_myDiarioCard(context), const Gap(10), _fantaProfCard(context)],
            ).sized(height: 300).withPadding(
                horizontal: SizeBased(context,
                    ifSmall: 20.0, ifLarge: 200.0, breakpoint: 1000)
                    .get()),
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [_loginTerminalCard(context), _materialComponentsCard(context), _rdGamesCard(context)],
            ).gap(10).sized(height: 300).withPadding(
                horizontal: SizeBased(context,
                    ifSmall: 20.0, ifLarge: 200.0, breakpoint: 1000)
                    .get()),
          ],
        ).gap(10)).get();
  }
}

ClickableCard _myBookshelfCard(BuildContext context) {
  return ClickableCard.column(
    flex: 2,
  children: [
    const Icon(
      LucideIcons.library,
      size: 32,
    ),
    const Gap(16),
    const Text('My.Bookshelf').semiBold().large(),
    const Gap(8),
    const Wrap(
      spacing: 4,
      runSpacing: 4,
      children: [
        PrimaryBadge(
          child: Text('In sviluppo'),
        ),
        PrimaryBadge(
          child: Text('Flutter/Dart'),
        ),
      ],
    ),
    const Gap(8),
    const Text(
        'MyBookshelf è un\'applicazione che ti consente di organizzare e tenere traccia dei tuoi libri, con Flutter e Supabase. Catalogare i tuoi libri non è mai stato così facile.')
        .muted(),
  ],
  onClick: () {
    context.go('/projects/mybookshelf');
  },
);
}
ClickableCard _fantaProfCard(BuildContext context) {
  return ClickableCard.column(
    flex: 2 ,
    children: [
      const Icon(
        LucideIcons.school,
        size: 32,
      ),
      const Gap(16),
      const Text('FantaProf').semiBold().large(),
      const Gap(8),
      const Wrap(
        spacing: 4,
        runSpacing: 4,
        children: [
          SecondaryBadge(
            child: Text('In sviluppo'),
          ),
          PrimaryBadge(
            child: Text('Flutter/Dart'),
          ),
        ],
      ),
      const Gap(8),
      const Text(
          'Gioca al FantaProf! Scegli i tuoi professori preferiti e sfida i tuoi compagni nel campionato di classe.')
          .muted(),
    ],
    onClick: () {
      context.go('/projects/fantaprof');
    },
  );
}
ClickableCard _myDiarioCard(BuildContext context) {
  return ClickableCard.column(
    flex: 1 ,
    children: [
      const Icon(
        LucideIcons.book_open_check,
        size: 32,
      ),
      const Gap(16),
      const Text('My.Diario').semiBold().large(),
      const Gap(8),
      const Wrap(
        spacing: 4,
        runSpacing: 4,
        children: [
          SecondaryBadge(
            child: Text('Pianificata'),
          ),
          PrimaryBadge(
            child: Text('Flutter/Dart'),
          ),
        ],
      ),
      const Gap(8),
      const Text(
          'Un\'app per gestire voti, compiti, task e scadenze, pensata per semplificare la vita degli studenti.')
          .muted(),
    ],
    onClick: () {
      context.go('/projects/mydiario');
    },
  );
}
ClickableCard _loginTerminalCard(BuildContext context) {
  return ClickableCard.column(
    flex: 1 ,
    children: [
      const Icon(
        LucideIcons.fingerprint,
        size: 32,
      ),
      const Gap(16),
      const Text('Login Terminal').semiBold().large(),
      const Gap(8),
      const Wrap(
        spacing: 4,
        runSpacing: 4,
        children: [
          DestructiveBadge(
            child: Text('Discontinuato/Completato'),
          ),
          PrimaryBadge(
            child: Text('Flutter/Dart'),
          ),

        ],
      ),
      const Gap(8),
      const Text(
          'Visita il mio profilo Instagram e segumi, anche se in realtà non posto nulla!')
          .muted(),
    ],
    onClick: () {
      context.go('/projects/login-terminal');
    },
  );
}
ClickableCard _materialComponentsCard(BuildContext context) {
  return ClickableCard.column(
    flex: 1 ,
    children: [
      const Icon(
        LucideIcons.component,
        size: 32,
      ),
      const Gap(16),
      const Text('CSS Material Components').semiBold().large(),
      const Gap(8),
      const Wrap(
        spacing: 4,
        runSpacing: 4,
        children: [
          DestructiveBadge(
            child: Text('Discontinuato/Terminato'),
          ),
          PrimaryBadge(
            child: Text('HTML/CSS'),
          ),
        ],
      ),
      const Gap(8),
      const Text(
          'Una piccolissima libreria CSS per componenti Google Material 3')
          .muted(),
    ],
    onClick: () {
      context.go('/projects/material-components');
    },
  );
}
ClickableCard _rdGamesCard(BuildContext context) {
  return ClickableCard.column(
    flex: 1 ,
    children: [
      const Icon(
        LucideIcons.joystick,
        size: 32,
      ),
      const Gap(16),
      const Text('Scratch Games').semiBold().large(),
      const Gap(8),
      const Wrap(
        spacing: 4,
        runSpacing: 4,
        children: [
          DestructiveBadge(
            child: Text('Discontinuato'),
          ),
          PrimaryBadge(
            child: Text('Scratch 3'),
          ),
        ],
      ),
      const Gap(8),
      const Text(
          'Una selezione dei giochi Scratch che ho realizzato da piccolo')
          .muted(),
    ],
    onClick: () {
      context.go('/projects/scratch-games');
    },
  );
}


