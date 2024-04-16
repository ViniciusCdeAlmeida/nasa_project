import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:nasa_project/domain/enums/media_type_enum.dart';

part 'image_entity.g.dart';

@HiveType(typeId: 0)
final class ImageEntity extends Equatable {
  @HiveField(0)
  final String? author;
  @HiveField(1)
  final DateTime date;
  @HiveField(2)
  final String explanation;
  @HiveField(3)
  final String file;
  @HiveField(4)
  final MediaTypeEnum type;
  @HiveField(5)
  final String title;

  const ImageEntity({
    required this.author,
    required this.date,
    required this.explanation,
    required this.file,
    required this.type,
    required this.title,
  });

  @override
  List<Object?> get props => [
        author,
        date,
        explanation,
        file,
        type,
        title,
      ];

  @override
  String toString() {
    return '$runtimeType {\n'
        '\tauthor: $author,\n'
        '\tdate: $date,\n'
        '\texplanation: $explanation,\n'
        '\tfile: $file,\n'
        '\ttype: $type,\n'
        '\ttitle: $title,\n'
        '}\n';
  }

  ImageEntity copyWith({
    String? author,
    DateTime? date,
    String? explanation,
    String? file,
    MediaTypeEnum? type,
    String? title,
  }) {
    return ImageEntity(
      date: date ?? this.date,
      author: author ?? this.author,
      explanation: explanation ?? this.explanation,
      file: file ?? this.file,
      type: type ?? this.type,
      title: title ?? this.title,
    );
  }
}
