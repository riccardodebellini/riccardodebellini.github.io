
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/src/pages/404.page.dart';
import 'package:portfolio/src/pages/contact.page.dart';
import 'package:portfolio/src/pages/home.page.dart';
import 'package:portfolio/src/widgets/navigation.widget.dart';
import 'package:portfolio/src/widgets/sizebased.widget.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

void main() {
  runApp(const Website());
}

class Website extends StatelessWidget {
  const Website({super.key});

  @override
  Widget build(BuildContext context) {
    return ShadcnApp.router(
      title: 'Riccardo Debellini | Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            (MediaQuery.of(context).platformBrightness == Brightness.light
                ? ColorSchemes.lightBlue()
                : ColorSchemes.darkBlue()),
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
  ));
}

class ShellNav extends StatelessWidget {
  final Widget child;
  const ShellNav({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(headers: [
      AppBar(
          leading: [const Text("Riccardo Debellini").bold()],
          child: SizeBased(context, ifSmall: null, ifLarge: const LargeNavigation())
              .get(),
          trailing: SizeBased(
            context,
            ifSmall: [const SmallNavigation()],
            ifLarge: [
              NavigationMenu(
                children: [
                  NavigationItem(
                    onPressed: () {
                      const url =
                          'https://github.com/riccardodebellini/riccardodebellini.github.io';
                      launchUrl(Uri.parse(url));
                    },
                    child: const Icon(RadixIcons.githubLogo),
                  )
                ],
              )
            ],
          ).get())
    ], child: child);
  }
}
