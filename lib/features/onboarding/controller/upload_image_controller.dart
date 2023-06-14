import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nirsalfo/core/app_export.dart';
import 'package:nirsalfo/core/model/general_resp_model.dart';
import 'package:nirsalfo/core/utils/utils.dart';

final uploadImageControllerProvider = StateNotifierProvider<UploadImageController, AsyncValue>(
  (ref) => UploadImageController(),
);

class UploadImageController extends StateNotifier<AsyncValue> {
  UploadImageController() : super(AsyncData(null));

  Future<void> uploadFile(File file, String token) async {
    state = AsyncLoading();

    ///MultiPart request
    var request = MultipartRequest(
      'POST',
      Uri.parse('$kBaseUrl/files'),
    );

    Map<String, String> headers = { 'Content-type': 'multipart/form-data'};
    request.files.add(
      MultipartFile(
        'file',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: file.path.split('/').last,
        // contentType: MediaType('image', 'jpeg'),
      ),
    );
    request.headers.addAll(headers);

    try {
      var res = await request.send();

      final response = await res.stream.bytesToString();
      final json = jsonDecode(response);

      state = AsyncValue.data(GeneralResponseModel.fromJson(json));
    } catch (e) {
      state = AsyncValue.error(parseError(e), StackTrace.current);
    }
  }
}
