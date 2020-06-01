import 'package:flutter/widgets.dart';

class Produto {
  int cod;
  int pallet;
  int lastro;
  int cx;
  int un;

  /// The [cod] argument must not be null.
  Produto({@required this.cod, this.pallet, this.lastro, this.cx, this.un})
      : assert(cod != null && cod > 0) {
    if (pallet == null) pallet = 0;
    if (lastro == null) lastro = 0;
    if (cx == null) cx = 0;
    if (un == null) un = 0;
  }

  Map<String, dynamic> toMap() {
    return {
      'cod': cod,
      'pallet': pallet,
      'lastro': lastro,
      'cx': cx,
      'un': un,
    };
  }

  @override
  String toString() {
    return 'Produto{cod: $cod, pallet: $pallet, lastro: $lastro, cx: $cx, un: $un}';
  }

  void addQt({
    String pallet,
    String lastro,
    String cx,
    String un,
  }) {
    if (_validaNonNull(pallet)) {
      this.pallet += int.parse(pallet);
    }
    if (_validaNonNull(lastro)) {
      this.lastro += int.parse(lastro);
    }
    if (_validaNonNull(cx)) {
      this.cx += int.parse(cx);
    }
    if (_validaNonNull(un)) {
      this.un += int.parse(un);
    }
  }

  bool _validaNonNull(String value) {
    if (value != null && value != "") {
      return int.parse(value) > 0;
    }
    return false;
  }
}
