import 'package:flutter/material.dart';
import 'package:motels/core/utils/di/di_container.dart';

/// AppStore é uma classe base para gerenciamento de estado utilizando ChangeNotifier
/// Pode ser usada como factory (nova instância a cada uso) ou singleton (mesma instância)
/// dependendo de como é registrada no DiContainer
class AppStore extends ChangeNotifier implements Disposable {
  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  /// Define o estado de carregamento
  void setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  /// Define uma mensagem de erro
  void setError(String? message) {
    _errorMessage = message;
    notifyListeners();
  }

  /// Limpa erros
  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
