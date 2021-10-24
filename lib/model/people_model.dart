class PeopleModel {
  final String id;
  final String name;
  final String sex;
  final String address;

  PeopleModel({
    required this.id,
    required this.name,
    required this.sex,
    required this.address,
  });

  factory PeopleModel.fromJson(Map<String, dynamic> json) => PeopleModel(
        id: json['id'] as String,
        name: json['name'] as String,
        sex: json['sex'] as String,
        address: json['address'] as String,
      );
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sex': sex,
      'address': address,
    };
  }
}
