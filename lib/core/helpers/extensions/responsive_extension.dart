import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ResponsiveExtension on num {
  double get font {
    if (kIsWeb) {
      return toDouble();
    } else {
      if (Platform.isIOS || Platform.isAndroid) {
        return r;
      } else {
        return toDouble();
      }
    }
  }

  double get icon {
    if (kIsWeb) {
      return toDouble();
    } else {
      if (Platform.isIOS || Platform.isAndroid) {
        return r;
      } else {
        return toDouble();
      }
    }
  }

  double get height {
    if (kIsWeb) {
      return toDouble();
    } else {
      return h;
    }
  }

  double get width {
    if (kIsWeb) {
      return toDouble();
    } else {
      return w;
    }
  }

  double get adaptive {
    if (kIsWeb) {
      return toDouble();
    } else {
      return r;
    }
  }
}
