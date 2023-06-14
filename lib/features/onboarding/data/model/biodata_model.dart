class BiodataModel {
  final int statusCode;
  final String message;
  final Data data;

  BiodataModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory BiodataModel.fromJson(Map<String, dynamic> json) => BiodataModel(
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
  final bool status;
  final String id;
  final String photo;
  final String primaryPhoneNumber;
  final String otherPhoneNumber;
  final String email;
  final String gender;
  final String stateOfOrigin;
  final String address;
  final String state;
  final String lga;
  final String firstName;
  final String lastName;
  final String otherName;
  final String birthday;
  final DateTime createdAt;
  final DateTime updatedAt;

  Data({
    required this.status,
    required this.id,
    required this.photo,
    required this.primaryPhoneNumber,
    required this.otherPhoneNumber,
    required this.email,
    required this.gender,
    required this.stateOfOrigin,
    required this.address,
    required this.state,
    required this.lga,
    required this.firstName,
    required this.lastName,
    required this.otherName,
    required this.birthday,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json['status'],
        id: json['_id'],
        photo: json['photo'],
        primaryPhoneNumber: json['primary_phone_number'],
        otherPhoneNumber: json['other_phone_number'],
        email: json['email'],
        gender: json['gender'],
        stateOfOrigin: json['state_of_origin'],
        address: json['address'],
        state: json['state'],
        lga: json['lga'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        otherName: json['other_name'],
        birthday: json['birthday'],
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        '_id': id,
        'photo': photo,
        'primary_phone_number': primaryPhoneNumber,
        'other_phone_number': otherPhoneNumber,
        'email': email,
        'gender': gender,
        'state_of_origin': stateOfOrigin,
        'address': address,
        'state': state,
        'lga': lga,
        'first_name': firstName,
        'last_name': lastName,
        'other_name': otherName,
        'birthday': birthday,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };
}
