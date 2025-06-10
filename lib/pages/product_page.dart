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

  void requestHelp() {}

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
          colors: [Color.fromARGB(0xff, 0x08, 0x60, 0xc4), Color.fromARGB(0xff, 0xdD5, 0x41, 0xc4)],
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
                children: [LanguageSelect(onTap: (name) => changeLanguage(name))],
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
                      FilledButton(onPressed: () => Navigator.of(context).pop(), child: Text("GO BACK")),
                    ],
                  ),

                  // Overview panel (buttons, total price, discounts)
                  Container(
                    constraints: BoxConstraints(maxWidth: 425),
                    child: Padding(
                      padding: EdgeInsetsGeometry.directional(start: 5, end: 10, top: 5, bottom: 10),
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Align(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(minWidth: double.infinity),
                              child: SizedBox(
                                height: 100, // fixed height
                                child: FilledButton(
                                  style: FilledButton.styleFrom(
                                    backgroundColor: Color.fromARGB(133, 255, 136, 0),
                                    foregroundColor: Colors.white,
                                  ),
                                  onPressed: () => requestHelp(),
                                  child: const Text(
                                    style: TextStyle(
                                      fontSize: 21,
                                      color: Colors.white,
                                      fontFamily: 'Raleway',
                                      fontWeight: FontWeight.normal,
                                    ),
                                    "Request help",
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children:
                                ["Fruit", "Vegetables", "Bread", "Drinks"]
                                    .map<Widget>(
                                      (item) => Container(
                                        width: 200,
                                        height: 200,

                                        decoration: BoxDecoration(
                                          color: Color(0x55FFFFFF),
                                          borderRadius: BorderRadius.circular(10),
                                        ),

                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              height: 150,
                                              child: Image.network("https://picsum.photos/150", fit: BoxFit.cover),
                                            ),
                                            Text(
                                              style: TextStyle(
                                                fontSize: 21,
                                                color: Colors.white,
                                                fontFamily: 'Raleway',
                                                fontWeight: FontWeight.normal,
                                              ),
                                              item,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                          Expanded(child: Column(children: [
                              
                            ],)),
                          Align(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(minWidth: double.infinity),
                              child: SizedBox(
                                height: 200, // fixed height
                                child: FilledButton(onPressed: null, child: const Text("Pay")),
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
