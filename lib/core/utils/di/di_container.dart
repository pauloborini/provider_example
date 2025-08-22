import 'dart:async';

class DiContainer {
  DiContainer()
      : _instances = {},
        _factories = {};

  final Map<Type, dynamic> _instances;
  final Map<Type, Function> _factories;

  void add<T>(T instance) {
    _instances[T] = instance;
  }

  void addFactory<T>(T Function() factory) {
    _factories[T] = factory;
  }

  T get<T>() {
    if (_instances.containsKey(T)) {
      return _instances[T] as T;
    }

    if (_factories.containsKey(T)) {
      return (_factories[T]!() as T);
    }

    throw Exception('Serviço $T não encontrado no container');
  }

  Future<void> dispose() async {
    for (final instance in _instances.values) {
      if (instance is Disposable) {
        await instance.dispose();
      }
    }
    _instances.clear();
    _factories.clear();
  }
}

abstract class Disposable {
  FutureOr<void> dispose();
}
