import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:job_tracker_fl/mock/mock_exam.dart';
import 'package:job_tracker_fl/widgets/custom_appbar.dart';

class JobsScreen extends HookWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<MockExam> exams = useMemoized(() => MockExamGenerator.generate());
    return Scaffold(
      appBar: const CustomAppBar(title: "Jobs"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(HeroIcons.plus),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: exams.length,
          itemBuilder: (BuildContext context, int index) =>
              JobListItem(exam: exams[index]),
        ),
      ),
    );
  }
}

class JobListItem extends StatelessWidget {
  const JobListItem({
    super.key,
    required this.exam,
  });

  final MockExam exam;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.4),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  exam.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 6.0,
                  vertical: 2.0,
                ),
                child: Text(
                  exam.status,
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                ),
              )
            ],
          ),
          Text(
            exam.organization,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          NextStepCard(exam: exam)
        ],
      ),
    );
  }
}

class NextStepCard extends StatelessWidget {
  const NextStepCard({
    super.key,
    required this.exam,
  });

  final MockExam exam;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(top: 8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Next Step",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ],
          ),
          Text(
            exam.steps.first.title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ],
      ),
    );
  }
}
