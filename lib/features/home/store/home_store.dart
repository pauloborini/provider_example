import 'package:flutter/material.dart';
import 'package:motels/core/database/filter_data.dart';
import 'package:motels/core/utils/abstractions/store.dart';
import 'package:motels/features/home/domain/entities/motel_entity.dart';
import 'package:motels/features/home/repository/home_repository.dart';

class HomeStore extends AppStore {
  final IHomeRepository _homeRepository;

  HomeStore({required IHomeRepository homeRepository}) : _homeRepository = homeRepository;

  final List<String> itemsFilter = FilterDatabase.itemsFilter;
  final List<String> favoriteTempList = [];
  final PageController pageController = PageController();

  int _selectedIndex = 0;
  String _selectedCity = 'São Paulo'.toLowerCase();
  final List<String> _selectedFilter = [];
  final ValueNotifier<bool> screenLoaded = ValueNotifier(false);
  final List<MotelEntity> _motelList = [];
  String _selectedFinalDate = '11 fev';
  String _selectedInitialDate = '10 fev';

  List<MotelEntity> get motelList => _motelList;
  List<String> get selectedFilter => _selectedFilter;
  int get selectedIndex => _selectedIndex;
  String get selectedInitialDate => _selectedInitialDate;
  String get selectedFinalDate => _selectedFinalDate;
  String get selectedCity => _selectedCity;

  Future<void> setupConfigs() async {
    await _refreshData();
  }

  Future<void> _refreshData() async {
    screenLoaded.value = false;
    _motelList.clear();

    final result = await _homeRepository.getMotels(
      page: 1,
      latitude: -23.5505,
      longitude: -46.6333,
    );

    result.when((error) {
      screenLoaded.value = true;
      setError(error.message);
      print(error.message);
    }, (motels) {
      clearError();
      _motelList.addAll(motels);
      screenLoaded.value = true;
    });

    notifyListeners();
  }

  void toggleTempFavorite(String motelName) {
    if (favoriteTempList.contains(motelName)) {
      favoriteTempList.remove(motelName);
    } else {
      favoriteTempList.add(motelName);
    }
    notifyListeners();
  }

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  void toggleFilter(String filter) {
    if (_selectedFilter.contains(filter)) {
      _selectedFilter.remove(filter);
    } else {
      _selectedFilter.add(filter);
    }
    notifyListeners();
  }

  void clearFilters() {
    _selectedFilter.clear();
    notifyListeners();
  }

  set selectedCity(String value) {
    _selectedCity = value;
    notifyListeners();
  }

  set selectedInitialDate(String value) {
    _selectedInitialDate = value;
    notifyListeners();
  }

  set selectedFinalDate(String value) {
    _selectedFinalDate = value;
    notifyListeners();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
