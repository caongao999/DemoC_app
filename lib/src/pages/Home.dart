import 'package:flutter/material.dart';
import 'package:untitled1/src/Container/weatherContainer.dart';
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[200],
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            child: weatherContainer(),
          )
        ],
      ),
    );
  }
}
