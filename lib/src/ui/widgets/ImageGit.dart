import 'package:flutter/material.dart';

class ImageGit extends StatelessWidget {

  final String photoUrl;
  final double size;
  const ImageGit(this.photoUrl, this.size);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.transparent,
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(
                  photoUrl)
          )
      ),
    );
  }
}

