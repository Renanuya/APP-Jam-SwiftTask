import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Task {
  IconData? iconData;
  String? title;
  Color? bgColor;
  Color? iconColor;
  Color? btnColor;
  Color? kWhite;
  num? left;
  num? done;
  List<Map<String, dynamic>>? desc;
  bool isLast;
  Task(
      {this.iconData,
      this.title,
      this.bgColor,
      this.iconColor,
      this.left,
      this.done,
      this.btnColor,
      this.kWhite,
      this.desc,
      this.isLast = false});
  static List<Task> generateTasks() {
    return [
      Task(
          iconData: Icons.person_rounded,
          title: 'Kişisel Görevler',
          bgColor: kYellowLight,
          iconColor: kYellowDark,
          btnColor: kYellow,
          left: 3,
          done: 1,
          desc: [
            {
              'time': '9:00',
              'title': 'Flutter 9. modülü tamamla',
              'slot': '9:00 - 10:00',
              'tlColor': const Color.fromARGB(255, 255, 0, 0),
              'bgColor': const Color.fromARGB(255, 245, 90, 90),
            },
            {
              'time': '10:00',
              'title': 'Yazılımcılar için İngilizce 3. Modülü tamamla',
              'slot': '10:00 - 12:00',
              'tlColor': const Color.fromARGB(255, 0, 42, 255),
              'bgColor': const Color.fromARGB(255, 90, 103, 245),
            },
            {
              'time': '12:00',
              'title': '',
              'slot': '',
              'tlColor': Colors.grey.withOpacity(0.3),
            },
            {
              'time': '13.00',
              'title': 'Proje yönetimi 3. partı tamamla',
              'slot': '13:00 - 15:00',
              'tlColor': const Color.fromARGB(255, 251, 255, 0),
              'bgColor': const Color.fromARGB(255, 245, 222, 90),
            },
          ]),
      Task(
        iconData: Icons.cases_rounded,
        title: 'Projeler\n ',
        bgColor: kBlueLight,
        iconColor: kBlueDark,
        btnColor: kBlue,
        left: 0,
        done: 0,
      ),
      Task(
        iconData: Icons.favorite_rounded,
        title: 'Tamamlanan Görevler',
        bgColor: kRedLight,
        iconColor: kRedDark,
        btnColor: kRed,
        left: 0,
        done: 0,
      ),
      Task(isLast: true),
    ];
  }
}
