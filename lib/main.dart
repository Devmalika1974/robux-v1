

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dreamflow/screens/username_screen.dart';
import 'package:dreamflow/screens/robux_selection_screen.dart';
import 'package:dreamflow/screens/generator_screen.dart';
import 'package:dreamflow/screens/offer_screen.dart';
import 'package:dreamflow/utils/navigation_service.dart';
import 'theme.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Robux Generator',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      navigatorKey: NavigationService.navigatorKey,
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const UsernameScreen(),
        '/username': (context) => const UsernameScreen(),
        '/select_robux': (context) => const RobuxSelectionScreen(),
        '/generator': (context) => const GeneratorScreen(),
        '/offer': (context) => const OfferScreen(),
      },
      home: const UsernameScreen(),
    );
  }
}