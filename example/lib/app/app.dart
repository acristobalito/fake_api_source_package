import 'package:example/config/foundations/theme/app_theme.dart';
import 'package:example/domain/providers/main_screen_provider.dart';
import 'package:example/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainScreenProvider(),
      child: MaterialApp(
          title: 'Example FakeApi package',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const MainScreen()),
    );
  }
}
