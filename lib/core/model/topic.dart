class TopicModel {
  final String name;
  final String id;
  final String content;

  TopicModel({
    required this.name,
    required this.id,
    required this.content,
  });

  factory TopicModel.fromJson(Map<String, dynamic> json) => TopicModel(
        name: json["name"],
        id: json["id"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "content": content,
      };

  static List<TopicModel> decoder(dynamic data) {
    try {
      return (data as List)
          .map((element) => TopicModel.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
