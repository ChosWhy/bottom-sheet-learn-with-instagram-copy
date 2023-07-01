
import 'package:flutter/material.dart';

class CustomCircularAvatar extends StatelessWidget {
  const CustomCircularAvatar({Key? key, this.size, this.image}) : super(key: key);
  final double? size;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? 40,
      width: size ?? 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((size ?? 40) / 2),
        image: DecorationImage(
            image: NetworkImage(image ?? "https://picsum.photos/200")),
      ),
    );;
  }
}
