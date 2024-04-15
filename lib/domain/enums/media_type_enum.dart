enum MediaTypeEnum {
  image('image'),
  video('video');

  final String value;

  const MediaTypeEnum(
    this.value,
  );

  static MediaTypeEnum fromValue(String value) {
    return MediaTypeEnum.values.singleWhere(
      (element) => element.value == value,
    );
  }
}
