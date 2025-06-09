import 'package:flutter/material.dart';
import 'package:zkassa_sco/model/language_option.dart';

class LanguageSelect extends StatelessWidget {
  final void Function(LanguageOption)? onTap;

  const LanguageSelect({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final flagHeight = 45.0;
    final flagWidth = flagHeight * 1.6;
    return Row(
      children:
          LanguageOption.values
              .map(
                (name) => GestureDetector(
                  onTap: onTap == null ? null : (() => onTap!(name)),
                  child: Container(
                    width: flagWidth,
                    height: flagHeight,
                    margin: EdgeInsets.all(5),
                    child: Image.asset(name.getFlagDir, fit: BoxFit.fill),
                  ),
                ),
              )
              .toList(),
    );
  }
}
