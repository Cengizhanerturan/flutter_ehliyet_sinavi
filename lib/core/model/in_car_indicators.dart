class InCarIndicatorsModel {
  final String name;
  final String id;
  final String imgUrl;

  InCarIndicatorsModel({
    required this.name,
    required this.id,
    required this.imgUrl,
  });

  factory InCarIndicatorsModel.fromJson(Map<String, dynamic> json) =>
      InCarIndicatorsModel(
        name: json["name"],
        id: json["id"],
        imgUrl: json["img_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "img_url": imgUrl,
      };

  static List<InCarIndicatorsModel> decoder(dynamic data) {
    try {
      return (data as List)
          .map((element) => InCarIndicatorsModel.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
