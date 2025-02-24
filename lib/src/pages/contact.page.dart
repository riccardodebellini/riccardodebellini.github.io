import 'package:portfolio/src/widgets/contact.widget.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import '../widgets/footer.widget.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: DefaultTextStyle.of(context).style.copyWith(
                      fontSize: Theme.of(context).typography.x6Large.fontSize),
                  children: [
                    const TextSpan(
                      text: 'Restiamo in ',
                    ),
                    TextSpan(
                        text: 'contatto!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary)),
                  ],
                ),
              ),
              const Gap(10),
              const Text(
                'Scopri tutti i miei canali social!',
                textAlign: TextAlign.center,
              ).lead(),
            ])
            .sized(height: MediaQuery.of(context).size.height / 2)
            .withPadding(horizontal: 20),
        const ContactWidget(),
        const FooterWidget()
      ],
    );
  }
}
