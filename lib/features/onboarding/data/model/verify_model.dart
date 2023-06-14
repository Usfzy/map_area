class VerifyModel {
  final int statusCode;
  final String message;
  final Data data;

  VerifyModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory VerifyModel.fromJson(Map<String, dynamic> json) => VerifyModel(
        statusCode: json['status_code'],
        message: json['message'],
        data: Data.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'status_code': statusCode,
        'message': message,
        'data': data.toJson(),
      };
}

class Data {
  final String firstName;
  final String lastName;
  final String otherName;
  final String birthday;

  Data({
    required this.firstName,
    required this.lastName,
    required this.otherName,
    required this.birthday,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json['first_name'],
        lastName: json['last_name'],
        otherName: json['other_name'],
        birthday: json['birthday'],
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'other_name': otherName,
        'birthday': birthday,
      };
}
