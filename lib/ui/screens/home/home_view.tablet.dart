import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'components/header.dart';
import 'home_viewmodel.dart';

class HomeViewTablet extends ViewModelWidget<HomeViewModel> {
  const HomeViewTablet({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return const Scaffold(
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
