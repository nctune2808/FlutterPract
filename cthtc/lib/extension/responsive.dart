import 'package:flutter/material.dart';

extension Responsive on BuildContext {
  T responsive<T>({
    required T df,
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= 1440
        ? (xl ?? lg ?? md ?? sm ?? df)
        : wd >= 1100
            ? (lg ?? md ?? sm ?? df)
            : wd >= 650
                ? (md ?? sm ?? df)
                : wd > 450
                    ? (sm ?? df)
                    : df;
  }
}
