import 'package:flutter/material.dart';

Widget backgroundImage() {
  return ShaderMask(
    shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.black, Colors.black12],
            begin: Alignment.bottomCenter,
            end: Alignment.center)
        .createShader(bounds),
    blendMode: BlendMode.darken,
    child: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/login_bg.png'),
            colorFilter: ColorFilter.mode(
              Colors.black54,
              BlendMode.darken,
            )),
      ),
    ),
  );
}
