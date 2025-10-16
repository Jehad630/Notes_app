import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtonWidget extends StatelessWidget {
  CustomButtonWidget({
    super.key,
    required this.color,
    required this.text,
    this.onTap,
    this.isLoading = false,
  });

  final Color color;
  final String text;
  VoidCallback? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator(color: Colors.black)
                : Text(
                    text,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
    );
  }
}
