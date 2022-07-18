import 'dart:convert';
import 'dart:io';
import 'package:disticapp/models/tiket_model.dart';
import 'package:http/http.dart' as http;

class TiketService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<List<TiketModel>> getTiket() async {
    var url = '$baseUrl/tiket';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<TiketModel> tikets = [];

      for (var item in data) {
        tikets.add(TiketModel.fromJson(item));
      }

      return tikets;
    } else {
      throw Exception('Gagal Get Tiket');
    }
  }
}
