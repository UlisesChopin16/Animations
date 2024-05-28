import 'package:flutter/material.dart';
import 'package:new_app/AnimateWidthContainer/Components/list_of_animated_containers.dart';

class PrincipalView extends StatelessWidget {
  const PrincipalView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        title: const Text('Principal View'),
      ),
      body: const FittedBox(
        child: SizedBox(
          height: 800,
          child: ListOfAnimatedContainers()
        ),
      ),
    );
  }
}
