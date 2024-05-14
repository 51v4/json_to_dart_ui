import 'package:flutter/material.dart';

import 'package:json_editor/json_editor.dart';
import 'package:stacked/stacked.dart';

import '../../../common/app_colors.dart';
import '../../../common/ui_helpers.dart';
import '../../../widgets/button.dart';
import '../home_viewmodel.dart';

class InputFormWidget extends ViewModelWidget<HomeViewModel> {
  const InputFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(5),
          ),
          child: JsonEditorTheme(
            themeData: JsonEditorThemeData(
              lightTheme: JsonTheme.dark(),
            ),
            child: JsonEditor.string(
              jsonString: "",
              onValueChanged: (value) {
                viewModel.setJson(value);
              },
              enabled: true,
            ),
          ),
        ),
        verticalSpaceSmall,
        TextField(
          style: const TextStyle(
            color: Colors.white,
          ),
          cursorColor: Palette.primary,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5),
            ),
            fillColor: Colors.white12,
            filled: true,
            isDense: true,
            hintText: "Your dart class name goes here",
            hintStyle: const TextStyle(
              color: Colors.white30,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
          ),
          onChanged: (value) {
            viewModel.setClassName(value);
          },
        ),
        verticalSpaceSmall,
        PrimaryButton(
          onPressed: () {
            viewModel.generateDart();
          },
          padding: const EdgeInsets.symmetric(horizontal: 30),
          label: "Generate Dart",
        ),
      ],
    );
  }
}
