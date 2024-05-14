import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../common/app_constants.dart';
import '../../common/ui_helpers.dart';

import 'components/code_viewer.dart';
import 'components/form.dart';
import 'components/header.dart';
import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return const Scaffold(
      body: SizedBox.expand(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: SizedBox(
              width: kdDesktopMaxContentWidth,
              child: Column(
                children: [
                  HeaderWidget(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: InputFormWidget(),
                      ),
                      horizontalSpaceLarge,
                      Expanded(
                        flex: 2,
                        child: CodeViewerWidget(),
                      ),
                    ],
                  ),
                  verticalSpaceLarge,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
