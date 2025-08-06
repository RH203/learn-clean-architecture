import 'package:flutter/material.dart';
import 'package:learn_clean_archi/app_logger.dart';
import 'package:learn_clean_archi/core/constants/assets.dart';
import 'package:lottie/lottie.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({
    super.key,
    required this.asset,
    required this.teks,
    required this.onPressed,
    required this.index,
  });

  final String asset, teks;
  final int index;
  final void Function(int currentPage) onPressed;

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  @override
  Widget build(BuildContext context) {
    AppLogger.debug(widget.index);
    final screenWidth = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Lottie.asset(widget.asset),
        Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            right: screenWidth * 0.04,
          ),
          child: Text(
            widget.teks,
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: screenWidth * 0.04),
          child: Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () => widget.onPressed(widget.index),
              style: ElevatedButton.styleFrom(elevation: 5),
              child: Text(widget.index != 1 ? "Next" : "Letsgo"),
            ),
          ),
        ),
      ],
    );
  }
}
