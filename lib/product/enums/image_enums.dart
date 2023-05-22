enum ImageEnums {
  cardImage('gym_photo1'),
  firstPageImage('firstPageImage'),
  secondPage1Image('secondPage1');

  final String value;
  const ImageEnums(this.value);

  String get toJpg => 'assets/images/$value.jpg';
}
