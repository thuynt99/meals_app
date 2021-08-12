import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilter;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilter);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosefree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'] ?? false;
    _lactosefree = widget.currentFilters['lactose'] ?? false;
    _vegetarian = widget.currentFilters['vegetarian'] ?? false;
    _vegan = widget.currentFilters['vegan'] ?? false;
    super.initState();
  }

  Widget _buildSwitchListTitle(
      String title, String subTitle, bool currentValue, Function onChanged) {
    return SwitchListTile(
      title: Text(
        title,
      ),
      subtitle: Text(subTitle),
      value: currentValue,
      onChanged: (newValue) => onChanged(newValue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Filters',
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactosefree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian
                  };
                  widget.saveFilter(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Text('Adjust your meal selection.',
                style: Theme.of(context).textTheme.headline1),
            Expanded(
                child: ListView(
              children: <Widget>[
                _buildSwitchListTitle('Gluten-free',
                    'Only include gluten free meals', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwitchListTitle(
                    'Lactose-free',
                    'Only include lactore free meals',
                    _lactosefree, (newValue) {
                  setState(() {
                    _lactosefree = newValue;
                  });
                }),
                _buildSwitchListTitle(
                    'Vegetarian',
                    'Only include vegetarian free meals',
                    _vegetarian, (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTitle(
                    'Vegan', 'Only include vegan free meals', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                })
              ],
            ))
          ],
        ));
  }
}
