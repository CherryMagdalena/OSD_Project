import 'package:carousel_slider_test/carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

enum Direction { left, right }

class PageNavigators extends StatelessWidget {
  final CarouselController controller;
  PageNavigators({this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ArrowButton(
          direction: Direction.left,
          onPressed: () {
            controller.previousPage();
          },
        ),
        ArrowButton(
          direction: Direction.right,
          onPressed: () {
            controller.nextPage();
          },
        )
      ],
    );
  }
}

class ArrowButton extends StatefulWidget {
  final Function onPressed;
  final Direction direction;
  ArrowButton({@required this.direction, this.onPressed});
  @override
  _ArrowButtonState createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> {
  @override
  Widget build(BuildContext context) {
    double pictureSize = MediaQuery.of(context).size.width *
        (9 / 16); //Picture size is based on 16 : 9 ratio

    return Padding(
      padding: EdgeInsets.all(pictureSize / 5),
      child: Align(
        alignment: widget.direction == Direction.left
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: AspectRatio(
          aspectRatio: 1 / 5,
          child: GestureDetector(
            onTap: widget.onPressed,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFFFFF).withOpacity(0.3),
              ),
              child: Center(
                child: Icon(
                  widget.direction == Direction.left
                      ? Icons.arrow_back
                      : Icons.arrow_forward,
                  color: Colors.white,
                  size: pictureSize / 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
