import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../theme/pallete.dart';

class TextSwipe extends StatelessWidget {
  const TextSwipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText('You can use',
                textStyle: const TextStyle(fontSize: 16),
                colors: Pallete.colorizeColors)
          ],
          isRepeatingAnimation: true,
        ),
        const Icon(
          Icons.swipe_left,
          color: Pallete.amberColor,
        ),
        AnimatedTextKit(
          animatedTexts: [
            ColorizeAnimatedText('to delete item',
                textStyle: const TextStyle(fontSize: 16),
                colors: Pallete.colorizeColors)
          ],
          isRepeatingAnimation: true,
        ),
      ],
    );
  }
}