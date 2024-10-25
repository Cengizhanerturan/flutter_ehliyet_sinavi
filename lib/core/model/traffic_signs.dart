class TrafficSignsModel {
  final String name;
  final String id;
  final String imgUrl;

  TrafficSignsModel({
    required this.name,
    required this.id,
    required this.imgUrl,
  });

  factory TrafficSignsModel.fromJson(Map<String, dynamic> json) =>
      TrafficSignsModel(
        name: json["name"],
        id: json["id"],
        imgUrl: json["img_url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "img_url": imgUrl,
      };

  static List<TrafficSignsModel> decoder(dynamic data) {
    try {
      return (data as List)
          .map((element) => TrafficSignsModel.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
