// Project imports:
import 'package:animated_loading_indicators/animated_loading_indicators.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:library_books/helper/color_constants.dart';



class CustomLoader {
  static CustomLoader? _loader;

  CustomLoader._createObject();

  factory CustomLoader() {
    if (_loader != null) {
      return _loader!;
    } else {
      _loader = CustomLoader._createObject();
      return _loader!;
    }
  }

  OverlayState? _overlayState;
  OverlayEntry? _overlayEntry;

  _buildLoader() {
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              child: buildLoader(),
              color: Colors.black.withOpacity(.3),
            )
          ],
        );
      },
    );
  }

  show() {
    _overlayState = Overlay.of(Get.context!);
    _buildLoader();
    _overlayState!.insert(_overlayEntry!);
  }

  hide() {
    try {
      if (_overlayEntry != null) {
        _overlayEntry!.remove();
        _overlayEntry = null;
      }
    } catch (_) {}
  }

  buildLoader({isTransparent = false}) {
    return Center(
      child: Container(
        color: isTransparent ? Colors.transparent : Colors.transparent,
        child: const UpDownLoader(
          size: 5,
          firstColor: appColor,
          secondColor: Colors.white,
        ), //CircularProgressIndicator(),
      ),
    );
  }
}
