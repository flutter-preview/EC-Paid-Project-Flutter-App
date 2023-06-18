import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class ProductImage extends StatefulWidget {
  final String image;

  const ProductImage({Key? key, required this.image}) : super(key: key);

  @override
  _ProductImageState createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  double _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (ScaleStartDetails details) {
        setState(() {
          _scale = 1.0;
        });
      },
      onScaleUpdate: (ScaleUpdateDetails details) {
        setState(() {
          _scale = details.scale;
        });
      },
      onScaleEnd: (ScaleEndDetails details) {
        setState(() {
          _scale = 1.0;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(41, 64, 195, 255),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 5,
              blurRadius: 5,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.35,
        padding: const EdgeInsets.only(bottom: 30),
        width: double.infinity,
        child: ClipRect(
          child: Transform.scale(
            scale: _scale,
            child: Image.network(
              widget.image,
              colorBlendMode: BlendMode.softLight,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
