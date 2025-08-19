import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DecoProvider extends ChangeNotifier {
  int? _selHead;
  int? _selFace;
  int? _selShirt;
  int? _selPants;

  // Getters
  int? get selHead => _selHead;
  int? get selFace => _selFace;
  int? get selShirt => _selShirt;
  int? get selPants => _selPants;

  // 시작할 때 저장된 값들 불러오기
  Future<void> loadSelectedItems() async {
    final prefs = await SharedPreferences.getInstance();

    _selHead = prefs.getInt('selHead');
    _selFace = prefs.getInt('selFace');
    _selShirt = prefs.getInt('selShirt');
    _selPants = prefs.getInt('selPants');

    notifyListeners();
  }

  // Head 아이템 선택
  Future<void> setSelHead(int? value) async {
    _selHead = value;
    await _saveToPrefs('selHead', value);
    notifyListeners();
  }

  // Face 아이템 선택
  Future<void> setSelFace(int? value) async {
    _selFace = value;
    await _saveToPrefs('selFace', value);
    notifyListeners();
  }

  // Shirt 아이템 선택
  Future<void> setSelShirt(int? value) async {
    _selShirt = value;
    await _saveToPrefs('selShirt', value);
    notifyListeners();
  }

  // Pants 아이템 선택
  Future<void> setSelPants(int? value) async {
    _selPants = value;
    await _saveToPrefs('selPants', value);
    notifyListeners();
  }

  // SharedPreferences에 저장
  Future<void> _saveToPrefs(String key, int? value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value == null) {
      await prefs.remove(key);
    } else {
      await prefs.setInt(key, value);
    }
  }

  // 모든 선택 초기화
  Future<void> clearAllSelections() async {
    _selHead = null;
    _selFace = null;
    _selShirt = null;
    _selPants = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('selHead');
    await prefs.remove('selFace');
    await prefs.remove('selShirt');
    await prefs.remove('selPants');

    notifyListeners();
  }
}
