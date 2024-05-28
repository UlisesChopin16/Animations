import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedContainerComponent extends StatefulWidget {
  final Color color;
  final String text;
  final bool enter;
  final void Function()? onTap;
  const AnimatedContainerComponent({
    super.key,
    required this.color,
    required this.text,
    this.enter = false,
    this.onTap,
  });

  @override
  State<AnimatedContainerComponent> createState() =>
      _AnimatedContainerComponentState();
}

class _AnimatedContainerComponentState extends State<AnimatedContainerComponent>
    with TickerProviderStateMixin {
  late AnimationController controller = AnimationController(
    duration: duration,
    vsync: this,
  );

  late final animation = Tween(
    begin: 0.0,
    end: 1.0,
  ).animate(controller);

  static const Duration duration = Duration(milliseconds: 500);

  double width = 150;
  double height = 150;

  bool enter = false;

  @override
  void initState() {
    super.initState();
    // controller.addListener(() {
    //   setState(() {
    //     controller.value;
    //   });
    // });
  }

  double get value => controller.value * 2 * pi;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) {
          setState(() {
            controller.forward();
            width = 300;
            enter = true;
          });
        },
        onExit: (event) {
          setState(() {
            width = 150;
            height = 150;
            enter = false;
            controller.reverse();
          });
        },
        child: AnimatedContainer(
          duration: duration,
          width: width,
          height: height,
          color: widget.color,
          child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedImage(controller: controller),
                  Flexible(child: Text(widget.text)),
                ],
              ),
          )
        ),
      ),
    );
  }
}

class AnimatedImage extends StatefulWidget {
  final AnimationController controller;
  const AnimatedImage({
    super.key,
    required this.controller,
  });

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>{

  late final animation = CurvedAnimation(
    parent: widget.controller,
    curve: Curves.easeInOut,
  );

  double width = 150;
  double height = 150;

  bool enter = false;

  double get value => widget.controller.value * 2 * pi;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.rotate(
          angle: value,
          child: child,
        );
      },
      child: Image.asset(
        'assets/images/dash.png',
        width: width,
        height: height,
      ),
    );
  }
}

