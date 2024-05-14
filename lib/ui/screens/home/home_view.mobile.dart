import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../common/ui_helpers.dart';

import 'components/code_viewer.dart';
import 'components/form.dart';
import 'components/header.dart';
import 'home_viewmodel.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return const Scaffold(
      body: SizedBox.expand(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              HeaderWidget(),
              InputFormWidget(),
              verticalSpaceMedium,
              CodeViewerWidget(),
              verticalSpaceLarge,
            ],
          ),
        ),
      ),
    );
  }
}
