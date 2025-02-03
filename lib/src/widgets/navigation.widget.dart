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
              child: const Text('Chi sono')),
          NavigationItem(
            content: NavigationContentList(
              reverse: true,
              children: [
                NavigationContent(
                  title: const Text('My.Bookshelf'),
                  content: const Text(
                      'Una app per gestire la tua libreria casalinga!'),
                  leading: IconButton.outline(
                    icon: const Icon(RadixIcons.bookmarkFilled),
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
                    icon: const Icon(RadixIcons.timer),
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
                    icon: const Icon(RadixIcons.check),
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
                          RadixIcons.code,
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
          NavigationItem(
            content: NavigationContentList(
              reverse: true,
              children: [
                NavigationContent(
                  title: const Text('e-mail'),
                  leading: IconButton.outline(
                    icon: const Icon(RadixIcons.envelopeClosed),
                    onPressed: () {},
                  ),
                  onPressed: () {},
                ),
                NavigationContent(
                  title: const Text('Instagram'),
                  leading: IconButton.outline(
                    icon: const Icon(RadixIcons.instagramLogo),
                    onPressed: () {},
                  ),
                  onPressed: () {},
                ),
                NavigationContent(
                  title: const Text('GitHub'),
                  leading: IconButton.outline(
                    icon: const Icon(RadixIcons.githubLogo),
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
    );
  }
}

class SmallNavigation extends StatefulWidget {
  const SmallNavigation({super.key});

  @override
  State<SmallNavigation> createState() => _SmallNavigationState();
}

class _SmallNavigationState extends State<SmallNavigation> {
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
                          child:
                              const Text('Riccardo Debellini').large().medium(),
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
                      nodes: treeItems,
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
                              treeItems, node, (value) {
                            setState(() {
                              treeItems = value;
                            });
                          }),
                          child: Text(node.data),
                        );
                      },
                    ),
                    Spacer(),
                    OutlineButton(child: Text("Repo"), trailing: Icon(RadixIcons.githubLogo), onPressed: () {
                      const url =
                          'https://github.com/riccardodebellini/riccardodebellini.github.io';
                      launchUrl(Uri.parse(url));
                    }, )
                  ],
                ),
              );
            },
            position: OverlayPosition.right);
      },
    );
  }
}
