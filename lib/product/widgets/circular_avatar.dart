
import 'package:flutter/material.dart';

class CustomCircularAvatar extends StatelessWidget {
  const CustomCircularAvatar({Key? key, this.size, this.image}) : super(key: key);
  final double? size;
  final String? image;
  final double circularAvatarSize = 40;
  final String randomImageGenerator = "https://picsum.photos/200";
  @override
  Widget build(BuildContext context) {
    return Container(
      height: size ?? circularAvatarSize,
      width: size ?? circularAvatarSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((size ?? circularAvatarSize) / 2),
        image: DecorationImage(
            image: NetworkImage(image ?? randomImageGenerator)),
      ),
    );
  }
}

