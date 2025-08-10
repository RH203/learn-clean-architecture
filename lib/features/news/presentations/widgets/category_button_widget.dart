import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_archi/core/constants/app_constant.dart';
import 'package:learn_clean_archi/core/injectable/injectable.dart';
import 'package:learn_clean_archi/features/news/presentations/bloc/news/news_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryButtonWidget extends StatefulWidget {
  const CategoryButtonWidget({super.key});

  @override
  State<CategoryButtonWidget> createState() => _CategoryButtonWidgetState();
}

class _CategoryButtonWidgetState extends State<CategoryButtonWidget> {
  int activeButton = 0;
  final SharedPreferences pref = getIt<SharedPreferences>();

  void _onPressed(int index) {
    setState(() {
      activeButton = index;
    });
    context.read<NewsBloc>().add(
      GetNewsBasedOnCategoryEvent(
        AppConstant.categoryButton[activeButton].toLowerCase(),
        pref.getString('countryCode'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Theme.of(context).colorScheme.surface,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Row(
            children: List.generate(AppConstant.categoryButton.length, (index) {
              bool isActive = index == activeButton;
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GestureDetector(
                  onTap: () => _onPressed(index),
                  child: AnimatedContainer(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 600),
                    decoration: BoxDecoration(
                      color: isActive ? Colors.blueAccent : Colors.grey[200],
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        AppConstant.categoryButton[index],
                        style: TextStyle(
                          color: isActive ? Colors.white : Colors.black,
                          fontSize: 13,
                          decoration: TextDecoration.none,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
