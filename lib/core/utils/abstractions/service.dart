import 'package:flutter/material.dart';
import 'package:motels/core/utils/di/di_container.dart';

class AppService extends ChangeNotifier implements Disposable {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
