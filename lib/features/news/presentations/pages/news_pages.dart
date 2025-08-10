import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_clean_archi/features/news/presentations/bloc/country/country_bloc.dart';
import 'package:learn_clean_archi/features/news/presentations/bloc/news/news_bloc.dart';
import 'package:learn_clean_archi/features/news/presentations/widgets/category_button_widget.dart';
import 'package:learn_clean_archi/features/news/presentations/widgets/list_news_widget.dart';

import '../../domain/entity/app_country.dart';

class NewsPages extends StatefulWidget {
  const NewsPages({super.key});

  @override
  State<NewsPages> createState() => _NewsPagesState();
}

class _NewsPagesState extends State<NewsPages> {
  @override
  void initState() {
    super.initState();

    context.read<CountryBloc>().add(GetCountryApp());
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: GestureDetector(
            onTap: () {
              showCountryPicker(
                context: context,
                searchAutofocus: true,
                showPhoneCode: false,
                showSearch: true,
                useSafeArea: true,
                countryListTheme: CountryListThemeData(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                onSelect: (Country country) {
                  String countryName = country.displayName;
                  String countryCode = country.countryCode;

                  AppCountry appCountry = AppCountry(
                    countryCode: countryCode,
                    countryName: countryName,
                  );
                  context.read<CountryBloc>().add(
                    CreateCountryAppEvent(appCountry),
                  );

                  context.read<NewsBloc>().add(FetchTopHeadlinesNews());
                },
              );
            },
            child: Row(
              children: [
                Icon(Icons.location_pin, color: Colors.red),
                SizedBox(width: 5),
                BlocBuilder<CountryBloc, CountryState>(
                  builder: (context, state) {
                    if (state is CountryError || state is CountryInitial) {
                      return Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }

                    if (state is CountryLoaded) {
                      final name = state.country.countryName ?? "Welcome Back";
                      return Text(
                        name,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }

                    return Text(
                      "Welcome back!",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.blueAccent),
              onPressed: () {},
            ),
          ],
        ),
        CategoryButtonWidget(),

        SliverFillRemaining(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            color: Colors.white,
            child: ListNewsWidget(),
          ),
        ),
      ],
    );
  }
}
