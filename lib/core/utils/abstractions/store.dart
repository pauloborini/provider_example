import 'package:flutter/material.dart';
import 'package:motels/core/utils/di/di_container.dart';

class AppStore extends ChangeNotifier implements Disposable {
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  void setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
