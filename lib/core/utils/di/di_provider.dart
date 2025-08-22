import 'package:flutter/material.dart';
import 'package:motels/core/utils/di/di_container.dart';

class DiProvider extends StatefulWidget {
  final DiContainer container;
  final Widget child;

  const DiProvider({
    super.key,
    required this.container,
    required this.child,
  });

  @override
  State<DiProvider> createState() => _DiProviderState();
}

class _DiProviderState extends State<DiProvider> {
  @override
  void dispose() {
    widget.container.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _DiProviderScope(
      container: widget.container,
      child: widget.child,
    );
  }
}

class _DiProviderScope extends InheritedWidget {
  final DiContainer container;

  const _DiProviderScope({
    required this.container,
    required super.child,
  });

  @override
  bool updateShouldNotify(_DiProviderScope oldWidget) => false;

  static _DiProviderScope? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_DiProviderScope>();
  }
}

extension DiProviderExtension on BuildContext {
  T di<T>() {
    final scope = _DiProviderScope.of(this);
    if (scope == null) {
      throw Exception('DiProvider não encontrado na árvore de widgets');
    }
    return scope.container.get<T>();
  }

  DiContainer get diContainer {
    final scope = _DiProviderScope.of(this);
    if (scope == null) {
      throw Exception('DiProvider não encontrado na árvore de widgets');
    }
    return scope.container;
  }
}
