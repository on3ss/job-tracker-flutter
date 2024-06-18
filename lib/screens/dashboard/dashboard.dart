import 'package:flutter/material.dart';
import 'package:job_tracker_fl/widgets/custom_appbar.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Dashboard"),
      body: SafeArea(
        child: Placeholder(),
      ),
    );
  }
}
