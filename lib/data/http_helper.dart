// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'package:time_to_run/data/weather.dart';

// class HttpHelper {
//   //https://api.openweathermap.org/data/2.5/weather?q=London&appid=6aa7729c368e3736fbc29b80532e9329
//   final String authority = 'api.openweathermap.org';
//   final String path = 'data/2.5/weather';
//   final String apiKey = '6aa7729c368e3736fbc29b80532e9329';

//   Future<Weather> getWeather(String location) async {
//     Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
//     Uri uri = Uri.https(authority, path, parameters);
//     http.Response result = await http.get(uri);

//     Map<String, dynamic> data = json.decode(result.body);
//     Weather weather = Weather.fromJson(data);

//     return weather;
//   }
// }
