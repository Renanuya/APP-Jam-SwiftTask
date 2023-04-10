import 'package:flutter/material.dart';
import '../models/task.dart';
import 'package:dotted_border/dotted_border.dart';

import '../screens/detail/widgets/detail.dart';

class Tasks extends StatelessWidget {
  final tasksList = Task.generateTasks();

  Tasks({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
          itemCount: tasksList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10), //SGDFCAC
          itemBuilder: (context, index) => tasksList[index].isLast
              ? _buildAddTask()
              : _buildTask(context, tasksList[index])),
    ); //Container
  }

  Widget _buildAddTask() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(20),
      dashPattern: const [10, 10],
      color: Colors.grey,
      strokeWidth: 2,
      child: const Center(
        child: Text(
          '+ Ekle',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildTask(BuildContext context, Task? task) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DetailPage(task)));
        },
        child: SizedBox(
          height: 50,
          width: 50,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: task!.bgColor, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  task.iconData,
                  color: task.iconColor,
                  size: 35,
                ),
                const SizedBox(height: 10),
                Text(
                  task.title!,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    _buildTaskStatus(task.btnColor ?? Colors.white,
                        task.kWhite ?? Colors.white, '${task.left} kaldı'),
                    const SizedBox(width: 5),
                    _buildTaskStatus(Colors.white,
                        task.iconColor ?? Colors.white, '${task.done} bitti')
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

Widget _buildTaskStatus(Color bgColor, Color txColor, String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      text,
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
    ),
  );
}
