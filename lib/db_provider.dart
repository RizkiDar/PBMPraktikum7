import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugaspraktikum7/db_helper.dart';
import 'main.dart';
import 'anggota.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _selectedTheme =
      ThemeData.dark().copyWith(primaryColor: Colors.black);

  ThemeData light = ThemeData.light().copyWith(primaryColor: Colors.blue);
  ThemeData dark = ThemeData.dark().copyWith(primaryColor: Colors.black);

  ThemeProvider({bool? isDarkMode}) {
    _selectedTheme = isDarkMode! ? dark : light;
  }

  Future<void> swapTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_selectedTheme == dark) {
      _selectedTheme = light;
      prefs.setBool("isDarkTheme", false);
    } else {
      _selectedTheme = dark;
      prefs.setBool("isDarkTheme", true);
    }
    notifyListeners();
  }

  ThemeData get getTheme => _selectedTheme;
}

class DbProvider extends ChangeNotifier {
  late DatabaseHelper _dbHelper;

  List<Anggota> _anggotas = [];

  List<Anggota> get anggotas => _anggotas;

  DbProvider() {
    _dbHelper = DatabaseHelper();
    _getAllAnggotas();
  }

  void _getAllAnggotas() async {
    _anggotas = await _dbHelper.getAnggotas();
    notifyListeners();
  }

  Future<void> addAnggotas(Anggota anggota) async {
    await _dbHelper.insertAnggota(anggota);
    _getAllAnggotas();
  }

  Future<void> deleteAnggotas(int id) async {
    await _dbHelper.deleteAnggota(id);
    _getAllAnggotas();
  }

  Future<void> updateAnggotas(Anggota anggota) async {
    await _dbHelper.updateAnggota(anggota);
    _getAllAnggotas();
  }
}
