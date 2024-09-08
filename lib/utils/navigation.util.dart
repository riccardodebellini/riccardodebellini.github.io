import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:portfolio/pages/contact.page.dart';
import 'package:portfolio/pages/projects.page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../pages/home.page.dart';

class NavigationSystem extends StatefulWidget {
  const NavigationSystem({super.key});

  @override
  State<NavigationSystem> createState() => NavigationSystemState();
}


class NavigationSystemState extends State<NavigationSystem> {
  int currentPage = 0;


  void setPage(int page) {
    setState(() {
      currentPage = page;
    });
  }
  @override
  void initState () {
    super.initState();
    setState(() {
      currentPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    final colors =
        WindowButtonColors(iconNormal: FluentTheme.of(context).iconTheme.color);
    final closeApp = WindowButtonColors(
        iconNormal: FluentTheme.of(context).iconTheme.color,
        mouseOver: Colors.errorPrimaryColor);

    return NavigationView(
      appBar: NavigationAppBar(
        automaticallyImplyLeading: false,
        title: const Text("Riccardo Debellini - Portfolio"),
        actions: (!kIsWeb && Platform.isWindows)
            ? Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                    Expanded(
                      child: MoveWindow(),
                    ),
                    MinimizeWindowButton(
                      colors: colors,
                    ),
                    MaximizeWindowButton(
                      colors: colors,
                    ),
                    CloseWindowButton(
                      colors: closeApp,
                    )
                  ])
            : null,
      ),
      pane: NavigationPane(
          items: [
            PaneItem(
              key: const ValueKey('/'),
              icon: const Icon(FluentIcons.home),
              body: HomePage(quickNavigation: setPage,),
              title: const Text("Home"),
            ),
            PaneItemSeparator(),
            PaneItem(
              key: const ValueKey('/progetti'),
              icon: const Icon(FluentIcons.project_collection),
              body: const ProjectsPage(),
              title: const Text("Progetti"),
            ),
            PaneItem(
                key: const ValueKey('/contattami'),
                icon: const Icon(FluentIcons.contact),
                body: const ContactsPage(),
                title: const Text("Contattami")),
            PaneItem(
                icon: const Icon(FluentIcons.info),
                body: const Text("Info sul sito"),
                title: const Text("Info sul sito"),
            enabled: false)
          ],
          footerItems: [
            PaneItemSeparator(),
            PaneItemAction(
                icon: const Icon(FluentIcons.code),
                title: const Text("Binary Bears"),
                onTap: () async {
                  final url = Uri.parse('https://binarybears.it');
                  await launchUrl(url);
                  displayInfoBar(context, builder: (context, close) {
                    return InfoBar(
                      title: Text('Aperto "${url.toString()}"'),
                      severity: InfoBarSeverity.success,
                    );
                  });
                }),
            PaneItemAction(
                icon: const Icon(FluentIcons.open_source),
                title: const Text("Source code"),
                onTap: () async {
                  final url = Uri.parse(
                      'https://github.com/riccardodebellini/riccardodebellini.github.io');
                  await launchUrl(url);
                  displayInfoBar(context, builder: (context, close) {
                    return InfoBar(
                      title: Text('Aperto "${url.toString()}"'),
                      severity: InfoBarSeverity.success,
                    );
                  });
                }),

            PaneItemAction(
                icon: const Icon(FluentIcons.open_source),
                title: const Text("Old version, HTML based"),
                onTap: () async {
                  final url = Uri.parse(
                      'https://riccardodebellini.github.io/html-portfolio');
                  await launchUrl(url);
                  displayInfoBar(context, builder: (context, close) {
                    return InfoBar(
                      title: Text('Aperto "${url.toString()}"'),
                      severity: InfoBarSeverity.success,
                    );
                  });
                })
          ],
          selected: currentPage,
          onChanged: setPage),
    );
  }
}
