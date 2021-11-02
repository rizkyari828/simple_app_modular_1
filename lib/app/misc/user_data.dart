import 'package:modular_1/app/misc/constants.dart';
import 'package:modular_1/data/infrastructures/encrypter_interface.dart';
import 'package:modular_1/domains/entities/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  // basic profile
  int? id;
  String? name, phone, email, photo;

  // token
  String? token;
  int? expiresAt;

  // misc
  bool? forgotPassword;
  bool? isRegistered;
  String? password;
  String? logoutReason;
  int? lastUser;
  bool? hasSeenAppInfo;
  String? fcmToken;

  EncrypterInterface? _encrypter;

  UserData(this._encrypter) {
    this.loadData();
  }

  void fromUser(User user) {
    this.id = user.id;
    this.name = user.profile?.name;
    this.phone = user.profile?.phone;
    this.email = user.profile?.email;
    this.photo = user.profile?.photo;

    if (user.token != null) {
      this.token = user.token?.accessToken;
      this.expiresAt = user.token?.expiresAt;
    }

    this.isRegistered = user.isRegistered;
  }

  void fromToken(Token token) {
    this.token = token.accessToken;
    this.expiresAt = token.expiresAt;
  }

  void loadData() {
    this._getSharedPreferences()?.then((sp) {
      var userDataId = sp.getString(AppConstants.USER_DATA_ID) ?? "";
      this.id = int.tryParse(_decryptValue(userDataId) ?? "");
      this.name =
          _decryptValue(sp.getString(AppConstants.USER_DATA_NAME) ?? "");
      this.phone =
          _decryptValue(sp.getString(AppConstants.USER_DATA_PHONE) ?? "");
      this.email =
          _decryptValue(sp.getString(AppConstants.USER_DATA_EMAIL) ?? "");
      this.photo =
          _decryptValue(sp.getString(AppConstants.USER_DATA_PHOTO) ?? "");
      this.token =
          _decryptValue(sp.getString(AppConstants.USER_DATA_TOKEN) ?? "");
      var userDataExpiresAt =
          sp.getString(AppConstants.USER_DATA_EXPIRES_AT) ?? "";
      this.expiresAt = int.tryParse(_decryptValue(userDataExpiresAt) ?? "");
      this.forgotPassword =
          sp.getBool(AppConstants.USER_DATA_FORGOT_PASSWORD) ?? false;
      this.logoutReason = sp.getString(AppConstants.USER_DATA_LOGOUT_REASON);
      var userDataLatUser =
          sp.getString(AppConstants.USER_DATA_EXPIRES_AT) ?? "";
      this.lastUser = int.tryParse(_decryptValue(userDataLatUser) ?? "");
      this.isRegistered =
          sp.getBool(AppConstants.USER_DATA_IS_REGISTERED) ?? false;
      this.hasSeenAppInfo =
          sp.getBool(AppConstants.USER_DATA_APP_INFO) ?? false;
      this.fcmToken =
          _decryptValue(sp.getString(AppConstants.USER_DATA_FCM_TOKEN));
      this.password =
          _decryptValue(sp.getString(AppConstants.USER_DATA_PASSWORD));
    });
  }

  void clear() {
    this._getSharedPreferences()?.then((sp) {
      this.clearProperties();
      sp.clear();
    });
  }

  void clearWithCallback(Function callback) {
    this._getSharedPreferences()?.then((sp) {
      sp.clear().then((onValue) {
        this.clearProperties();
        callback();
      });
    });
  }

  void clearProperties() {
    this.id = null;
    this.forgotPassword = null;
    this.name = null;
    this.phone = null;
    this.email = null;
    this.photo = null;
    this.token = null;
    this.expiresAt = null;
    this.logoutReason = null;
    this.lastUser = null;
    this.isRegistered = null;
    this.fcmToken = null;
    this.password = null;
  }

  Future<void>? save() {
    return this._getSharedPreferences()?.then((sp) {
      sp.setString(AppConstants.USER_DATA_ID, _encryptValue(this.id) ?? "");
      sp.setString(AppConstants.USER_DATA_NAME, _encryptValue(this.name) ?? "");
      sp.setString(
          AppConstants.USER_DATA_PHONE, _encryptValue(this.phone) ?? "");
      sp.setString(
          AppConstants.USER_DATA_EMAIL, _encryptValue(this.email) ?? "");
      sp.setString(
          AppConstants.USER_DATA_PHOTO, _encryptValue(this.photo) ?? "");
      sp.setBool(
          AppConstants.USER_DATA_FORGOT_PASSWORD, this.forgotPassword ?? false);
      sp.setString(
          AppConstants.USER_DATA_TOKEN, _encryptValue(this.token) ?? "");
      sp.setString(AppConstants.USER_DATA_EXPIRES_AT,
          _encryptValue(this.expiresAt) ?? "");
      sp.setString(AppConstants.USER_DATA_LOGOUT_REASON,
          _encryptValue(this.logoutReason) ?? "");
      sp.setString(
          AppConstants.USER_DATA_LAST_USER, _encryptValue(this.lastUser) ?? "");
      sp.setBool(
          AppConstants.USER_DATA_IS_REGISTERED, this.isRegistered ?? false);
      sp.setBool(AppConstants.USER_DATA_APP_INFO, this.hasSeenAppInfo ?? false);
      sp.setString(
          AppConstants.USER_DATA_FCM_TOKEN, _encryptValue(this.fcmToken) ?? "");
      sp.setString(
          AppConstants.USER_DATA_PASSWORD, _encryptValue(this.password) ?? "");
    });
  }

  String? _encryptValue(Object? value) {
    return _encrypter?.encrypt("$value");
  }

  String? _decryptValue(Object? value, {type: String}) {
    var result = _encrypter?.decrypt("$value");
    if (type == "integer" && (result == null || result == "null")) {
      result = "0";
    }

    if (result == "null") {
      result = null;
    }

    return result;
  }

  bool forcedLogout() {
    return this.logoutReason == "privacy" && this.lastUser == this.id;
  }

  Future<SharedPreferences>? _getSharedPreferences() async {
    return SharedPreferences.getInstance();
  }
}
