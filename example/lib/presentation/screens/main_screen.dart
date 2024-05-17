import 'package:example/config/foundations/custom_typo.dart';
import 'package:example/presentation/widgets/landing_widget.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Package Fake Api Example',
          style: TextStyle(
              fontFamily: CustomTypo.poppinsFontFamily,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: const SafeArea(child: LandingView()),
    );
  }
}
