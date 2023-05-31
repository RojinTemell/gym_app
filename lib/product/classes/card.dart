// ignore_for_file: public_member_api_docs, sort_constructors_first
class Card {
  final int? cardCategories;
  int? cardId;
  final String? cardSubtitle;
  final String? cardTitle;
  final String? cardUrl;

  Card({
    this.cardCategories,
    this.cardId,
    this.cardSubtitle,
    this.cardTitle,
    this.cardUrl,
  });

  Map<String,dynamic> toJson() => {
        'cardCategories': cardCategories,
        'cardSubtitle': cardSubtitle,
        'cardTitle': cardTitle,
        'cardUrl': cardUrl,
      };

  static Card fromJson(Map<String, dynamic> json) => Card(
        cardSubtitle: json['cardSubtitle'],
        cardTitle: json['cardTitle'],
        cardUrl: json['cardUrl'],
        cardCategories: json['cardCategories'],
      );
}
