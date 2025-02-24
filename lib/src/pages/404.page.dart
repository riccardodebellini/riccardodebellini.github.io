import 'package:go_router/go_router.dart';
import 'package:portfolio/src/widgets/footer.widget.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Page404 extends StatelessWidget {
  const Page404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              '404',
              textAlign: TextAlign.center,
              style: DefaultTextStyle.of(context).style.copyWith(
                  fontSize: Theme.of(context).typography.x6Large.fontSize),
            ),
            const Gap(10),
            const Text(
              'Pagina non trovata\nLa pagina cercata potrebbe non esistere o non essere ancora stata creata',
              textAlign: TextAlign.center,
            ).lead(),
            const Gap(10),
            PrimaryButton(
              child: const Text("Torna a home"),
              onPressed: () {
                context.go('/');
              },
            ),
            const Gap(10),
            LinkButton(
              child: const Text("Segnala un problema"),
              onPressed: () {
                const url =
                    'https://github.com/riccardodebellini/riccardodebellini.github.io/issues/new';
                launchUrl(Uri.parse(url));
              },
            ),
            const Spacer(),
            const FooterWidget()
          ]).withPadding(horizontal: 20),
    );
  }
}
