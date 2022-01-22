import "package:http/http.dart" as http;
import "dart:convert";
import "package:intl/intl.dart";

class WorldTime {
  String location; //loaction name for the UI
  late String time; //the time in that loaction
  String flag; //url to an asset flag icon
  String url;
  bool? isDayTime; //loaction url for an api endpoint

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    // make request
    try {
      http.Response response = await http
          .get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map<String, dynamic> data = jsonDecode(response.body);
      // print(data);

      String datetime = data['utc_datetime'];
      // ignore: unused_local_variable
      String offset = data['utc_offset'].substring(1, 3);
      // create a datetime object
      DateTime now = DateTime.parse(datetime);

      // ignore: avoid_print
      now = now.add(Duration(hours: int.parse(offset)));
      // set the time property
      // time = now.toString();
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      time = "could not get time";
    }
  }
}
