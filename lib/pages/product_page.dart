import 'package:flutter/material.dart';
import 'package:zkassa_sco/components/language_select.dart';
import 'package:zkassa_sco/model/language_option.dart';

class ProductPage extends StatefulWidget {
  final LanguageOption lang;
  const ProductPage({super.key, required this.lang});

  @override
  State<StatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late LanguageOption lang;

  _ProductPageState();

  void changeLanguage(LanguageOption language) {
    setState(() {
      lang = language;
    });
  }

  @override
  void initState() {
    super.initState();
    lang = widget.lang;
  }

  @override
  Widget build(BuildContext context) {
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
          mainAxisSize: MainAxisSize.max,
          children: [
            // top bar
            Container(
              padding: EdgeInsets.all(5),
              color: const Color.fromARGB(150, 237, 237, 237),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  LanguageSelect(onTap: (name) => changeLanguage(name)),
                ],
              ),
            ),
            // body
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Scanned products view
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("LANGUAGE: ${lang.name}"),
                      FilledButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text("GO BACK"),
                      ),
                    ],
                  ),

                  // Overview, buttons (pay, fruit, etc.)
                  Container(
                    constraints: BoxConstraints(maxWidth: 400),
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(5),
                      child: Column(
                        children: [
                          Wrap(
                            runSpacing: 20,
                            spacing: 20,
                            children:
                                ["Fruit", "Vegetables", "Bread", "Drinks"]
                                    .map<Widget>(
                                      (item) => Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            15,
                                          ),
                                          color: Color(0x55FFFFFF),
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Image.network(
                                              "https://picsum.photos/160",
                                            ),
                                            Text(
                                              style:
                                                  Theme.of(
                                                    context,
                                                  ).textTheme.headlineMedium,
                                              item,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                          Align(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: double.infinity,
                              ),
                              child: FilledButton(
                                onPressed: null,
                                child: const Text("Pay"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
