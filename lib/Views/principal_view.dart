import 'package:flutter/material.dart';
import 'package:new_app/Components/animated_container_component.dart';

class PrincipalView extends StatelessWidget {
  const PrincipalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('Principal View'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainerComponent(
            color: Theme.of(context).colorScheme.secondaryContainer,
            text: 'Hello World',
          ),
          AnimatedContainerComponent(
            color: Theme.of(context).colorScheme.secondaryContainer,
            text: 'Hello World',
          ),
          AnimatedContainerComponent(
            color: Theme.of(context).colorScheme.secondaryContainer,
            text: 'Hello World',
          ),
          AnimatedContainerComponent(
            color: Theme.of(context).colorScheme.secondaryContainer,
            text: 'Hello World',
          ),
        ],
      ),
    );
  }
}
