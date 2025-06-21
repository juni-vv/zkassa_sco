import 'package:flutter/material.dart';
import 'package:zkassa_sco/components/language_select.dart';
import 'package:zkassa_sco/components/product_icon_button.dart';
import 'package:zkassa_sco/components/scanned_product_row.dart';
import 'package:zkassa_sco/model/language_option.dart';
import 'package:zkassa_sco/model/scanned_product.dart';

class ProductPage extends StatefulWidget {
  final LanguageOption lang;
  const ProductPage({super.key, required this.lang});

  @override
  State<StatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late LanguageOption lang;

  final List<ScannedProduct> _products = [];

  final ScrollController _scrollController = ScrollController();

  _ProductPageState();

  void changeLanguage(LanguageOption language) {
    setState(() {
      lang = language;
    });
  }

  void addProduct(String name) {
    setState(() {
      final index = _products.indexWhere((p) => p.name == name);
      if (index != -1) {
        _products[index] = _products[index].withQuantity(
          _products[index].quantity + 1,
        );
      } else {
        _products.add(ScannedProduct(cost: 0, name: name, quantity: 1));
      }
    });
  }

  void requestHelp() {}

  @override
  void initState() {
    super.initState();
    lang = widget.lang;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(10, 10, 5, 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(84, 255, 255, 255),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Scrollbar(
                                thumbVisibility: true,
                                controller: _scrollController,
                                interactive: true,
                                child: SingleChildScrollView(
                                  controller: _scrollController,
                                  scrollDirection: Axis.vertical,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(width: 12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 10),
                                            ..._products.map(
                                              (product) => ScannedProductRow(
                                                product,
                                                onAdd: () {
                                                  setState(
                                                    () => product.quantity++,
                                                  );
                                                },
                                                onRemove: () {
                                                  setState(() {
                                                    if (product.quantity == 1) {
                                                      _products.remove(product);
                                                    } else {
                                                      product.quantity--;
                                                    }
                                                  });
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: (MediaQuery.of(
                                                        context,
                                                      ).size.height -
                                                      65 -
                                                      (_products.length * 52.5))
                                                  .clamp(0, double.infinity),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Overview panel (buttons, total price, discounts)
                  Container(
                    constraints: BoxConstraints(maxWidth: 425),
                    child: Padding(
                      padding: EdgeInsetsGeometry.directional(
                        start: 5,
                        end: 10,
                        top: 5,
                        bottom: 10,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Align(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: double.infinity,
                              ),
                              child: SizedBox(
                                height: 100, // fixed height
                                child: FilledButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        WidgetStateProperty.resolveWith<Color>((
                                          Set<WidgetState> states,
                                        ) {
                                          if (states.contains(
                                            WidgetState.hovered,
                                          )) {
                                            return const Color.fromARGB(
                                              255,
                                              203,
                                              107,
                                              94,
                                            );
                                          }
                                          return const Color.fromARGB(
                                            255,
                                            203,
                                            107,
                                            94,
                                          );
                                        }),
                                    foregroundColor: WidgetStateProperty.all(
                                      Colors.white,
                                    ),
                                    overlayColor: WidgetStateProperty.all(
                                      Colors.transparent,
                                    ),
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
                                      (item) => GestureDetector(
                                        onTap:
                                            () => addProduct(
                                              item,
                                            ), // <- this triggers adding the product
                                        child: Container(
                                          width: 200,
                                          height: 200,
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                              84,
                                              255,
                                              255,
                                              255,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          padding: EdgeInsets.all(10),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                width: 150,
                                                height: 150,
                                                child: Image.network(
                                                  "https://picsum.photos/150",
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Text(
                                                item,
                                                style: TextStyle(
                                                  fontSize: 21,
                                                  color: Colors.white,
                                                  fontFamily: 'Raleway',
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList(),
                          ),
                          Expanded(child: Column(children: [
                              
                            ],)),
                          Align(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: double.infinity,
                              ),
                              child: SizedBox(
                                height: 200, // fixed height
                                child: FilledButton(
                                  onPressed: null,
                                  child: const Text("Pay"),
                                ),
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
