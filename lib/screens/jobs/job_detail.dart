import 'package:flutter/material.dart';
import 'package:job_tracker_fl/widgets/custom_appbar.dart';

class JobDetailScreen extends StatelessWidget {
  const JobDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Details"),
      body: SafeArea(child: Center()),
    );
  }
}
