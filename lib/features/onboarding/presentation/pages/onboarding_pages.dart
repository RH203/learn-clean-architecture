import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learn_clean_archi/app_logger.dart';
import 'package:learn_clean_archi/core/constants/app_constant.dart';
import 'package:learn_clean_archi/core/constants/assets.dart';
import 'package:learn_clean_archi/features/onboarding/presentation/widgets/onboarding_widget.dart';
import 'package:lottie/lottie.dart';

class OnboardingPages extends StatefulWidget {
  const OnboardingPages({super.key});

  @override
  State<OnboardingPages> createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  PageController _controller = PageController();

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  void _onPageChanged(int currentPage) {
    final nextPage = currentPage + 1;

    if (nextPage < Assets.assetsLottie.length) {
      _controller.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
      );
    } else {
      context.go('/list-news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppConstant.nameApp), centerTitle: true),
      body: PageView.builder(
        controller: _controller,
        itemCount: Assets.assetsLottie.length,
        itemBuilder: (context, index) {
          return OnboardingWidget(
            asset: Assets.assetsLottie[index],
            teks: AppConstant.titleOnboarding[index],
            index: index,
            onPressed: _onPageChanged,
          );
        },
      ),
    );
  }
}
