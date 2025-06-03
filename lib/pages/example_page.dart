import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPageState();
}

class _StartPageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(appBar: AppBar(), body: Text("Language is: $args"));
  }
}
