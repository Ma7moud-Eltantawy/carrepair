import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class HomeCardItem extends StatelessWidget {
  final String imagePath;
  final String label;
  final void Function()? onTap;

  const HomeCardItem({
    super.key,
    required this.imagePath,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: FadeIn(
        child: Container(
          height: 115,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: AssetImage(
                imagePath,
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.6), BlendMode.darken),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
