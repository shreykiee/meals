import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget buildSwitchTile({
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
    required BuildContext context,
  }) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      title: Text(title),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
      activeTrackColor: Theme.of(context).colorScheme.tertiaryContainer,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: Column(
        children: [
          buildSwitchTile(
              title: 'Gluten-free',
              subtitle: 'Only include gluten-free meals',
              value: activeFilters[Filter.glutenFree]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.glutenFree, isChecked);
              },
              context: context),
          buildSwitchTile(
              title: 'Lactose-free',
              subtitle: 'Only include lactose-free meals',
              value: activeFilters[Filter.lactoseFree]!,
              onChanged: (isChecked) {
                ref
                    .read(filtersProvider.notifier)
                    .setFilter(Filter.lactoseFree, isChecked);
              },
              context: context),
          buildSwitchTile(
            title: 'Vegetarian',
            subtitle: 'Only include vegetarian meals',
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            context: context,
          ),
          buildSwitchTile(
            title: 'Vegan',
            subtitle: 'Only include vegan meals',
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            context: context,
          ),
        ],
      ),
    );
  }
}
