class DSSizes {
  static const double xxs = 2;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 32;
  static const double xl = 64;
  static const double xxl = 128;

  // Radius tokens (mirroring the React design-system scale).
  static const double radiusSm = 4.0;
  static const double radiusMd = 8.0;
  static const double radiusLg = 16.0;
  // Flutter can't express an infinite radius; a large finite value with
  // BorderRadius.circular yields the pill shape used by the React tokens.
  static const double radiusPill = 9999.0;
}
