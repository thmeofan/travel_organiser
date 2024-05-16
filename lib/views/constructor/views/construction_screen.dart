import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_organiser/consts/app_text_styles/constructor_text_style.dart';
import 'package:travel_organiser/views/app/widgets/input_widget.dart';

import '../../../consts/app_colors.dart';
import '../../../data/model/baggage_mode.dart';
import '../../../data/model/thing_model.dart';
import '../widgets/category_screen.dart';

class ConstructionScreen extends StatefulWidget {
  final Baggage? baggage;
  final Function(Baggage)? onBaggageCreated;

  ConstructionScreen({this.baggage, this.onBaggageCreated});

  @override
  _ConstructionScreenState createState() => _ConstructionScreenState();
}

class _ConstructionScreenState extends State<ConstructionScreen> {
  final _descriptionController = TextEditingController();
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();

  int _selectedWeightKg = 0;
  int _selectedWeightGram = 0;

  final List<Map<String, dynamic>> categories = [
    {
      'label': 'Clothes',
      'icon': 'assets/icons/clothes.svg',
    },
    {
      'label': 'Electronics',
      'icon': 'assets/icons/electronics.svg',
    },
    {
      'label': 'Documents',
      'icon': 'assets/icons/documents.svg',
    },
    {
      'label': 'Medication',
      'icon': 'assets/icons/medication.svg',
    },
    {
      'label': 'Cosmetics',
      'icon': 'assets/icons/cosmetics.svg',
    },
    {
      'label': 'Hygiene',
      'icon': 'assets/icons/hygiene.svg',
    },
    {
      'label': 'Jewerly',
      'icon': 'assets/icons/jewerly.svg',
    },
  ];

  final Map<String, TextEditingController> categoryControllers = {};

  String? _selectedCategory;

  @override
  void initState() {
    super.initState();
    for (var category in categories) {
      categoryControllers[category['label']] = TextEditingController();
    }
  }

  @override
  void dispose() {
    for (var controller in categoryControllers.values) {
      controller.dispose();
    }
    _descriptionController.dispose();
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  void _addThing() {
    Map<String, dynamic>? selectedCategoryMap;
    String name = '';

    if (_selectedCategory != null) {
      selectedCategoryMap = categories.firstWhere(
        (category) => category['label'] == _selectedCategory,
      );
      name = categoryControllers[_selectedCategory]!.text;
    }

    if (selectedCategoryMap != null) {
      final description = _descriptionController.text;
      final quantity = int.tryParse(_quantityController.text);
      if (quantity == null || quantity <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please enter a valid quantity.'),
            duration: Duration(seconds: 3),
          ),
        );
        return;
      }
      final weightKg = _selectedWeightKg.toDouble();
      final weightGram = _selectedWeightGram / 1000.0;
      final weight = weightKg + weightGram;

      final thing = Thing(
        name: description,
        description: description,
        quantity: quantity,
        weight: weight,
        category: selectedCategoryMap,
      );

      if (widget.baggage != null) {
        setState(() {
          widget.baggage!.things.add(thing);
          Navigator.pop(context);
        });
      } else {
        final baggage = Baggage(
          name: 'New Baggage',
          weight: weight,
          capacity: 0,
          things: [thing],
        );
        widget.onBaggageCreated!(baggage);
        Navigator.pop(context);
      }

      _nameController.clear();
      _descriptionController.clear();
      _quantityController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/icons/leading.svg'),
        ),
        titleSpacing: -5,
        title: Text(
          'Add Thing',
          style: ConstructorTextStyle.appBar,
        ),
        actions: [
          TextButton(
              onPressed: _addThing,
              child: Text(
                'Done',
                style: ConstructorTextStyle.appBar,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Description',
                style: ConstructorTextStyle.title,
              ),
              InputWidget(
                controller: _descriptionController,
                labelText: 'What do you want to take?',
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              Text(
                'Category',
                style: ConstructorTextStyle.title,
              ),
              Column(
                children: categories.map((category) {
                  return CategoryWidget(
                    label: category['label'],
                    iconPath: category['icon'],
                    isSelected: _selectedCategory == category['label'],
                    onCategorySelected: (label) {
                      setState(() {
                        _selectedCategory = label;
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              Text(
                'Quantity',
                style: ConstructorTextStyle.title,
              ),
              InputWidget(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                labelText: 'Number of things',
                iconPath: 'assets/icons/amount.svg',
              ),
              SizedBox(
                height: size.height * 0.025,
              ),
              Text(
                'Weight(kg/gram)',
                style: ConstructorTextStyle.title,
              ),
              Container(
                width: size.width * 0.9,
                height: size.height * 0.25,
                decoration: BoxDecoration(
                  color: AppColors.blackColor.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 75, horizontal: 52),
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.blackColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: size.width * 0.15,
                    width: size.width * 0.7,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/weight.svg'),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        SizedBox(
                          width: size.width * 0.2,
                          height: size.width * 0.15,
                          child: Center(
                            child: CupertinoPicker(
                              itemExtent: 40,
                              onSelectedItemChanged: (value) {
                                setState(() {
                                  _selectedWeightKg = value + 1;
                                });
                              },
                              children: List.generate(
                                150,
                                (index) => Text(
                                  "${index + 1}",
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.2,
                          height: size.width * 0.15,
                          child: CupertinoPicker(
                            itemExtent: 40,
                            onSelectedItemChanged: (value) {
                              setState(() {
                                _selectedWeightGram = value;
                              });
                            },
                            children: <Widget>[
                              Text(
                                'gram',
                              ),
                              Text(
                                'kg',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
