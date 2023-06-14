class GeneralResponseModel {
  final int? statusCode;
  final String? message;
  final String? status;
  final String? data;

  GeneralResponseModel({
    required this.statusCode,
    required this.message,
    required this.status,
    required this.data,
  });

  factory GeneralResponseModel.fromJson(Map<String, dynamic> json) => GeneralResponseModel(
        statusCode: json['statusCode'],
        message: json['message'],
        status: json['status'],
        data: json['data'],
      );

  Map<String, dynamic> toJson() => {
        'statusCode': statusCode,
        'message': message,
        'status': status,
        'data': data,
      };
}
