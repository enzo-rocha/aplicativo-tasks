import 'package:flutter/material.dart';
import 'package:tasks_app/components/difficulty.dart';

class Task extends StatefulWidget {
  final String task;
  final String foto;
  final int dificuldade;

  const Task(this.task, this.foto, this.dificuldade, {Key? key})
      : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int i = 0;
  Color cor = Colors.purple;
  int nivel = 0;
  List<Color> niveis = [
    Colors.green,
    Colors.amber,
    Colors.orange,
    Colors.red,
    Colors.black
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cor,
            ),
            height: 140,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        width: 72,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            widget.foto,
                            fit: BoxFit.cover,
                          ),
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: 200,
                            child: Text(
                              widget.task,
                              style: const TextStyle(fontSize: 20),
                              overflow: TextOverflow.fade,
                            )),
                        Difficulty(widget.dificuldade),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                i++;
                                if (nivel == 5) {
                                  i++;
                                } else if (i == ((widget.dificuldade * 10) + 1)) {
                                  i = 0;
                                  nivel++;
                                  cor = niveis[(nivel - 1)];
                                }
                              });
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.arrow_drop_up,
                                    shadows: [Shadow(color: Colors.black)]),
                                Text(
                                  "Up",
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                  textAlign: TextAlign.center,
                                )
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.purple[300],
                        value: (widget.dificuldade > 0)
                            ? i / (widget.dificuldade * 10)
                            : 1,
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text("Nivel: $i",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16))),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}