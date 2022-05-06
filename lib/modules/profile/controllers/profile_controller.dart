import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_calling_app/apis/models/responses/profile_response.dart';
import 'package:video_calling_app/apis/providers/api_provider.dart';
import 'package:video_calling_app/apis/services/auth_service.dart';
import 'package:video_calling_app/constants/strings.dart';
import 'package:video_calling_app/helpers/utils.dart';

class ProfileController extends GetxController {
  static ProfileController get find => Get.find();

  final _apiProvider = ApiProvider(http.Client());

  final _auth = AuthService.find;

  final _isLoading = false.obs;
  final _profileData = ProfileResponse().obs;

  bool get isLoading => _isLoading.value;

  ProfileResponse get profileData => _profileData.value;

  set setProfileData(ProfileResponse value) {
    _profileData.value = value;
  }

  Future<void> _getProfileDetails() async {
    _isLoading.value = true;
    update();
    AppUtils.printLog("Fetching Profile Details Request...");
    try {
      final response = await _apiProvider.getProfileDetails(_auth.authToken);

      final decodedData = jsonDecode(utf8.decode(response.bodyBytes));

      if (response.statusCode == 200) {
        setProfileData = ProfileResponse.fromJson(decodedData);
        _isLoading.value = false;
        update();
      } else {
        _isLoading.value = false;
        update();
        AppUtils.showSnackBar(
          decodedData[StringValues.message],
          StringValues.error,
        );
      }
    } on SocketException {
      _isLoading.value = false;
      update();
      AppUtils.printLog(StringValues.internetConnError);
      AppUtils.showSnackBar(StringValues.internetConnError, StringValues.error);
    } on TimeoutException {
      _isLoading.value = false;
      update();
      AppUtils.printLog(StringValues.connTimedOut);
      AppUtils.printLog(StringValues.connTimedOut);
      AppUtils.showSnackBar(StringValues.connTimedOut, StringValues.error);
    } on FormatException catch (e) {
      _isLoading.value = false;
      update();
      AppUtils.printLog(StringValues.formatExcError);
      AppUtils.printLog(e);
      AppUtils.showSnackBar(StringValues.errorOccurred, StringValues.error);
    } catch (exc) {
      _isLoading.value = false;
      update();
      AppUtils.printLog(StringValues.errorOccurred);
      AppUtils.printLog(exc);
      AppUtils.showSnackBar(StringValues.errorOccurred, StringValues.error);
    }
  }

  Future<void> getProfileDetails() async => await _getProfileDetails();
}
