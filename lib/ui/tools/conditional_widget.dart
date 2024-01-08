import 'package:flutter/material.dart';

class If extends StatelessWidget {
  const If({
    super.key,
    required this.builder,
    required this.condition,
    this.replacement = const SizedBox.shrink(),
  });

  final bool condition;
  final Widget Function(BuildContext context, bool value) builder;
  final Widget replacement;

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return builder(context, condition);
    }

    return replacement;
  }
}

class IfNotNull<T> extends StatelessWidget {
  const IfNotNull({
    super.key,
    required this.value,
    required this.builder,
    this.condition,
    this.replacement = const SizedBox.shrink(),
  });

  final T? value;
  final bool Function(T value)? condition;
  final Widget Function(BuildContext context, T value) builder;
  final Widget replacement;

  @override
  Widget build(BuildContext context) {
    if (value != null) {
      if ((condition?.call(value as T) ?? true)) {
        return builder(context, value as T);
      }
    }
    return replacement;
  }
}

typedef Wrapper = Widget Function(Widget child);

class ConditionalWrap extends StatelessWidget {
  const ConditionalWrap({
    super.key,
    required this.condition,
    required this.wrapper,
    this.fallback,
    required this.child,
  });

  final bool condition;

  final Wrapper wrapper;

  final Wrapper? fallback;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return wrapper(child);
    } else if (fallback != null) {
      return fallback!(child);
    } else {
      return child;
    }
  }
}
