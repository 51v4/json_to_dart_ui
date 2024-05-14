import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:selectable_code_view/sourceCodes/code_view_screen.dart';
import 'package:selectable_code_view/sourceCodes/languages/base.dart';
import 'package:selectable_code_view/sourceCodes/themes/theme.dart';
import 'package:stacked/stacked.dart';

import '../../../common/app_colors.dart';
import '../../../tools/conditional_widget.dart';
import '../home_viewmodel.dart';

class CodeViewerWidget extends ViewModelWidget<HomeViewModel> {
  const CodeViewerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: Palette.background1E,
        borderRadius: BorderRadius.circular(5),
      ),
      child: IfNotNull(
        value: viewModel.convertedCode,
        condition: (value) => value.isNotEmpty,
        builder: (context, convertedCode) {
          return Stack(
            fit: StackFit.passthrough,
            children: [
              Container(
                width: double.infinity,
                alignment: Alignment.topLeft,
                child: SelectableCodeView(
                  code: convertedCode,
                  language: Language.DART,
                  languageTheme: LanguageTheme.vscodeDark(),
                  fontSize: 16,
                  withLinesCount: false,
                  withZoom: false,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  onPressed: () async {
                    final cd = ClipboardData(
                      text: convertedCode,
                    );
                    await Clipboard.setData(cd);
                  },
                  icon: const Icon(
                    Icons.copy,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
