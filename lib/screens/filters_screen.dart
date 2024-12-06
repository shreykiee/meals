import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreefilterSet = false;
  bool _lactoseFreeFilterSet = false;
  bool _vegetarianFilterSet = false;
  bool _veganFilterSet = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: _glutenFreefilterSet,
            onChanged: (isChecked) {
              setState(() {
                _glutenFreefilterSet = !_glutenFreefilterSet;
              });
            },
            title: Text('Gluten-free'),
            subtitle: Text(
              'Only include gluten-free meals',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            activeTrackColor: Theme.of(context).colorScheme.tertiaryContainer,
          ),
          SwitchListTile(
            value: _lactoseFreeFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _lactoseFreeFilterSet = !_lactoseFreeFilterSet;
              });
            },
            title: Text('Lactose-free'),
            subtitle: Text(
              'Only include Lactose-free meals',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            activeTrackColor: Theme.of(context).colorScheme.tertiaryContainer,
          ),
          SwitchListTile(
            value: _vegetarianFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _vegetarianFilterSet = !_vegetarianFilterSet;
              });
            },
            title: Text('Vegetarian '),
            subtitle: Text(
              'Only include vegetarian meals',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            activeTrackColor: Theme.of(context).colorScheme.tertiaryContainer,
          ),
          SwitchListTile(
            value: _veganFilterSet,
            onChanged: (isChecked) {
              setState(() {
                _veganFilterSet = !_veganFilterSet;
              });
            },
            title: Text('Vegan'),
            subtitle: Text(
              'Only include Began meals',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            activeTrackColor: Theme.of(context).colorScheme.tertiaryContainer,
          ),
        ],
      ),
    );
  }
}
