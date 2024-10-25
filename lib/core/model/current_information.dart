class CurrentInformationModel {
  final String name;
  final String id;
  final String content;

  CurrentInformationModel({
    required this.name,
    required this.id,
    required this.content,
  });

  factory CurrentInformationModel.fromJson(Map<String, dynamic> json) =>
      CurrentInformationModel(
        name: json["name"],
        id: json["id"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "content": content,
      };

  static List<CurrentInformationModel> decoder(dynamic data) {
    try {
      return (data as List)
          .map((element) => CurrentInformationModel.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
