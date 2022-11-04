import 'package:flutter/material.dart';
import 'package:tasks_app/components/task.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final AnimationController controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300));
  bool tapped = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[200],
      appBar: AppBar(
        leading: Container(),
        title: const Text("FlutterTask"),
      ),
      body: AnimatedOpacity(
        opacity: tapped ? 1 : 0,
        duration: const Duration(milliseconds: 500),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: const [
            Task("Descansar", "assets/images/descansar.jpg", 5),
            Task("Tomar água", "assets/images/beber_agua.jpg", 2),
            Task("Comer", "assets/images/comer.jpg", 1),
            Task("Estudar", "assets/images/estudar.jpg", 2),
            Task("Trabalhar", "assets/images/trabalhar.jpg", 2),
            Task("Se exercitar", "assets/images/exercitar.jpg", 4),
            SizedBox(
              height: 80,
            )
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        child: FloatingActionButton.small(
          child: AnimatedIcon(
            icon: AnimatedIcons.arrow_menu,
            progress: CurvedAnimation(parent: controller, curve: Curves.linear),
          ),
          onPressed: () {
            setState(() {
              tapped = !tapped;
              controller.isCompleted
                  ? controller.reverse()
                  : controller.forward();
            });
          },
        ),
      ),
    );
  }
}
