import 'package:flutter/material.dart';
import 'package:zkassa_sco/model/language_option.dart';
import 'package:zkassa_sco/model/product.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  List<Product> scannedProducts = [];

  void start(LanguageOption? language) {
    Navigator.of(context).pushNamed("/example", arguments: language);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final flagHeight = 45.0;
    final flagWidth = flagHeight * 1.6;

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
        body: Column(
          children: [
            // Top bar
            Container(
              height: flagHeight + 20,
              padding: EdgeInsets.all(5),
              color: const Color.fromARGB(150, 237, 237, 237),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children:
                    LanguageOption.values
                        .map(
                          (name) => GestureDetector(
                            onTap: () => start(name),
                            child: Container(
                              width: flagWidth,
                              height: flagHeight,
                              margin: EdgeInsets.all(5),
                              child: Image.asset(
                                name.getFlagDir,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => start(LanguageOption.english),
              ),
            ),

            // Bottom bar
            GestureDetector(
              onTap: () => start(LanguageOption.english),
              child: Container(
                height: screenHeight * 0.2,
                color: const Color.fromARGB(100, 237, 237, 237),

                child: const Center(
                  child: Text(
                    "Tap the screen or scan something to start.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
