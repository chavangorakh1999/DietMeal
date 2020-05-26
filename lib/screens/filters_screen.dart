import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter_screen';
  final Function saveFilters;

  FilterScreen(this.saveFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool isGlutenFree = false;
  bool isVegan = false;
  bool isVegetarian = false;
  bool isLactoseFree = false;

  Widget _buildSwitchTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text('Include Gluten Free Meals'),
        value: currentValue,
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': isGlutenFree,
                  'lactose': isLactoseFree,
                  'vegan': isVegan,
                  'vegeterian': isVegetarian,
                };
                widget.saveFilters(selectedFilters);
              },
            ),
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal selection !',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchTile(
                    'Gluteen-Free',
                    'Only include gluteen-free meal',
                    isGlutenFree,
                    (newValue) {
                      setState(
                        () {
                          isGlutenFree = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchTile(
                    'Luctose Free',
                    'Only Lactose free meal',
                    isLactoseFree,
                    (newValue) {
                      setState(
                        () {
                          isLactoseFree = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchTile(
                    'VEGAN',
                    'Only vegan meal',
                    isVegan,
                    (newValue) {
                      setState(
                        () {
                          isVegan = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchTile(
                    'Vegeterian',
                    'Only Vegeterian',
                    isVegetarian,
                    (newValue) {
                      setState(
                        () {
                          isVegetarian = newValue;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
