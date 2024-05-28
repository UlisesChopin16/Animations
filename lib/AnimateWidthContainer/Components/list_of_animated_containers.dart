import 'package:flutter/material.dart';
import 'package:new_app/AnimateWidthContainer/Components/animated_container_component.dart';

class ListOfAnimatedContainers extends StatefulWidget {
  const ListOfAnimatedContainers({ super.key });

  @override
  State<ListOfAnimatedContainers> createState() => _ListOfAnimatedContainersState();
}

class _ListOfAnimatedContainersState extends State<ListOfAnimatedContainers> {

  int itemCount = 10;

  late List<bool> enter = List.generate(itemCount, (index) => false);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          itemCount,
          (index) => AnimatedContainerComponent(
            color: Colors.primaries[index % Colors.primaries.length],
            text: 'Container $index',
            onTap: () {
              setState(() {
                enter = List.generate(itemCount, (index) => false);
                enter[index] = true;
              });
            },
            enter: enter[index],
          ),
        ),
      ),
    );
  }
}