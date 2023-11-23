import 'package:flutter/material.dart';
import 'package:my_habit_app/model/data_model.dart';

class SearchProvider with ChangeNotifier {
  String _search = '';
  List<HabitModel> searchedlist = [];

  String get search => _search;

  void setSearch(String value) {
    _search = value;
    notifyListeners();
  }

  void searchResult(value) {
    searchedlist = value
        .where((incomingModel) =>
            incomingModel.habit.toLowerCase().contains(search.toLowerCase()))
        .toList();
    notifyListeners();
  }
}