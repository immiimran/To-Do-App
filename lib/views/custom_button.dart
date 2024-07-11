import 'package:flutter/material.dart';
import 'package:toto_crud/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool? isBorderType;
  final void Function()? onTap;

  const CustomButton(
      {super.key, required this.title, this.isBorderType, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 52,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: isBorderType == true ? null : Appcolors.primaryColor,
            borderRadius: BorderRadius.circular(12),
            border: isBorderType == true
                ? Border.all(
                    color: Appcolors.primaryColor,
                    width: 2,
                  )
                : null),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
