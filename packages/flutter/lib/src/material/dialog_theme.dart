// Copyright 2014 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui' show lerpDouble;

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import 'theme.dart';

/// Defines a theme for [Dialog] widgets.
///
/// Descendant widgets obtain the current [DialogTheme] object using
/// `DialogTheme.of(context)`. Instances of [DialogTheme] can be customized with
/// [DialogTheme.copyWith].
///
/// [titleTextStyle] and [contentTextStyle] are used in [AlertDialog]s and [SimpleDialog]s.
///
/// See also:
///
///  * [Dialog], a dialog that can be customized using this [DialogTheme].
///  * [AlertDialog], a dialog that can be customized using this [DialogTheme].
///  * [SimpleDialog], a dialog that can be customized using this [DialogTheme].
///  * [ThemeData], which describes the overall theme information for the
///    application.
@immutable
class DialogTheme with Diagnosticable {
  /// Creates a dialog theme that can be used for [ThemeData.dialogTheme].
  const DialogTheme({
    this.backgroundColor,
    this.elevation,
    this.shape,
    this.alignment,
    this.titleTextStyle,
    this.contentTextStyle,
  });

  /// Overrides the default value for [Dialog.backgroundColor].
  final Color? backgroundColor;

  /// Overrides the default value for [Dialog.elevation].
  final double? elevation;

  /// Overrides the default value for [Dialog.shape].
  final ShapeBorder? shape;

  /// Overrides the default value for [Dialog.alignment].
  final AlignmentGeometry? alignment;

  /// Overrides the default value for [DefaultTextStyle] for [SimpleDialog.title] and
  /// [AlertDialog.title].
  final TextStyle? titleTextStyle;

  /// Overrides the default value for [DefaultTextStyle] for [SimpleDialog.children] and
  /// [AlertDialog.content].
  final TextStyle? contentTextStyle;

  /// Creates a copy of this object but with the given fields replaced with the
  /// new values.
  DialogTheme copyWith({
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    AlignmentGeometry? alignment,
    TextStyle? titleTextStyle,
    TextStyle? contentTextStyle,
  }) {
    return DialogTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      elevation: elevation ?? this.elevation,
      shape: shape ?? this.shape,
      alignment: alignment ?? this.alignment,
      titleTextStyle: titleTextStyle ?? this.titleTextStyle,
      contentTextStyle: contentTextStyle ?? this.contentTextStyle,
    );
  }

  /// The data from the closest [DialogTheme] instance given the build context.
  static DialogTheme of(BuildContext context) {
    return Theme.of(context).dialogTheme;
  }

  /// Linearly interpolate between two dialog themes.
  ///
  /// The arguments must not be null.
  ///
  /// {@macro dart.ui.shadow.lerp}
  static DialogTheme lerp(DialogTheme? a, DialogTheme? b, double t) {
    assert(t != null);
    return DialogTheme(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      elevation: lerpDouble(a?.elevation, b?.elevation, t),
      shape: ShapeBorder.lerp(a?.shape, b?.shape, t),
      alignment: AlignmentGeometry.lerp(a?.alignment, b?.alignment, t),
      titleTextStyle: TextStyle.lerp(a?.titleTextStyle, b?.titleTextStyle, t),
      contentTextStyle: TextStyle.lerp(a?.contentTextStyle, b?.contentTextStyle, t),
    );
  }

  @override
  int get hashCode => shape.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is DialogTheme
        && other.backgroundColor == backgroundColor
        && other.elevation == elevation
        && other.shape == shape
        && other.alignment == alignment
        && other.titleTextStyle == titleTextStyle
        && other.contentTextStyle == contentTextStyle;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('backgroundColor', backgroundColor));
    properties.add(DoubleProperty('elevation', elevation));
    properties.add(DiagnosticsProperty<ShapeBorder>('shape', shape, defaultValue: null));
    properties.add(DiagnosticsProperty<AlignmentGeometry>('alignment', alignment, defaultValue: null));
    properties.add(DiagnosticsProperty<TextStyle>('titleTextStyle', titleTextStyle, defaultValue: null));
    properties.add(DiagnosticsProperty<TextStyle>('contentTextStyle', contentTextStyle, defaultValue: null));
  }
}
