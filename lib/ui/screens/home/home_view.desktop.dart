import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import '../../common/app_constants.dart';

import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          width: kdDesktopMaxContentWidth,
          height: kdDesktopMaxContentHeight,
          child: Column(
            children: [
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
              Placeholder(),
            ],
          ),
        ),
      ),
    );
  }
}
