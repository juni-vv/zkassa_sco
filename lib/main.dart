import 'package:flutter/material.dart';
import 'package:zkassa_sco/pages/example_page.dart';
import 'package:zkassa_sco/pages/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            shape: WidgetStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.deepPurple,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const StartPage(),
      routes: {
        "/start": (_) => const StartPage(),
        "/example": (_) => const ExamplePage(),
      },
    );
  }
}
