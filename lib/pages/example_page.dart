import 'package:flutter/material.dart';
import 'package:zkassa_sco/model/language_option.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPageState();
}

class _StartPageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          transform: GradientRotation(30 + 90),
          colors: [
            Color.fromARGB(0xff, 0x08, 0x60, 0xc4),
            Color.fromARGB(0xff, 0xdD5, 0x41, 0xc4),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                style: Theme.of(context).textTheme.displayLarge,
                "Language:",
              ),
              SizedBox.square(dimension: 20),
              Image.asset((args as LanguageOption).getFlagDir),
            ],
          ),
        ),
      ),
    );
  }
}
