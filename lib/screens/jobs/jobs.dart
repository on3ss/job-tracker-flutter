import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:job_tracker_fl/mock/mock_exam.dart';
import 'package:job_tracker_fl/widgets/custom_appbar.dart';

class JobsScreen extends HookWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: statuses.length);
    final exams = useMemoized(() => MockExamGenerator.generate());

    return Scaffold(
      appBar: CustomAppBar(
        title: "Jobs",
        bottom: TabBar(
          isScrollable: true,
          controller: tabController,
          tabs: _buildTabs(statuses),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        child: const Icon(HeroIcons.plus),
      ),
      body: SafeArea(
        child: TabBarView(
          controller: tabController,
          children: _buildTabViews(statuses, exams),
        ),
      ),
    );
  }

  List<Widget> _buildTabs(List<String> statuses) {
    return statuses.map((status) => Tab(text: status)).toList();
  }

  List<Widget> _buildTabViews(List<String> statuses, List<MockExam> exams) {
    return statuses
        .map((status) => ListView.builder(
              itemCount: exams.length,
              itemBuilder: (BuildContext context, int index) => ListTile(
                onTap: () {},
                title: Text(exams[index].title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(exams[index].organization),
                    Text(
                      "${exams[index].steps.length} of ${exams[index].steps.length} steps left",
                    ),
                  ],
                ),
              ),
            ))
        .toList();
  }

  void _onFabPressed() {
    // TODO: Implement your FAB action here
  }
}
