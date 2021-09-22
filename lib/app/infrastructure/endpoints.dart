class Endpoints {
  String baseUrl;

  Endpoints(this.baseUrl);

  String login() {
    return '/login';
  }


  String user() {
    return '/me';
  }

  String logOut() {
    return '/me/logout';
  }

}
