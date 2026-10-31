import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/home_screen.dart';
import 'stats_store.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  final store = await StatsStore.load();
  runApp(DilSprintApp(store: store));
}

class DilSprintApp extends StatelessWidget {
  const DilSprintApp({super.key, required this.store});
  final StatsStore store;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DilSprint',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      themeMode: ThemeMode.light,
      home: HomeScreen(store: store),
    );
  }
}
