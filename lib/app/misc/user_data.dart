import 'package:clean_arc_flutter/app/misc/constants.dart';
import 'package:clean_arc_flutter/data/infrastructures/encrypter_interface.dart';
import 'package:clean_arc_flutter/domains/entities/user.dart';
import 'package:clean_arc_flutter/domains/entities/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  // basic profile
  int id;
  String name;
  String phone;
  String email;
  String photo;

  // profilenew
  String nama;
  String alamat;
  String pekerjaan;

  // token
  String token;
  int expiresAt;

  // misc
  bool forgotPassword;
  bool isRegistered;
  String password;
  String logoutReason;
  int lastUser;
  bool hasSeenAppInfo;
  String fcmToken;

  EncrypterInterface _encrypter;

  UserData(this._encrypter) {
    this.loadData();
  }

  void fromProfileNew(ProfileNew profile) {
    this.nama = profile.name;
    this.alamat = profile.alamat;
    this.pekerjaan = profile.pekerjaan;
  }

  void fromUser(User user) {
    this.id = user.id;
    this.name = user.profile.name;
    this.phone = user.profile.phone;
    this.email = user.profile.email;
    this.photo = user.profile.photo;

    if (user.token != null) {
      this.token = user.token.accessToken;
      this.expiresAt = user.token.expiresAt;
    }

    this.isRegistered = user.isRegistered;
  }

  void fromToken(Token token) {
    this.token = token.accessToken;
    this.expiresAt = token.expiresAt;
  }

  void loadData() {
    this._getSharedPreferences().then((sp) {
      this.nama = _decryptValue(sp.getString(AppConstants.USER_DATA_NAMA));
      this.alamat = _decryptValue(sp.getString(AppConstants.USER_DATA_ALAMAT));
      this.pekerjaan =
          _decryptValue(sp.getString(AppConstants.USER_DATA_PEKERJAAN));
      this.id = int.parse(_decryptValue(sp.getString(AppConstants.USER_DATA_ID),
          type: "integer"));
      this.name = _decryptValue(sp.getString(AppConstants.USER_DATA_NAME));
      this.phone = _decryptValue(sp.getString(AppConstants.USER_DATA_PHONE));
      this.email = _decryptValue(sp.getString(AppConstants.USER_DATA_EMAIL));
      this.photo = _decryptValue(sp.getString(AppConstants.USER_DATA_PHOTO));
      this.token = _decryptValue(sp.getString(AppConstants.USER_DATA_TOKEN));
      this.expiresAt = int.parse(_decryptValue(
          sp.getString(AppConstants.USER_DATA_EXPIRES_AT),
          type: "integer"));
      this.forgotPassword =
          sp.getBool(AppConstants.USER_DATA_FORGOT_PASSWORD) ?? false;
      this.logoutReason = sp.getString(AppConstants.USER_DATA_LOGOUT_REASON);
      this.lastUser = int.parse(_decryptValue(
          sp.getString(AppConstants.USER_DATA_LAST_USER),
          type: "integer"));
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
    this._getSharedPreferences().then((sp) {
      this.clearProperties();
      sp.clear();
    });
  }

  void clearWithCallback(Function callback) {
    this._getSharedPreferences().then((sp) {
      sp.clear().then((onValue) {
        this.clearProperties();
        callback();
      });
    });
  }

  void clearProperties() {
    this.nama = null;
    this.alamat = null;
    this.pekerjaan = null;
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

  Future<void> save() {
    return this._getSharedPreferences().then((sp) {
      sp.setString(AppConstants.USER_DATA_ID, _encryptValue(this.id));
      sp.setString(AppConstants.USER_DATA_NAMA, _encryptValue(this.nama));
      sp.setString(AppConstants.USER_DATA_ALAMAT, _encryptValue(this.alamat));
      sp.setString(AppConstants.USER_DATA_PEKERJAAN, _encryptValue(this.pekerjaan));
      sp.setString(AppConstants.USER_DATA_NAME, _encryptValue(this.name));
      sp.setString(AppConstants.USER_DATA_PHONE, _encryptValue(this.phone));
      sp.setString(AppConstants.USER_DATA_EMAIL, _encryptValue(this.email));
      sp.setString(AppConstants.USER_DATA_PHOTO, _encryptValue(this.photo));
      sp.setBool(AppConstants.USER_DATA_FORGOT_PASSWORD, this.forgotPassword);
      sp.setString(AppConstants.USER_DATA_TOKEN, _encryptValue(this.token));
      sp.setString(
          AppConstants.USER_DATA_EXPIRES_AT, _encryptValue(this.expiresAt));
      sp.setString(AppConstants.USER_DATA_LOGOUT_REASON,
          _encryptValue(this.logoutReason));
      sp.setString(
          AppConstants.USER_DATA_LAST_USER, _encryptValue(this.lastUser));
      sp.setBool(AppConstants.USER_DATA_IS_REGISTERED, this.isRegistered);
      sp.setBool(AppConstants.USER_DATA_APP_INFO, this.hasSeenAppInfo);
      sp.setString(
          AppConstants.USER_DATA_FCM_TOKEN, _encryptValue(this.fcmToken));
      sp.setString(
          AppConstants.USER_DATA_PASSWORD, _encryptValue(this.password));
    });
  }

  String _encryptValue(Object value) {
    return _encrypter.encrypt("$value");
  }

  String _decryptValue(Object value, {type: String}) {
    var result = _encrypter.decrypt("$value");
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

  Future<SharedPreferences> _getSharedPreferences() async {
    return SharedPreferences.getInstance();
  }
}
