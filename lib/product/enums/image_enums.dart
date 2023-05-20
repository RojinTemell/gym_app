enum ImageEnums {
  cardImage('gym_photo1');

  final String value;
  const ImageEnums(this.value);

  String get toPng => 'assets/images/$value.jpg';
}
