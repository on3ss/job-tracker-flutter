import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
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
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => const ApplicationForm(),
          );
        },
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
                onTap: () => context.goNamed('job-detail'),
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
}

class ApplicationForm extends HookWidget {
  const ApplicationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 36, horizontal: 16.0),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Application",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                label: "Title",
                hint: "Title",
                validator: ValidationBuilder()
                    .required()
                    .minLength(4)
                    .maxLength(255)
                    .build(),
              ),
              CustomTextFormField(
                label: "Description",
                hint: "Description",
                minLines: 4,
                maxLines: 6,
                validator: ValidationBuilder().maxLength(255).build(),
              ),
              CustomTextFormField(
                label: "Organization",
                hint: "Organization",
                validator: ValidationBuilder()
                    .required()
                    .minLength(4)
                    .maxLength(255)
                    .build(),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Add",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final int minLines;
  final int maxLines;
  final String? Function(String?)? validator;

  const CustomTextFormField({
    super.key,
    this.minLines = 1,
    this.maxLines = 1,
    required this.label,
    required this.hint,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        minLines: minLines,
        maxLines: maxLines,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 2.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 2.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 2.0,
            ),
          ),
          errorStyle: TextStyle(
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    );
  }
}
