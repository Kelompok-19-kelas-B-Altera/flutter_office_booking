import 'package:flutter/material.dart';

class SearchViewModel with ChangeNotifier {
  SearchViewState _state = SearchViewState.none;
  SearchViewState get state => _state;

  changeState(SearchViewState s) {
    _state = s;
    notifyListeners();
  }
}

enum SearchViewState {
  none,
  loading,
  error,
}
