import 'package:flutter/material.dart';

class CustomButtonItem extends StatelessWidget {
  const CustomButtonItem({
    super.key, required this.title, this.borderRadius, this.isSelected =false, this.onSelected, this.buttonWidth,
  });
  final String title;
  final BorderRadiusGeometry? borderRadius;
  final bool isSelected;
  final Function(String value)? onSelected;
  final double? buttonWidth;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      
      onTap: () {
        onSelected?.call(title);
      },
      child: Container(
        width: buttonWidth,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color:isSelected? const Color(0xff447a46):const Color(0xfff8f9fa),
          
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white :  Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}