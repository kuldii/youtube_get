import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpStateful {
  String id, fullname, email, avatar;

  HttpStateful({this.avatar, this.email, this.fullname, this.id});

  static Future<HttpStateful> connectAPI(String id) async {
    Uri url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilResponse = await http.get(url);

    var data = (json.decode(hasilResponse.body))["data"];

    print(data);

    return HttpStateful(
      id: data["id"].toString(),
      fullname: data["first_name"] + " " + data["last_name"],
      avatar: data["avatar"],
      email: data["email"],
    );
  }
}
