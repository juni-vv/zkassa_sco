import 'package:flutter/material.dart';
import 'package:zkassa_sco/components/language_select.dart';
import 'package:zkassa_sco/components/unanimated_page_route.dart';
import 'package:zkassa_sco/model/language_option.dart';
import 'package:zkassa_sco/model/product.dart';
import 'package:zkassa_sco/pages/product_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  List<Product> scannedProducts = [];

  void start(LanguageOption? language) {
    Navigator.of(context).push(
      UnanimatedPageRoute(
        builder:
            (context) => ProductPage(lang: language ?? LanguageOption.english),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

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
              padding: EdgeInsets.all(5),
              color: const Color.fromARGB(150, 237, 237, 237),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [LanguageSelect(onTap: (name) => start(name))],
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
