import 'package:flutter/material.dart';

class ProductQuantityButton extends StatelessWidget {
  final bool isAdd;
  final int quantity;
  final Function? onTap;
  const ProductQuantityButton(
    this.isAdd,
    this.quantity, {
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap == null ? null : () => onTap!(),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Color.fromARGB(84, 255, 255, 255),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            isAdd
                ? Icons.add
                : quantity <= 1
                ? Icons.delete_outline
                : Icons.remove,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
