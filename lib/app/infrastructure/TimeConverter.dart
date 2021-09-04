import 'package:clean_arc_flutter/data/infrastructures/time_converter_interface.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;


class TimeConverter extends TimeConverterInterface {
  TimeConverter() {
    timeago.setLocaleMessages('id', timeago.IdMessages());
  }

  String toHumanReadable(DateTime tm) {
    return timeago.format(tm);
  }

  String toDateTimeString(String dateTime,
      {String format = 'd MMM yyyy', String lang = 'id'}) {
    try {
      var dt = DateTime.parse(dateTime);
      var formatter = new DateFormat(format, lang);
      return formatter.format(dt);
    } catch (_) {
      return '-';
    }
  }

  String toFormattedString(DateTime dt, {String? format, String? lang}) {
    var formatter = new DateFormat(format, lang);
    return formatter.format(dt);
  }
}
