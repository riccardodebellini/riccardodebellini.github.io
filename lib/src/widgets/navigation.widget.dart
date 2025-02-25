import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class LargeNavigation extends StatelessWidget {
  const LargeNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NavigationMenu(
        children: [
          NavigationMenuItem(
            onPressed: () {
              context.go('/');
            },
            child: const Text('Home'),
          ),
          NavigationMenuItem(
              onPressed: () {
                context.go('/whoami');
              },
              child: const Text('Chi sono')),
          NavigationMenuItem(
            content: NavigationMenuContentList(
              reverse: true,
              children: [
                NavigationMenuContent(
                  title: const Text('My.Bookshelf'),
                  content: const Text(
                      'Una app per gestire la tua libreria casalinga!'),
                  leading: IconButton.outline(
                    icon: const Icon(LucideIcons.library),
                    onPressed: () {},
                  ),
                  onPressed: () {
                    context.go('/projects/mybookshelf');
                  },
                ),
                NavigationMenuContent(
                  title: const Text('FantaProf'),
                  content: const Text(
                      '[In sviluppo] Scegli i tuoi professori e sfida i tuoi amici'),
                  leading: IconButton.outline(
                    icon: const Icon(LucideIcons.school),
                    onPressed: () {},
                  ),
                  onPressed: () {
                    context.go('/projects/myschool');
                  },
                ),
                NavigationMenuContent(
                  title: const Text('My.Diario'),
                  content: const Text(
                      '[Pianificata] Gestisci i tuoi compiti, ovunque tu sia'),
                  leading: IconButton.outline(
                    icon: const Icon(LucideIcons.book_open_check),
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
                  mouseCursor:
                      const WidgetStatePropertyAll(SystemMouseCursors.click),
                  child: Card(
                    borderRadius: Theme.of(context).borderRadiusMd,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          LucideIcons.folder_code,
                          size: 32,
                        ),
                        const Gap(16),
                        const Text('Tutti i progetti').semiBold().large(),
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
          NavigationMenuItem(
            onPressed: () {
              context.go('/news');
            },
            child: const Text('News'),
          ),
          NavigationMenuItem(
            onPressed: () {
              context.go('/contact');
            },
            child: const Text('Contatti'),
          ),
        ],
      ),
    );
  }
}

class SmallNavigation extends StatefulWidget {
  const SmallNavigation({super.key});

  @override
  State<SmallNavigation> createState() => _SmallNavigationState();
}

class _SmallNavigationState extends State<SmallNavigation> {
  List<TreeNode<String>> treeMenuItems = [
    TreeItem(
      data: 'Home',
    ),
    TreeItem(
      data: 'Chi sono',
    ),
    TreeItem(
      data: 'News',
    ),
    TreeItem(
      expanded: true,
      data: 'Progetti',
      children: [
        TreeItem(data: 'My.Bookshelf'),

        TreeItem(data: 'FantaProf')   ,     TreeItem(data: 'My.Diario'),
      ],
    ),
    TreeItem(
      data: 'Contatti',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IconButton.ghost(
      icon: const Icon(RadixIcons.hamburgerMenu),
      onPressed: () {
        openSheet(
            context: context,
            builder: (context) {
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
                          child: const Text('{RiccardoDebellini}')
                              .large()
                              .medium(),
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
                    TreeView(
                      expandIcon: true,
                      shrinkWrap: true,
                      recursiveSelection: false,
                      nodes: treeMenuItems,
                      branchLine: BranchLine.line,
                      builder: (context, node) {
                        return TreeItemView(
                          onPressed: () {
                            switch (node.data) {
                              case 'Home':
                                context.go('/');
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
                          onExpand: TreeView.defaultItemExpandHandler(
                              treeMenuItems, node, (value) {
                            setState(() {
                              treeMenuItems = value;
                            });
                          }),
                          child: Text(node.data),
                        );
                      },
                    ),
                    const Spacer(),
                    OutlineButton(
                      trailing: const Icon(RadixIcons.githubLogo),
                      onPressed: () {
                        const url =
                            'https://github.com/riccardodebellini/riccardodebellini.github.io';
                        launchUrl(Uri.parse(url));
                      },
                      child: const Text("Repo"),
                    )
                  ],
                ),
              );
            },
            position: OverlayPosition.right);
      },
    );
  }
}
