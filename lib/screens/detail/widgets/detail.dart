import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/detail/widgets/task_timeline.dart';
import 'package:flutter_application_1/screens/detail/widgets/task_title.dart';
import '../../../models/task.dart';
import 'date_picker.dart';

class DetailPage extends StatelessWidget {
  final Task task;
  const DetailPage(this.task, {super.key});
  @override
  Widget build(BuildContext context) {
    final detailList = task.desc; //burada
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 64, 55, 87),
      body: CustomScrollView(
        slivers: [
          _buildAppBar(context),
          SliverToBoxAdapter(
              child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                DatePicker(),
                TaskTitle(),
              ],
            ),
          )),
          detailList == null
              ? SliverFillRemaining(
                  child: Container(
                      color: Colors.white,
                      child: const Center(
                          child: Text(
                        'Tamamladığın bir görev bulunmamaktadır.',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      ))))
              : SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, index) => TaskTimeLine(detailList[index]),
                    childCount: detailList.length,
                  ),
                )
        ],
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 90,
        backgroundColor: const Color.fromARGB(255, 64, 55, 87), //bura
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 20,
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
        actions: const [
          Icon(
            Icons.more_vert,
            size: 40,
          ),
        ],
        flexibleSpace: FlexibleSpaceBar(
            title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      '${task.title}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Bu gün yapmanız gereken ${task.left} görev var.',
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              )
            ])));
  }
}
