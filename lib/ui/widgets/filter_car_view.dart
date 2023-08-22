import 'package:brokr/ui/widgets/drop_down_widget.dart';
import 'package:brokr/utils/theme_utils.dart';
import 'package:flutter/material.dart';

import 'check_widget.dart';

class FilterCarView extends StatelessWidget {
  //Sort params
  final List<String> sortItems;
  final String? sortSelectedValue;
  final Function(String?)? onSortChanged;
  final String sortHintText;

  //Price params
  final RangeValues currentRangeValues;
  final Function(RangeValues)? onPriceChanged;

  //Miles params
  final bool unlimitedMiles;
  final Function(bool?) onUnlimitedMilesChanged;

  const FilterCarView({
    super.key,
    required this.sortItems,
    this.sortSelectedValue,
    this.onSortChanged,
    required this.sortHintText,
    required this.currentRangeValues,
    this.onPriceChanged,
    required this.unlimitedMiles,
    required this.onUnlimitedMilesChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Sort by',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 16,
                        color: ThemeUtils.greyColor,
                      ),
                ),
              ),
              DropDownWidget(
                items: sortItems,
                selectedValue: sortSelectedValue,
                onChanged: onSortChanged,
                hintText: sortHintText,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Price',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 16,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            '\$${currentRangeValues.start.round()} - \$${currentRangeValues.end.round()}',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 16,
                  color: Colors.black,
                ),
          ),
          RangeSlider(
            values: currentRangeValues,
            max: 10000,
            divisions: 100,
            activeColor: ThemeUtils.primaryColor,
            inactiveColor: ThemeUtils.primaryColor.withOpacity(0.2),
            labels: RangeLabels(
              currentRangeValues.start.round().toString(),
              currentRangeValues.end.round().toString(),
            ),
            onChanged: onPriceChanged,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Make',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
              DropDownWidget(
                items: sortItems,
                selectedValue: sortSelectedValue,
                onChanged: onSortChanged,
                hintText: sortHintText,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Years',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
              DropDownWidget(
                items: sortItems,
                selectedValue: sortSelectedValue,
                onChanged: onSortChanged,
                hintText: sortHintText,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Lenght',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
              DropDownWidget(
                items: sortItems,
                selectedValue: sortSelectedValue,
                onChanged: onSortChanged,
                hintText: sortHintText,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Vehicle type',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
              DropDownWidget(
                items: sortItems,
                selectedValue: sortSelectedValue,
                onChanged: onSortChanged,
                hintText: sortHintText,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Unlimited miles',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
              CheckWidget(
                value: unlimitedMiles,
                onChanged: onUnlimitedMilesChanged,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Delivered to you',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
              CheckWidget(
                value: unlimitedMiles,
                onChanged: onUnlimitedMilesChanged,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Text(
                  'Free cancellation policy',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 16,
                      ),
                ),
              ),
              CheckWidget(
                value: unlimitedMiles,
                onChanged: onUnlimitedMilesChanged,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Features',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }
}
