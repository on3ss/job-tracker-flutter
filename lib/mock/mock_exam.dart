import 'package:faker/faker.dart';

enum MockExamStatus { inProgress, cancelled, passed }

class MockExam {
  final int id;
  final String title;
  final String? description;
  final String organization;
  final String status;
  final List<MockExamStep> steps;

  MockExam({
    this.id = 0,
    required this.title,
    required this.description,
    required this.organization,
    required this.status,
    required this.steps,
  });
}

class MockExamStep {
  final int id;
  final String title;
  final DateTime dateTime;
  final String venue;
  final List<MockSubject> subjects;

  MockExamStep({
    this.id = 0,
    required this.title,
    required this.dateTime,
    required this.venue,
    required this.subjects,
  });
}

class MockSubject {
  final int id;
  final String name;

  MockSubject({required this.id, required this.name});
}

class MockExamGenerator {
  static final faker = Faker();
  static final List<String> statuses = ["in-progress", "done", "cancelled"];

  static List<MockExam> generate() {
    return List.generate(
      20,
      (index) => MockExam(
        id: index,
        title: faker.lorem
            .words(faker.randomGenerator.integer(4, min: 2))
            .join(' '),
        description: faker.lorem.sentence(),
        organization: faker.company.name(),
        status: statuses[faker.randomGenerator.integer(statuses.length - 1)],
        steps: generateSteps(),
      ),
    );
  }

  static List<MockExamStep> generateSteps() {
    return List.generate(
      5,
      (index) => MockExamStep(
        id: index,
        title: faker.lorem.sentence(),
        dateTime:
            faker.date.dateTimeBetween(DateTime(2010, 1, 1), DateTime.now()),
        venue:
            "${faker.address.buildingNumber()}, ${faker.address.neighborhood()}, ${faker.address.city()} - ${faker.address.zipCode()}",
        subjects: List.generate(
          5,
          (index) => MockSubject(id: index, name: faker.lorem.word()),
        ),
      ),
    );
  }
}
