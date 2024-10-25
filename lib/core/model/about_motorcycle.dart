class AboutMotorcycleModel {
  final String name;
  final String id;
  final String content;

  AboutMotorcycleModel({
    required this.name,
    required this.id,
    required this.content,
  });

  factory AboutMotorcycleModel.fromJson(Map<String, dynamic> json) =>
      AboutMotorcycleModel(
        name: json["name"],
        id: json["id"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "content": content,
      };

  static List<AboutMotorcycleModel> decoder(dynamic data) {
    try {
      return (data as List)
          .map((element) => AboutMotorcycleModel.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
