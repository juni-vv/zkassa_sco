import 'package:flutter/material.dart';
import 'package:zkassa_sco/components/product_icon_button.dart';
import 'package:zkassa_sco/model/scanned_product.dart';

class ScannedProductRow extends StatelessWidget {
  final ScannedProduct product;
  final Function? onAdd;
  final Function? onRemove;

  const ScannedProductRow(this.product, {this.onAdd, this.onRemove, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProductQuantityButton(true, product.quantity, onTap: onAdd),
              SizedBox(width: 10),
              SizedBox(
                width: 26, // minimum width that fits all numbers 0-99
                child: Text(
                  product.quantity.toString(),
                  style: TextTheme.of(context).headlineSmall,
                ),
              ),
              SizedBox(width: 10),
              ProductQuantityButton(false, product.quantity, onTap: onRemove),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  product.name,
                  style: TextTheme.of(context).headlineSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Divider(
            thickness: 0.5,
            color: Color.fromARGB(84, 255, 255, 255),
            height: 1,
          ),
        ),
      ],
    );
  }
}
