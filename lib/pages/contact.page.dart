import 'package:fluent_ui/fluent_ui.dart';
import 'package:portfolio/utils/projects.util.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({
    super.key,
  });

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final List contacts = [
    const ProjectData(
        title: "e-mail",
        desc: "inviami un'email a 'riccardo.debellini@gmail.com",
        url: "mailto:riccardo.debellini@gmail.com"),
    const ProjectData(
        title: "Instagram",
        desc: "Scopri la mia pagina instagram, dove non posto nulla",
        url: "https://instagram.com/riccardodebellini"),
    const ProjectData(
        title: "GitHub",
        desc:
            "Scopri il mio profilo GitHub, dove puoi trovare tutto il codice che produco",
        url: "https://github.com/riccardodebellini/")
  ];
  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
        header: const PageHeader(
          title: Text("Contattami"),
        ),
        children: [
          const Text(
              "Sei interessato a contattarmi, per pormi una domanda, per conoscermi o per un'aiuto?\n\nNon esitare a contattarmi!\n\nQui sotto trovi i miei link, contatti e recapiti\n"),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProjectCard(data: contacts[index]);
            },
            itemCount: contacts.length,
          ),
          Card(
              child: Text(
            "Sito protetto da Copyright - (C) 2024 Riccardo Debellini",
            style: FluentTheme.of(context).typography.caption,
          ))
        ]);
  }
}
