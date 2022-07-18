import 'package:disticapp/models/tiket_model.dart';
import 'package:disticapp/services/tiket_service.dart';
import 'package:flutter/cupertino.dart';

class TiketProvider with ChangeNotifier {
  List<TiketModel> _tikets = [];
  List<TiketModel> get tikets => _tikets;

  set tikets(List<TiketModel> tikets) {
    _tikets = tikets;
    notifyListeners();
  }

  Future<void> getTikets() async {
    try {
      List<TiketModel> tikets = await TiketService().getTiket();
      _tikets = tikets;
    } catch (e) {
      print(e);
    }
  }
}
