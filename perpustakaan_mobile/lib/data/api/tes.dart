import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:perpustakaan_mobile/data/model/tes.dart';

Future<Album> createAlbum(String title) async {
  final response = await http.post(
    Uri.parse('http://10.0.2.2:5000/perpustakaan'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
