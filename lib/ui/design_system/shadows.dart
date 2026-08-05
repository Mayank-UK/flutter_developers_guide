import 'package:flutter/material.dart';

/// Layered slate-tinted shadows mirroring the React design-system tokens.
///
/// Each field is a [List<BoxShadow>] so the layered CSS shadows from the
/// React tokens translate directly. Shadow tint is slate (`0xFF0F172A`)
/// with varying alpha, matching the React reference.
class DSShadows {
  static const Color _slate = Color(0xFF0F172A);

  /// `0 1px 2px rgba(15,23,42,.06), 0 1px 3px rgba(15,23,42,.1)`
  static final List<BoxShadow> buttonCard = [
    BoxShadow(
      color: _slate.withValues(alpha: 0.06),
      blurRadius: 2,
      offset: const Offset(0, 1),
    ),
    BoxShadow(
      color: _slate.withValues(alpha: 0.10),
      blurRadius: 3,
      offset: const Offset(0, 1),
    ),
  ];

  /// `0 4px 8px rgba(15,23,42,.08), 0 2px 4px rgba(15,23,42,.06)`
  static final List<BoxShadow> buttonCardHover = [
    BoxShadow(
      color: _slate.withValues(alpha: 0.08),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
    BoxShadow(
      color: _slate.withValues(alpha: 0.06),
      blurRadius: 4,
      offset: const Offset(0, 2),
    ),
  ];

  /// React: `0 10px 15px -3px rgba(15,23,42,.1), 0 4px 6px rgba(15,23,42,.05)`.
  /// Negative blur is invalid in Flutter — approximated with positive blurs.
  static final List<BoxShadow> drawer = [
    BoxShadow(
      color: _slate.withValues(alpha: 0.10),
      blurRadius: 12,
      offset: const Offset(0, 10),
    ),
    BoxShadow(
      color: _slate.withValues(alpha: 0.05),
      blurRadius: 6,
      offset: const Offset(0, 4),
    ),
  ];

  /// React: `0 20px 25px -5px rgba(15,23,42,.1), 0 8px 10px rgba(15,23,42,.04)`.
  static final List<BoxShadow> modal = [
    BoxShadow(
      color: _slate.withValues(alpha: 0.10),
      blurRadius: 25,
      offset: const Offset(0, 20),
    ),
    BoxShadow(
      color: _slate.withValues(alpha: 0.04),
      blurRadius: 10,
      offset: const Offset(0, 8),
    ),
  ];
}
