import 'package:flutter/material.dart';
import 'package:motels/app_exports.dart';

class HomeViewModel extends ChangeNotifier {
  final MotelService _motelService;

  HomeViewModel({required MotelService motelService}) : _motelService = motelService;

  final List<String> itemsFilter = FilterDatabase.itemsFilter;
  final List<String> favoriteTempList = [];
  final pageController = PageController();
  int _selectedIndex = 0;
  String _selectedCity = 'São Paulo'.toLowerCase();
  final List<String> _selectedFilter = [];
  ValueNotifier<bool> screenLoaded = ValueNotifier(false);

  ///Aqui na verdade, eu usaria DateTime, coloquei String para agilizar
  String _selectedFinalDate = '11 fev';
  String _selectedInitialDate = '10 fev';

  List<String> get selectedFilter => _selectedFilter;

  int get selectedIndex => _selectedIndex;

  String get selectedInitialDate => _selectedInitialDate;

  String get selectedFinalDate => _selectedFinalDate;

  String get selectedCity => _selectedCity;

  Future<void> setupConfigs() async {
    screenLoaded.value = false;
    await _motelService.fetchMotels();
    screenLoaded.value = true;
    notifyListeners();
  }

  Future<void> fetchMotels() async {
    await _motelService.fetchMotels();
    notifyListeners();
  }

  void toggleTempFavorite(String motelId) {
    if (favoriteTempList.contains(motelId)) {
      favoriteTempList.remove(motelId);
    } else {
      favoriteTempList.add(motelId);
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
