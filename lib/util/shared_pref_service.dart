import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/model/baggage_mode.dart';

class SharedPreferencesService {
  static const String _baggagesKey = 'baggages';

  Future<void> saveBaggages(List<Baggage> baggages) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = baggages.map((baggage) => baggage.toJson()).toList();
    await prefs.setString(_baggagesKey, json.encode(jsonData));
  }

  Future<List<Baggage>> getBaggages() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = prefs.getString(_baggagesKey);
    if (jsonData == null) {
      return [];
    }
    final decodedData = json.decode(jsonData) as List<dynamic>;
    return decodedData.map((item) => Baggage.fromJson(item)).toList();
  }
}
