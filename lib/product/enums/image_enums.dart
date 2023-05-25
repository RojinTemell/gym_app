enum ImageEnums {
  cardImage('gym_photo1'),
  firstPageImage('firstPageImage'),
  secondPage1Image('secondPage1'),
  secondPage2Image('secondPage2'),
  secondPage3Image('secondPage3'),
  workoutPlanDetailPage('workoutPlanDetailPageImage'),
  loginPageImage('loginPageImage');

  final String value;
  const ImageEnums(this.value);

  String get toJpg => 'assets/images/$value.jpg';
}
