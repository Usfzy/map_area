class FarmerModel {
  final int statusCode;
  final String message;
  final List<FarmerModelDatum> data;

  FarmerModel({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory FarmerModel.fromJson(Map<String, dynamic> json) => FarmerModel(
        statusCode: json['status_code'],
        message: json['message'],
        data: List<FarmerModelDatum>.from(json['data'].map((x) => FarmerModelDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'status_code': statusCode,
        'message': message,
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FarmerModelDatum {
  final Metadata metadata;
  final List<FarmerDatum> data;

  FarmerModelDatum({
    required this.metadata,
    required this.data,
  });

  factory FarmerModelDatum.fromJson(Map<String, dynamic> json) => FarmerModelDatum(
        metadata: Metadata.fromJson(json['metadata']),
        data: List<FarmerDatum>.from(json['data'].map((x) => FarmerDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'metadata': metadata.toJson(),
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class FarmerDatum {
  final String datumId;
  final String photo;
  final String firstName;
  final String lastName;
  final String otherName;
  final int id;
  final String location;
  final int farms;
  final String phone;
  final String status;

  FarmerDatum({
    required this.datumId,
    required this.photo,
    required this.firstName,
    required this.lastName,
    required this.otherName,
    required this.id,
    required this.location,
    required this.farms,
    required this.phone,
    required this.status,
  });

  factory FarmerDatum.fromJson(Map<String, dynamic> json) => FarmerDatum(
        datumId: json['_id'],
        photo: json['photo'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        otherName: json['other_name'],
        id: json['ID'],
        location: json['location'],
        farms: json['farms'],
        phone: json['phone'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        '_id': datumId,
        'photo': photo,
        'first_name': firstName,
        'last_name': lastName,
        'other_name': otherName,
        'ID': id,
        'location': location,
        'farms': farms,
        'phone': phone,
        'status': status,
      };
}

class Metadata {
  final int total;
  final int page;
  final int limit;
  final int pages;

  Metadata({
    required this.total,
    required this.page,
    required this.limit,
    required this.pages,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        total: json['total'],
        page: json['page'],
        limit: json['limit'],
        pages: json['pages'],
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'page': page,
        'limit': limit,
        'pages': pages,
      };
}
