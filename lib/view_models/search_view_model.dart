import 'package:flutter/material.dart';
import '../services/api/building_api.dart';
import '../services/storage/local_storage.dart';
import '../models/search_building_model.dart';

class SearchViewModel with ChangeNotifier {
  final BuildingApi buildingApi = BuildingApi();
  final LocalStorage localStorage = LocalStorage();

  List<Content> searchedBuilding = [];
  List<Content> filteredSearchBuilding = [];
  List searchHistory = [];
  List listFilter = [];
  String? searched;

  SearchViewState _state = SearchViewState.none;
  SearchViewState get state => _state;

  SearchViewModel() {
    _init();
  }

  void _init() async {
    List? data = await localStorage.getSearchHistory();
    if (data != null) {
      searchHistory = data;
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
      } else {
        listFilter.add(filter);
      }
    }

    filteredSearchBuilding.clear();
    for (var element in listFilter) {
      filteredSearchBuilding
          .addAll(searchedBuilding.where((e) => e.complex!.city == element));
    }

    if (listFilter.isEmpty) {
      filteredSearchBuilding.addAll(searchedBuilding);
    }

    notifyListeners();
  }

  retrieveSearchedBuildings(String value) async {
    changeState(SearchViewState.loading);

    final List<Content> response = await buildingApi.postSearchBuildings(value);

    if (response.isNotEmpty) {
      searchedBuilding = response;
      filteredSearchBuilding.clear();
      filteredSearchBuilding.addAll(searchedBuilding);

      notifyListeners();
      changeState(SearchViewState.none);
      return true;
    } else {
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
