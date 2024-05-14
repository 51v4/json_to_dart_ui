import 'package:flutter/foundation.dart';

import 'package:json_editor/json_editor.dart';
import 'package:json_to_dart/json_to_dart.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class HomeViewModel extends BaseViewModel {
  final snackbarService = locator<SnackbarService>();
  JsonElement? data;
  String? className;
  String? convertedCode;

  void setJson(JsonElement value) {
    data = value;
    notifyListeners();
  }

  void setClassName(String value) {
    className = value;
    notifyListeners();
  }

  void generateDart() {
    if (data?.value != null) {
      try {
        String dataStr = data!.value.toString();
        if (data!.valueType == JsonElementValueType.map &&
            data!.value is List) {
          if (dataStr.isNotEmpty) {
            dataStr = "{${dataStr.substring(1, dataStr.length - 1)}}";
          }
        }

        debugPrint("Data String: $dataStr");
        final classGenerator = ModelGenerator(className ?? "Autogenerated");
        var dartCode = classGenerator.generateDartClasses(dataStr);
        convertedCode = dartCode.code;
        notifyListeners();
      } catch (e) {
        debugPrint("$e");
        snackbarService.showSnackbar(
          title: "Error",
          message:
              "Cannot generate dart code. Please check the JSON and try again.",
          duration: const Duration(seconds: 3),
        );
      }
    }
  }
}
