import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TaskTimeLine extends StatelessWidget {
  final Map<String, dynamic> detail;
  const TaskTimeLine(this.detail, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      color: Colors.white,
      child: Row(
        children: [
          _buildTimeline(detail['tlColor']),
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(detail['time']),
                  detail['title'].isNotEmpty
                      ? _buildCard(
                          detail['bgColor'], detail['title'], detail['slot'])
                      : _buildCard(Colors.white, '', ''),
                ]),
          )
        ],
      ),
    );
  }

  Widget _buildCard(Color? bgColor, String title, String slot) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: bgColor,
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(title), const SizedBox(height: 10), Text(slot)],
      ),
    );
  }

  Widget _buildTimeline(Color? color) {
    return SizedBox(
      height: 200,
      width: 20,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0,
        isFirst: true,
        indicatorStyle: IndicatorStyle(
          indicatorXY: 0,
          width: 15,
          indicator: Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              border: Border.all(width: 5, color: color!),
            ),
          ),
        ),
        afterLineStyle: LineStyle(color: color, thickness: 2),
      ),
    );
  }
}
