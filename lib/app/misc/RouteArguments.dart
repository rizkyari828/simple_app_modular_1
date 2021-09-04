class RouteArguments {
  String? contentDescription,
      contentImage,
      contentTitle,
      type,
      from,
      id,
      vin,
      date;
  dynamic extras = {};

  RouteArguments(
      {this.contentDescription,
      this.contentImage,
      this.contentTitle,
      this.type,
      this.from,
      this.id,
      this.extras,
      this.vin,
      this.date});
}
