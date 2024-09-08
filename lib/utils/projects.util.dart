import 'package:fluent_ui/fluent_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectData {
  final String title;
  final String desc;
  final String url;
  const ProjectData({
    required this.title,
    required this.desc,
    required this.url,
  });
}

class ProjectCard extends StatelessWidget {
  final ProjectData data;

  const ProjectCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    data.title,
                    style: FluentTheme.of(context).typography.subtitle,
                  ),
                  Text("\n${data.desc}"),
                ],
              ),
            ),
            IconButton(
                icon: const Icon(FluentIcons.o_d_link12),
                onPressed: () async {
                  final url = Uri.parse(
                      data.url);
                  await launchUrl(url);
                  displayInfoBar(context, builder: (context, close) {
                    return InfoBar(
                      title: Text('Aperto "${url.toString()}"'),
                      severity: InfoBarSeverity.success,
                    );
                  });
                })
          ],
        ));
  }
}
