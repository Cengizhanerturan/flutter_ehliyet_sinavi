class DrivingTestModel {
  final String name;
  final String id;
  final String content;

  DrivingTestModel({
    required this.name,
    required this.id,
    required this.content,
  });

  factory DrivingTestModel.fromJson(Map<String, dynamic> json) =>
      DrivingTestModel(
        name: json["name"],
        id: json["id"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "content": content,
      };

  static List<DrivingTestModel> decoder(dynamic data) {
    try {
      return (data as List)
          .map((element) => DrivingTestModel.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
