import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/home_screen.dart';
import 'stats_store.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final store = await StatsStore.load();
  runApp(AkademikSprintApp(store: store));
}

class AkademikSprintApp extends StatelessWidget {
  const AkademikSprintApp({super.key, required this.store});
  final StatsStore store;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Akademik Sprint',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      themeMode: ThemeMode.light,
      home: HomeScreen(store: store),
    );
  }
}
