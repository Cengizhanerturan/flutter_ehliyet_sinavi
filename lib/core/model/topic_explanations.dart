class TopicExplanationsModel {
  final String name;
  final String id;

  TopicExplanationsModel({
    required this.name,
    required this.id,
  });

  factory TopicExplanationsModel.fromJson(Map<String, dynamic> json) =>
      TopicExplanationsModel(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };

  static List<TopicExplanationsModel> decoder(dynamic data) {
    try {
      return (data as List)
          .map((element) => TopicExplanationsModel.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
