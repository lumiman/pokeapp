import 'package:flutter/material.dart';

class ItemTypeWidget extends StatelessWidget {
  String text;
  Color color;
  Color textColor;
  ItemTypeWidget({required this.text, required this.color,required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4.0, right: 12.0, top: 4.0),
      padding: const EdgeInsets.symmetric(
        horizontal: 14.0,
        vertical: 4.0,
      ),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              offset: const Offset(4, 4),
              blurRadius: 12.0,
            )
          ],
          borderRadius: BorderRadius.circular(10.0),
          color: color.withOpacity(0.27)),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
