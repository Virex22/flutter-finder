import 'package:faker/faker.dart';
import 'package:finder/models/bachelor.dart';
import 'dart:math';

List<String> maleFirstNames = [
  'John',
  'Michael',
  'Robert',
  'William',
  'David',
];

List<String> femaleFirstNames = [
  'Mary',
  'Jennifer',
  'Linda',
  'Patricia',
  'Susan',
];

class FakeDataGenerator {
  String generateFirstName(Gender gender) {
    Random random = Random();

    if (gender == Gender.male) {
      return maleFirstNames[random.nextInt(maleFirstNames.length)];
    } else {
      return femaleFirstNames[random.nextInt(femaleFirstNames.length)];
    }
  }

  List<Bachelor> generateFakeBachelors() {
    List<Bachelor> bachelors = [];

    Faker faker = Faker();

    for (int i = 1; i < 16; i++) {
      bachelors.add(
        Bachelor(
          firstname: generateFirstName(Gender.male),
          lastname: faker.person.lastName(),
          gender: Gender.male,
          avatar: 'assets/images/man-$i.png',
          searchFor: [Gender.female],
          job: faker.job.title(),
          description: faker.lorem.sentence(),
        ),
      );
    }

    for (int i = 1; i < 16; i++) {
      bachelors.add(
        Bachelor(
          firstname: generateFirstName(Gender.female),
          lastname: faker.person.lastName(),
          gender: Gender.female,
          avatar: 'assets/images/woman-$i.png',
          searchFor: [Gender.male],
          job: faker.job.title(),
          description: faker.lorem.sentence(),
        ),
      );
    }

    return bachelors;
  }
}
