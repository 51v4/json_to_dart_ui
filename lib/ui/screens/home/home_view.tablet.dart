import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';

import 'components/code_viewer.dart';
import 'components/form.dart';
import 'components/header.dart';
import 'home_viewmodel.dart';

class HomeViewTablet extends ViewModelWidget<HomeViewModel> {
  const HomeViewTablet({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      body: SizedBox.expand(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const HeaderWidget(),
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: const InputFormWidget(),
              ),
              verticalSpaceMedium,
              Container(
                constraints: const BoxConstraints(maxWidth: 600),
                child: const CodeViewerWidget(),
              ),
              verticalSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }
}
