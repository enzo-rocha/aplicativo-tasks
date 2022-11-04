import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  const Difficulty(this.dificuldade, {
    Key? key,
  }) : super(key: key);

  final int dificuldade;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,
            size: 13,
            color:
            (dificuldade) >= 1 ? Colors.purple : Colors.purple[100]),
        Icon(Icons.star,
            size: 13,
            color:
            (dificuldade) >= 2 ? Colors.purple : Colors.purple[100]),
        Icon(Icons.star,
            size: 13,
            color:
            (dificuldade) >= 3 ? Colors.purple : Colors.purple[100]),
        Icon(Icons.star,
            size: 13,
            color:
            (dificuldade) >= 4 ? Colors.purple : Colors.purple[100]),
        Icon(Icons.star,
            size: 13,
            color:
            (dificuldade) >= 5 ? Colors.purple : Colors.purple[100]),
      ],
    );
  }
}