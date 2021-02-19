import 'dart:convert';

String datetimeToString(String dt) {
  DateTime datetime = DateTime.parse(dt);
  String result = datetime.day.toString() + " " +  monthKeyToString(datetime.month.toString(), true).toLowerCase();
  return result;
}

String monthKeyToString(String key, bool conjugation) {
  var parsed = int.parse(key);

  if (parsed > 0 && parsed <= 12) {
    if (conjugation) {
      switch (parsed) {
        case 1:
          return "Января";
          break;
        case 2:
          return "Февраля";
          break;
        case 3:
          return "Марта";
          break;
        case 4:
          return "Апреля";
          break;
        case 5:
          return "Мая";
          break;
        case 6:
          return "Июня";
          break;
        case 7:
          return "Июля";
          break;
        case 8:
          return "Августа";
          break;
        case 9:
          return "Сентября";
          break;
        case 10:
          return "Октбяря";
          break;
        case 11:
          return "Ноября";
          break;
        case 12:
          return "Декабря";
          break;
        default:
          return "";
      }
    }
  } else {
    return "";
  }

  return "";
}
