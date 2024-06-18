import 'package:flutter/material.dart';
import 'package:job_tracker_fl/widgets/custom_appbar.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "More"),
      body: Placeholder(),
    );
  }
}
