import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../common/app_constants.dart';

import 'components/header.dart';
import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return const Scaffold(
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: kdDesktopMaxContentWidth,
              child: Column(
                children: [
                  HeaderWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
