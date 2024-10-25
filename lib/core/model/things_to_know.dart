class ThingsToKnowModel {
  final String name;
  final String id;
  final String content;

  ThingsToKnowModel({
    required this.name,
    required this.id,
    required this.content,
  });

  factory ThingsToKnowModel.fromJson(Map<String, dynamic> json) =>
      ThingsToKnowModel(
        name: json["name"],
        id: json["id"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "content": content,
      };

  static List<ThingsToKnowModel> decoder(dynamic data) {
    try {
      return (data as List)
          .map((element) => ThingsToKnowModel.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
