import 'package:equatable/equatable.dart';
import 'package:nasa_project/domain/enums/media_type_enum.dart';

final class ImageEntity extends Equatable {
  final String author;
  final DateTime date;
  final String explanation;
  final String file;
  final MediaTypeEnum type;
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
