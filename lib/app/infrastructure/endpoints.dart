class Endpoints {
  String baseUrl;

  Endpoints(this.baseUrl);

  String login() {
    return '/auth/login';
  }

  String register() {
    return '/auth/register';
  }

  String otp() {
    return '/auth/otp';
  }

  String resendOTP() {
    return '/auth/resend-otp';
  }

  String forgotPassword() {
    return '/auth/forgot-password';
  }

  String verifyUser() {
    return '/auth/verify';
  }

  String news() {
    return '/banners';
  }

  String trainingCategories({String id = ""}) {
    if (id.isNotEmpty) {
      return '/training-categories/$id';
    }
    return '/training-categories';
  }

  String trainingMaterials({String? id}) {
    if (id != null && id.isNotEmpty) {
      return '/training-materials/$id';
    }
    return '/training-materials';
  }

  String guideCategories({String id = ""}) {
    if (id.isNotEmpty) {
      return '/guide-categories/$id';
    }
    return '/guide-categories';
  }

  String guideMaterials({String? id}) {
    if (id != null && id.isNotEmpty) {
      return '/guide-materials/$id';
    }
    return '/guide-materials';
  }

  String recommendations() {
    return '/recommendations';
  }

  String static(String name) {
    return '/static/$name';
  }

  String additionalInfo() {
    return '/additional-info';
  }

  String appVersion() {
    return '/app-info/version';
  }

  String updateCounter() {
    return '/counters';
  }

  String presence() {
    return '/analytics/presence';
  }

  String updateMaterial(int id) {
    return '/materials/$id/update';
  }

  String bulletins({int id = 0}) {
    if (id != 0) {
      return '/bulletins/$id';
    }
    return '/bulletins';
  }

  String notifications() {
    return '/notifications';
  }

  String deleteNotifications() {
    return '/notifications/delete';
  }

  String userBy(String salesCode) {
    return '/users?sales_code=$salesCode';
  }

  String user() {
    return '/me';
  }

  String notificationStatus() {
    return '/me/check-notification';
  }

  String uploadPhoto() {
    return '/me/upload-photo';
  }

  String updateFirebaseToken() {
    return '/me/firebase-token';
  }

  String logOut() {
    return '/me/logout';
  }

  String changePassword() {
    return '/setting/reset-password';
  }

  String verifyByPassword() {
    return '/setting/verify';
  }

  String verifyOtpForUpdate() {
    return '/setting/verify-otp';
  }

  String triggerOTP() {
    return '/setting/request-otp';
  }

  String changeEmailPhone() {
    return '/setting/change-email-phone';
  }

  String faq() {
    return '/faqs';
  }

  String historyReport() {
    return '/pkt/history';
  }

  String historyReportFleet() {
    return '/pkt/fleet/history';
  }

  String spkTracking() {
    return '/pkt/SPK';
  }

  String pktVerify() {
    return '/pkt/verify-vin';
  }

  String listPdi() {
    return '/pkt/pdilist';
  }

  String listWarranty() {
    return '/pkt/warrantylist';
  }

  String listPdiFleet() {
    return '/pkt/fleet/pdilist';
  }

  String listWarrantyFleet() {
    return '/pkt/fleet/warrantylist';
  }

  String cekPDI() {
    return '/pkt/verify-pdi';
  }

  String saveDraftPKT() {
    return '/pkt/report';
  }

  String deleteDraftPKT() {
    return '/pkt/delete';
  }

  String savePkt() {
    return '/pkt/report';
  }

  String savePktFleet() {
    return '/pkt/fleet/report';
  }
}
