import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehatin_flutter/home/data/meal_filter_data.dart';
import 'package:sehatin_flutter/home/presentation/bloc/home_bloc.dart';

class MealFilter extends StatelessWidget {
  const MealFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SizedBox(
          height: 37,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: mealFilterData.length,
            itemBuilder: (ctx, idx) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                onTap: () {
                  context.read<HomeBloc>().add(
                        OnFilterPicked(
                          foodType: mealFilterData[idx].foodType,
                        ),
                      );
                },
                borderRadius: BorderRadius.circular(24),
                splashColor: const Color(0xff1e1e1e).withOpacity(0.5),
                child: Container(
                  height: 37,
                  width: 121,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: state.foodType! == mealFilterData[idx].foodType
                          ? const Color(0xff1E1E1E)
                          : const Color(0xffF4F4F9)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(mealFilterData[idx].icon),
                      const SizedBox(width: 4),
                      Text(
                        mealFilterData[idx].name,
                        style: TextStyle(
                          color: state.foodType! == mealFilterData[idx].foodType
                              ? const Color(0xffF4F4F9)
                              : const Color(0xff1E1E1E),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
