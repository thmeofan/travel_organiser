import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travel_organiser/views/app/widgets/chosen_action_button_widget.dart';
import 'package:travel_organiser/views/app/widgets/input_widget.dart';

import '../../../consts/app_colors.dart';
import '../../../consts/app_text_styles/constructor_text_style.dart';
import '../../../consts/app_text_styles/home_screen_text_style.dart';
import '../../../data/model/baggage_mode.dart';
import '../../../util/app_routes.dart';
import '../../../util/shared_pref_service.dart';
import '../widgets/baggage_item_widget.dart';
import '../widgets/color_circle.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferencesService _prefsService;
  List<Baggage> _baggages = [];
  TextEditingController _nameController = TextEditingController();
  TextEditingController _capacityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _prefsService = SharedPreferencesService();
    _loadBaggages();
  }

  Future<void> _loadBaggages() async {
    final baggages = await _prefsService.getBaggages();
    setState(() {
      _baggages = baggages;
    });
  }

  void _addBaggage() {
    Color selectedColor = Colors.transparent;

    void handleColorSelection(Color color) {
      setState(() {
        selectedColor = color;
      });
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          title: Text(
            'Add Baggage',
            style: HomeScreenTextStyle.appbarTitle,
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Baggage name', style: ConstructorTextStyle.subtitle),
              InputWidget(
                controller: _nameController,
                labelText: 'Write baggage name',
              ),
              SizedBox(
                height: 3,
              ),
              Text('Laggage size (kg)', style: ConstructorTextStyle.subtitle),
              InputWidget(
                controller: _capacityController,
              ),
              SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ColorCircle(
                    color: AppColors.lightPurpleColor,
                    isSelected: selectedColor == AppColors.lightPurpleColor,
                    onColorSelected: handleColorSelection,
                  ),
                  ColorCircle(
                    color: AppColors.greyColor,
                    isSelected: selectedColor == AppColors.greyColor,
                    onColorSelected: handleColorSelection,
                  ),
                  ColorCircle(
                    color: AppColors.lightYellowColor,
                    isSelected: selectedColor == AppColors.lightYellowColor,
                    onColorSelected: handleColorSelection,
                  ),
                  ColorCircle(
                    color: AppColors.lightOrangeColor,
                    isSelected: selectedColor == AppColors.lightOrangeColor,
                    onColorSelected: handleColorSelection,
                  ),
                  ColorCircle(
                    color: AppColors.lightPinkColor,
                    isSelected: selectedColor == AppColors.lightPinkColor,
                    onColorSelected: handleColorSelection,
                  ),
                  ColorCircle(
                    color: AppColors.lightBlueColor,
                    isSelected: selectedColor == AppColors.lightBlueColor,
                    onColorSelected: handleColorSelection,
                  ),
                  ColorCircle(
                    color: AppColors.lightGreenColor,
                    isSelected: selectedColor == AppColors.lightGreenColor,
                    onColorSelected: handleColorSelection,
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: HomeScreenTextStyle.button,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text(
                'Create',
                style: HomeScreenTextStyle.button,
              ),
              onPressed: () {
                final name = _nameController.text;
                double capacity;
                try {
                  capacity = double.parse(_capacityController.text);
                } on FormatException {
                  print('Invalid capacity value');
                  return;
                }
                final baggage = Baggage(
                  name: name,
                  weight: 0,
                  capacity: capacity,
                  color: selectedColor,
                );
                setState(() {
                  _baggages.add(baggage);
                });
                _prefsService.saveBaggages(_baggages);
                _nameController.clear();
                _capacityController.clear();
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Packed suitcases',
          style: ConstructorTextStyle.appBarTitle,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.profile,
                );
              },
              icon: SvgPicture.asset('assets/icons/settings.svg'))
        ],
        leadingWidth: size.width * 0.3,
      ),
      body: _baggages.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: size.height * 0.43,
                decoration: BoxDecoration(
                  color: AppColors.blackColor.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Image.asset(
                      'assets/images/home_screen.png',
                      fit: BoxFit.contain,
                      width: double.infinity,
                      height: size.height * 0.2,
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const Text(
                      'Add Baggage to start collecting your belongings.',
                      style: HomeScreenTextStyle.subtitle,
                    ),
                    SizedBox(
                      height: size.height * 0.005,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0),
                      child: ChosenActionButton(
                        text: 'Add baggage',
                        onTap: () {
                          _addBaggage();
                        },
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                  ],
                ),
              ),
            )
          : Column(
              children: <Widget>[
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _baggages.length,
                    itemBuilder: (context, index) {
                      final baggage = _baggages[index];
                      return BaggageItemWidget(baggage: baggage);
                    },
                  ),
                ),
              ],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _baggages.isEmpty
          ? Container()
          : ChosenActionButton(
              color: AppColors.blackColor.withOpacity(0.12),
              text: 'Add baggage',
              onTap: () {
                _addBaggage();
              }),
    );
  }
}
