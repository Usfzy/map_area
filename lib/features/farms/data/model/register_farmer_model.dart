class RegisterFarmerModel {
  final int statusCode;
  final String message;
  final RegisterFarmer registerFarmer;

  RegisterFarmerModel({
    required this.statusCode,
    required this.message,
    required this.registerFarmer,
  });

  factory RegisterFarmerModel.fromJson(Map<String, dynamic> json) => RegisterFarmerModel(
        statusCode: json['status_code'],
        message: json['message'],
        registerFarmer: RegisterFarmer.fromJson(json['register_farmer']),
      );

  Map<String, dynamic> toJson() => {
        'status_code': statusCode,
        'message': message,
        'register_farmer': registerFarmer.toJson(),
      };
}

class RegisterFarmer {
  final bool status;
  final String id;
  final String photo;
  final String idType;
  final String idNumber;
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
  final int farmerNumber;

  RegisterFarmer({
    required this.status,
    required this.id,
    required this.photo,
    required this.idType,
    required this.idNumber,
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
    required this.farmerNumber,
  });

  factory RegisterFarmer.fromJson(Map<String, dynamic> json) => RegisterFarmer(
        status: json['status'],
        id: json['_id'],
        photo: json['photo'],
        idType: json['id_type'],
        idNumber: json['id_number'],
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
        farmerNumber: json['farmer_number'],
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        '_id': id,
        'photo': photo,
        'id_type': idType,
        'id_number': idNumber,
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
        'farmer_number': farmerNumber,
      };
}
