import 'package:faker/faker.dart';
import 'package:nasa_project/domain/entities/image_entity.dart';
import 'package:nasa_project/domain/enums/media_type_enum.dart';

class ImageMapper {
  static ImageEntity fromMap(Map<dynamic, dynamic> map) {
    return ImageEntity(
      author: map['copyright'],
      date: DateTime.parse(map['date']),
      explanation: map['explanation'],
      file: map['hdurl'] ?? map['url'],
      type: MediaTypeEnum.fromValue(map['media_type']),
      title: map['title'],
    );
  }

  static Map<String, dynamic> toMap(ImageEntity image) {
    return {
      'copyright': image.author,
      'date': image.date,
      'explanation': image.explanation,
      'hdurl': image.file,
      'url': image.file,
      'media_type': image.type,
      'title': image.title,
    };
  }

  static ImageEntity fake() {
    return ImageEntity(
      author: faker.person.name(),
      date: faker.date.dateTime(),
      explanation: faker.lorem.sentence(),
      title: faker.company.name(),
      file: faker.image.image(),
      type: MediaTypeEnum.fromValue('image'),
    );
  }

  static List<ImageEntity> fakeList(int length) {
    return List<ImageEntity>.generate(
      length,
      (index) => fake(),
    );
  }
}
