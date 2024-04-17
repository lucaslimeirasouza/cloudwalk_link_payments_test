import 'package:cloudwalk_link_payment_test/payment_link/presentation/pages/orchestrator_screen.dart';
import 'package:flutter/material.dart';
import 'di_payment_link.dart' as di;

void main() {
  di.setupDi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Link payment test',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: const OrchestratorScreen(),
    );
  }
}
