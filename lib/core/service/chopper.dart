import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:nirsalfo/core/model/general_resp_model.dart';
import 'package:nirsalfo/features/onboarding/data/model/verify_model.dart';

import '../../features/farms/data/model/farmer_model.dart';
import '../../features/farms/services/farm_service.dart';
import '../../features/onboarding/data/model/biodata_model.dart';
import '../constants/constants.dart';

final chopperClient = ChopperClient(
  baseUrl: Uri.parse(kBaseUrl),
  services: [
    FarmService.create(),
  ],
  converter: JsonToTypeConverter(
    {
      GeneralResponseModel: (json) => GeneralResponseModel.fromJson(json),
      VerifyModel: (json) => VerifyModel.fromJson(json),
      BiodataModel: (json) => BiodataModel.fromJson(json),
      FarmerModel: (json) => FarmerModel.fromJson(json),
    },
  ),
  interceptors: [
    HttpLoggingInterceptor(),
  ],
  // authenticator: TokenAuthenticator(),
);

class TokenAuthenticator extends Authenticator {
  @override
  FutureOr<Request?> authenticate(Request request, Response response, [Request? originalRequest]) async {
    // if (response.statusCode == 401) {
    //   final token = await getToken();
    //   final updatedHeaders = Map<String, String>.of(request.headers);

    //   if (token.isNotEmpty) {
    //     updatedHeaders.update('Authorization', (value) => 'Bearer $token', ifAbsent: () => 'Bearer $token');
    //     return request.copyWith(headers: updatedHeaders);
    //   }
    // }
    return request;
  }
}

class TokenInterceptor extends RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async {
    // final preffs = await SharedPreferences.getInstance();
    // final token = preffs.getString(KeyConstatnts.kCachedToken) ?? '';
    // request.copyWith(headers: {
    //   'Content-Type': 'application/json; charset=UTF-8',
    //   'Authorization': "Bearer " + token,
    // });
    return request;
  }
}

class JsonToTypeConverter extends JsonConverter {
  final Map<Type, Function> typeToJsonFactoryMap;

  JsonToTypeConverter(this.typeToJsonFactoryMap);

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    return response.copyWith(
      body: fromJsonData<BodyType, InnerType>(
        response.body,
        typeToJsonFactoryMap[InnerType],
      ),
    );
  }

  T fromJsonData<T, InnerType>(String jsonData, Function? jsonParser) {
    var jsonMap = json.decode(jsonData);
    if (jsonParser == null) {
      print('jsonMap : $jsonMap');
      return jsonMap as T;
    }
    if (jsonMap is List) {
      return jsonMap.map((item) => jsonParser(item as Map<String, dynamic>) as InnerType).toList() as T;
    }

    return jsonParser(jsonMap);
  }
}
