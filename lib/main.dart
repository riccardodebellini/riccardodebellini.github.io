
import 'package:fluent_ui/fluent_ui.dart';
import 'package:portfolio/utils/navigation.util.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key, });

  @override
  Widget build(BuildContext context) {
    return FluentApp(
      debugShowCheckedModeBanner: false,
      theme: FluentThemeData(
        accentColor: Colors.teal,
        brightness: MediaQuery.of(context).platformBrightness
      ),
      title: "Riccardo Debellini - portfolio",
      home: const NavigationSystem(),
    );
  }
}



