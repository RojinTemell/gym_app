import 'package:flutter/material.dart';

class ImageShadowComponent extends StatelessWidget {
  const ImageShadowComponent({Key? key, required this.widget})
      : super(key: key);
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color.fromARGB(165, 0, 0, 0), Color.fromARGB(45, 0, 0, 0)],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.darken,
      child: widget,
    );
  }
}
