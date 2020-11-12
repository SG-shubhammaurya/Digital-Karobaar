
import 'package:flutter/material.dart';

class ImageNotFound extends StatelessWidget {
  const ImageNotFound({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://azadchaiwala.pk/getImage?i=&t=course',
    );
  }
}