import 'package:fluent_ui/fluent_ui.dart';
// ignore: unused_import
import 'package:portfolio/utils/navigation.util.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final Function quickNavigation;

  const HomePage({super.key, required this.quickNavigation});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(
        title: Text("Home Page"),
      ),
      children: [
        Text(
          "Chi sono?",
          style: FluentTheme.of(context).typography.subtitle,
        ),
        const Text(
            '\nCiao a tutti, sono Riccardo Debellini, studente al secondo anno del Liceo Bottoni di Milano.\n\nMi considero un ragazzo attivo e con la testa sulle spalle. La fisica mi appassiona, anche se con la matematica ho un rapporto di amore-odio (prof Montoli, mi perdoni!). Il mio pensiero è più logico che matematico, per questo l\'informatica mi attrae in tutte le sue forme. È proprio questa passione che mi ha portato a entrare nel gruppo BinaryBears\n\nNon sono un grande fan dell\'attività fisica, anche se pratico scherma. Ultimamente mi sono interessato al mondo dell\'intelligenza artificiale, un campo che mi incuriosisce e che avrà sicuramente un ruolo importante nel mio futuro, qualsiasi esso sia.\n\nNella vita ho tanti sogni, sono un po\' come un bambino in un negozio di caramelle! Mi piacerebbe diventare sviluppatore di app o giochi, pubblico ministero, medico, agente della sicurezza nazionale... le possibilità sono infinite!\n\nSono sempre pronto a mettermi in gioco e ad affrontare nuove sfide. Il mio motto è "carpe diem": cogliere l\'attimo e vivere al massimo ogni momento.\n'),
        FilledButton(
            child: const Text('Visita il sito del gruppo "Binary Bears"'),
            onPressed: () async {
              final url = Uri.parse('https://binarybears.it');
              await launchUrl(url);
              displayInfoBar(context, builder: (context, close) {
                return const InfoBar(
                  title: Text('Aperto "https://binarybears.it"'),
                  severity: InfoBarSeverity.success,
                );
              });
            }),
        const Text("\n"),
        Card(
            child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Progetti",
                    style: FluentTheme.of(context).typography.subtitle,
                  ),
                  const Text(
                      "\nScopri tutti i miei progetti e le mie creazioni, da quelli più seri a quelli più infantili, quasi tutto Open Source!"),
                ],
              ),
            ),
            IconButton(
                icon: const Icon(FluentIcons.chevron_right),
                onPressed: () {
                  widget.quickNavigation(1);
                })
          ],
        )),Card(
            child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contatti",
                    style: FluentTheme.of(context).typography.subtitle,
                  ),
                  const Text(
                      "\nContattami per avere maggiori informazioni su i miei progetti, le mie idee o per conoscermi"),
                ],
              ),
            ),
            IconButton(
                icon: const Icon(FluentIcons.chevron_right),
                onPressed: () {
                  widget.quickNavigation(2);
                })
          ],
        )),
      Card(child: Text("Sito protetto da Copyright - (C) 2024 Riccardo Debellini", style: FluentTheme.of(context).typography.caption,))
      ],
    );
  }
}
