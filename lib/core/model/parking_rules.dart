class ParkingRulesModel {
  final String name;
  final String id;
  final String content;

  ParkingRulesModel({
    required this.name,
    required this.id,
    required this.content,
  });

  factory ParkingRulesModel.fromJson(Map<String, dynamic> json) =>
      ParkingRulesModel(
        name: json["name"],
        id: json["id"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "content": content,
      };

  static List<ParkingRulesModel> decoder(dynamic data) {
    try {
      return (data as List)
          .map((element) => ParkingRulesModel.fromJson(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
