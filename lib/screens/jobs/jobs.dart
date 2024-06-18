import 'package:flutter/material.dart';
import 'package:job_tracker_fl/widgets/custom_appbar.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Jobs"),
      body: SafeArea(
        child: Placeholder(),
      ),
    );
  }
}
