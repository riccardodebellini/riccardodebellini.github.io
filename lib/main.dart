import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/src/pages/404.page.dart';
import 'package:portfolio/src/pages/contact.page.dart';
import 'package:portfolio/src/pages/home.page.dart';
import 'package:portfolio/src/widgets/sizebased.widget.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadcnApp.router(
      title: 'Riccardo Debellini | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            (MediaQuery.of(context).platformBrightness == Brightness.light
                ? ColorSchemes.lightGreen()
                : ColorSchemes.darkGreen()),
        radius: 1,
        surfaceOpacity: 0.5,
        surfaceBlur: 20,
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  onException: (context, state, router) {
    router.go(
      '/404',
    );
  },
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return ShellNav(child: child);
      },
      routes: [
        // This screen is displayed on the ShellRoute's Navigator.
        GoRoute(
          path: '/',
          builder: (context, state) {
            return const HomePage();
          },
        ),
        // Displayed ShellRoute's Navigator.
        GoRoute(
          path: '/contact',
          builder: (BuildContext context, GoRouterState state) {
            return const ContactPage();
          },
        ),
        GoRoute(
          path: '/404',
          builder: (BuildContext context, GoRouterState state) {
            return const Page404();
          },
        )
      ],
    ),
  ],
);

void setPageTitle(String title, BuildContext context) {
  SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
    label: title,
    primaryColor:
        Theme.of(context).colorScheme.background.value, // This line is required
  ));
}

class ShellNav extends StatelessWidget {
  final Widget child;
  const ShellNav({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(headers: [
      AppBar(
          leading: [Text("Riccardo Debellini").bold()],
          child: SizeBased(context,
              ifSmall: null,
              ifLarge: Center(
                child: NavigationMenu(
                  children: [
                    NavigationItem(
                      onPressed: () {
                        context.go('/');
                      },
                      child: const Text('Home'),
                    ),
                    NavigationItem(
                        onPressed: () {
                          context.go('/whoami');
                        },
                        child: Text('Chi sono')),
                    NavigationItem(
                      content: NavigationContentList(
                        reverse: true,
                        children: [
                          NavigationContent(
                            title: const Text('My.Bookshelf'),
                            content: const Text(
                                'Una app per gestire la tua libreria casalinga!'),
                            leading: IconButton.outline(
                              icon: Icon(RadixIcons.bookmarkFilled),
                              onPressed: () {},
                            ),
                            onPressed: () {
                              context.go('/projects/mybookshelf');
                            },
                          ),
                          NavigationContent(
                            title: const Text('My.Transport'),
                            content: const Text(
                                'Scopri in realtime i tempi di attesa di ATM Milano'),
                            leading: IconButton.outline(
                              icon: Icon(RadixIcons.timer),
                              onPressed: () {},
                            ),
                            onPressed: () {
                              context.go('/projects/mytransport');
                            },
                          ),
                          NavigationContent(
                            title: const Text('My.School'),
                            content: const Text(
                                '[Futura] Gestisci i tuoi compiti, ovunque tu sia'),
                            leading: IconButton.outline(
                              icon: Icon(RadixIcons.check),
                              onPressed: () {},
                            ),
                            onPressed: () {
                              context.go('/projects/myschool');
                            },
                          ),
                          Clickable(
                            onPressed: () {
                              context.go('/projects');
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
                                  const Text('Tutti i progetti')
                                      .semiBold()
                                      .large(),
                                  const Gap(8),
                                  const Text(
                                          'Scopri tutti i progetti che ho realizzato nel corso degli anni')
                                      .muted(),
                                ],
                              ),
                            ).constrained(maxWidth: 192),
                          ),
                        ],
                      ),
                      onPressed: () {
                        context.go('/projects');
                      },
                      child: const Text('Progetti'),
                    ),
                    NavigationItem(
                      content: NavigationContentList(
                        reverse: true,
                        children: [
                          NavigationContent(
                            title: const Text('e-mail'),
                            leading: IconButton.outline(
                              icon: Icon(RadixIcons.envelopeClosed),
                              onPressed: () {},
                            ),
                            onPressed: () {},
                          ),
                          NavigationContent(
                            title: const Text('Instagram'),
                            leading: IconButton.outline(
                              icon: Icon(RadixIcons.instagramLogo),
                              onPressed: () {},
                            ),
                            onPressed: () {},
                          ),
                          NavigationContent(
                            title: const Text('GitHub'),
                            leading: IconButton.outline(
                              icon: Icon(RadixIcons.githubLogo),
                              onPressed: () {},
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      onPressed: () {
                        context.go('/contact');
                      },
                      child: const Text('Contatti'),
                    ),
                  ],
                ),
              )).get(),
          trailing: SizeBased(
            context,
            ifSmall: [IconButton.ghost(
              icon: Icon(RadixIcons.hamburgerMenu),
              onPressed: () {
                openSheet(
                    context: context,
                    builder: (context) {
                      return buildSheet(context);
                    },
                    position: OverlayPosition.right);
              },
            )],
            ifLarge: [NavigationMenu(
              children: [
                NavigationItem(
                  onPressed: () {
                    final url =
                        'https://github.com/riccardodebellini/riccardodebellini.github.io';
                    launchUrl(Uri.parse(url));
                  },
                  child: Icon(RadixIcons.githubLogo),
                )
              ],
            )],
          ).get())
    ], child: child);
  }
}

Widget buildSheet(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(24),
    constraints: const BoxConstraints(maxWidth: 500),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: const Text('Riccardo Debellini').large().medium(),
            ),
            IconButton.ghost(
              icon: const Icon(Icons.close),
              onPressed: () {
                closeSheet(context);
              },
            ),
          ],
        ),
        const Gap(8),
        MySidebar()
      ],
    ),
  );
}

@override
Widget build(BuildContext context) {
  return PrimaryButton(
    onPressed: () {
      openSheet(
        context: context,
        builder: (context) {
          return buildSheet(context);
        },
        position: OverlayPosition.right,
      );
    },
    child: const Text('Open Sheet'),
  );
}

class MySidebar extends StatefulWidget {
  MySidebar({super.key});

  @override
  State<MySidebar> createState() => _MySidebarState();
}

class _MySidebarState extends State<MySidebar> {
  List<TreeNode<String>> treeItems = [
    TreeItem(
      data: 'Home',
    ),
    TreeItem(
      data: 'Progetti',
      children: [
        TreeItem(
          data: 'My.Bookshelf',
        ),
        TreeItem(data: 'My.School'),
        TreeItem(data: 'My.Transport')
      ],
    ),
    TreeItem(
      data: 'Contatti',
    ),
    TreeItem(
      data: 'Repo',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return TreeView(
      expandIcon: true,
      shrinkWrap: true,
      recursiveSelection: false,
      nodes: treeItems,
      branchLine: BranchLine.line,
      builder: (context, node) {
        return TreeItemView(
          onPressed: () {
            switch (node.data) {
              case 'Home':
                context.go('/');
              case 'Repo':
                final url =
                    'https://github.com/riccardodebellini/riccardodebellini.github.io';
                launchUrl(Uri.parse(url));
              case 'Progetti':
                context.go('/projects');
              case 'My.Bookshelf':
                context.go('/projects/mybookshelf');
              case 'Contatti':
                context.go('/contact');

              default:
                context.go('/404');
            }
            closeSheet(context);
          },
          onExpand: TreeView.defaultItemExpandHandler(treeItems, node, (value) {
            setState(() {
              treeItems = value;
            });
          }),
          child: Text(node.data),
        );
      },
    );
  }
}
