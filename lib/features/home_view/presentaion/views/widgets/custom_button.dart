import 'package:flutter/material.dart';
import 'package:storeapp/core/services/update_product.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    this.height,
    this.width, required this.functionClick,
  });
  final String title;
final Function functionClick;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 250,
        height: MediaQuery.of(context).size.height * 0.08,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          onPressed: () {
            functionClick();
          },
          child: Text(title, style: const TextStyle(fontSize: 20)),
        ),
      ),
    );
  }
}
