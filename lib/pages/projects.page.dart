import 'package:fluent_ui/fluent_ui.dart';
import 'package:portfolio/utils/projects.util.dart';


class ProjectsPage extends StatefulWidget {


  const ProjectsPage({super.key,});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  final List projects = [const ProjectData(title: "MyBookshelf - Una app per gestire tutti i tuoi libri", desc: "Una app sviluppata con Flutter e Supabase dove salvare tutti i tuoi libri, le loro posizioni e molto altro!", url: "https://github.com/riccardodebellini/MyBookshelf"), const ProjectData(title: "📲 MyAppstore", desc: "Un Programma sviluppato per gestire tutte le app e i servizi che ho realizzato e realizzerò", url: "https://github.com/riccardodebellini/AppStore"), const ProjectData(title: "💻 PDS", desc: "Un sito sviluppato per un gioco, per simulare un terminale da sbloccare, con password e username, messaggio di errore e account aministratore", url: "https://riccardodebellini.github.io/pds/"), const ProjectData(title: "⚠️ [DEPRECATO!] - Material Components (CSS + HTML)", desc: "I componenti del Material You, per il tuo sito Html/CSS", url: "https://github.com/Riccardo-Debellini/material-components"), const ProjectData(title: "🕹️ RD Games", desc: "Una selezione dei giochi Scratch che ho realizzato da piccolo", url: "https://sites.google.com/view/rdgame")];

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage.scrollable(
      header: const PageHeader(
        title: Text("Progetti"),
      ),
      children: [

        const Text(
            "Qui sotto troverai una selezione dei miei progetti, realizzati nel corso degli anni: presentazioni, giochi, applicazioni e molto altro!\n"),
        
        ListView.builder(physics: const NeverScrollableScrollPhysics(), shrinkWrap: true, itemBuilder: (context, index) {return ProjectCard(data: projects[index]);}, itemCount: projects.length,),
        Card(child: Text("Sito protetto da Copyright - (C) 2024 Riccardo Debellini", style: FluentTheme.of(context).typography.caption,))
      ]
    );
  }
}
