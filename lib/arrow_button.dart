import 'carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

enum Direction { left, right }

class PageNavigators extends StatelessWidget {
  final CarouselController controller;
  final NavigatorOption option;
  PageNavigators(
      {this.controller,
      this.option = const NavigatorOption(
          iconColor: Colors.white, circleColor: Colors.white)});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ArrowButton(
          direction: Direction.left,
          option: option,
          onPressed: () {
            controller.previousPage();
          },
        ),
        ArrowButton(
          direction: Direction.right,
          option: option,
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
  final NavigatorOption option;

  ArrowButton(
      {@required this.direction,
      this.onPressed,
      this.option = const NavigatorOption(
          iconColor: Colors.white, circleColor: Colors.white)});
  @override
  _ArrowButtonState createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> {
  @override
  Widget build(BuildContext context) {
    double pictureSize = MediaQuery.of(context).size.width *
        (9 / 16); //Picture size is based on 16 : 9 ratio

    return Padding(
      padding: EdgeInsets.all(pictureSize / 5), //11
      child: Align(
        alignment: widget.direction == Direction.left
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: AspectRatio(
          aspectRatio: 1 / 4,
          child: GestureDetector(
            onTap: widget.onPressed,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.option.circleColor.withOpacity(0.3),
              ),
              child: Center(
                child: Icon(
                  widget.direction == Direction.left
                      ? Icons.arrow_back
                      : Icons.arrow_forward,
                  color: widget.option.iconColor,
                  size: widget.option.iconSize ?? pictureSize / 13, //22
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class NavigatorOption {
  final Color iconColor;
  final Color circleColor;
  final double iconSize;

  const NavigatorOption({
    this.iconColor = Colors.white,
    this.circleColor = Colors.white,
    this.iconSize,
  });
}
