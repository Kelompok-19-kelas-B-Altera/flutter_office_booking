import 'package:flutter/material.dart';
import 'package:flutter_office_booking/services/api/building_api.dart';
import 'package:flutter_office_booking/models/search_building_model.dart';

import '../services/storage/local_storage.dart';

class SearchViewModel with ChangeNotifier {
  List<Content> searchedBuilding = [];
  List<Content> filteredSearchBuilding = [];
  List searchHistory = [];
  var listFilter = [];
  String? searched;

  SearchViewState _state = SearchViewState.none;
  SearchViewState get state => _state;

  SearchViewModel() {
    _init();
  }

  void _init() async {
    List? data = await LocalStorage.getSearchHistory();
    if (data != null) {
      searchHistory = data;
      print('pref');
      print(searchHistory[0]);
    }
  }

  changeState(SearchViewState s) {
    _state = s;
    notifyListeners();
  }

  addSearchHistory(String value) async {
    searchHistory.insert(0, value);
    await LocalStorage.setSearchHistory(searchHistory: searchHistory);
    notifyListeners();
  }

  deleteSearchHistory(int index) async {
    searchHistory.removeAt(index);
    await LocalStorage.setSearchHistory(searchHistory: searchHistory);
    notifyListeners();
  }

  filterBuilding(String filter) {
    if (filter == 'Reset') {
      listFilter.clear();
    } else {
      if (listFilter.contains(filter) == true) {
        listFilter.removeWhere((element) => element == filter);
        print(1);
      } else {
        listFilter.add(filter);
        print(2);
      }
    }

    filteredSearchBuilding.clear();
    for (var element in listFilter) {
      filteredSearchBuilding
          .addAll(searchedBuilding.where((e) => e.complex!.city == element));
    }

    if (listFilter.isEmpty) {
      filteredSearchBuilding.addAll(searchedBuilding);
      print(3);
    }

    notifyListeners();
  }

  retrieveSearchedBuildings(String value) async {
    changeState(SearchViewState.loading);
    try {
      final response = await BuildingApi.postSearchBuildings(value);

      searchedBuilding = response;
      filteredSearchBuilding.clear();
      filteredSearchBuilding.addAll(searchedBuilding);
      print(searchedBuilding.length);
      print(searchedBuilding[0].address);
      notifyListeners();
      changeState(SearchViewState.none);
      return true;
    } catch (e) {
      changeState(SearchViewState.error);
    }
  }

  double review(List<Reviews> reviewer) {
    var star1 = reviewer.where((element) => element.rating == 1).length;
    var star2 = reviewer.where((element) => element.rating == 2).length;
    var star3 = reviewer.where((element) => element.rating == 3).length;
    var star4 = reviewer.where((element) => element.rating == 4).length;
    var star5 = reviewer.where((element) => element.rating == 5).length;

    var review = (star1 * 1 + star2 * 2 + star3 * 3 + star4 * 4 + star5 * 5) /
        reviewer.length;

    reviewer.length;

    if (review.toString() != 'NaN') {
      return review;
    } else {
      return 0;
    }
  }
}

enum SearchViewState {
  none,
  loading,
  error,
  search,
}
