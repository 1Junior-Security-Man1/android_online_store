import 'package:flutter/material.dart';
class Avatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          //scale: 100,
          image: Image.network(
              'https://www.zastavki.com/pictures/1920x1200/2011/Animals_Cats_Cat_in_the_glasses_032992_.jpg')
              .image,
          fit: BoxFit.cover,
        ),
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}
