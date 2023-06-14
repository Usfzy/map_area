// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farm_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$FarmService extends FarmService {
  _$FarmService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = FarmService;

  @override
  Future<Response<VerifyModel>> verifyFarmer(Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/farmers/verify');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<VerifyModel, VerifyModel>($request);
  }

  @override
  Future<Response<RegisterFarmerModel>> registerFarmer(
      Map<String, dynamic> body) {
    final Uri $url = Uri.parse('/farmers/register');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<RegisterFarmerModel, RegisterFarmerModel>($request);
  }

  @override
  Future<Response<BiodataModel>> getFarmerBiodata(String farmerId) {
    final Uri $url = Uri.parse('/farmers/${farmerId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BiodataModel, BiodataModel>($request);
  }

  @override
  Future<Response<FarmerModel>> getFarmersList() {
    final Uri $url = Uri.parse('/farmers/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<FarmerModel, FarmerModel>($request);
  }

  @override
  Future<Response<FarmDetailsModel>> getFarmDetails(String farmerId) {
    final Uri $url = Uri.parse('/farm/${farmerId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<FarmDetailsModel, FarmDetailsModel>($request);
  }
}
