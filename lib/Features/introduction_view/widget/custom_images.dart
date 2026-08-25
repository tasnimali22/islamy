import 'package:flutter/material.dart';
import 'package:islamyapp/Features/introduction_view/widget/custom_stack.dart';
import 'package:islamyapp/core/utils/styles.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.images,
    required this.title,
    required this.description,
  });
  final String images;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final double sHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const CustomStack(),
          const Spacer(flex: 1),
          Image.asset(images, fit: BoxFit.contain, height: sHeight * 0.40),
          const Spacer(flex: 1),
          Text(title, style: Styles.textStyle20, textAlign: TextAlign.center),
          //"Welcome To Islami"
          const Spacer(flex: 1),
          Center(
            child: Text(
              description,
              style: Styles.textStyle20,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
