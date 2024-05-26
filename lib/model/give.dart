// ignore: camel_case_types
class give {
  String name;
  String url;

  give(this.name, this.url);

  factory give.fromJson(Map<String, dynamic> json) {
    return give(
      json['strDrink'] as String,
      json['strDrinkThumb'] as String,
    );
  }

  Object? toJson() {
    Map<String, dynamic> toJson() {
      return {
        'strDrink': name,
        'strDrinkThumb': url,
      };
    }
  }
}
