import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_organiser/consts/app_text_styles/home_screen_text_style.dart';
import 'package:travel_organiser/views/app/widgets/chosen_action_button_widget.dart';
import 'package:travel_organiser/views/home/widgets/thing_item_widget.dart';
import '../../../data/model/baggage_mode.dart';
import '../../constructor/views/construction_screen.dart';

class BaggageItemWidget extends StatelessWidget {
  final Baggage baggage;

  const BaggageItemWidget({Key? key, required this.baggage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: baggage.color,
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/icons/name.svg'),
                SizedBox(
                  width: 5,
                ),
                Text(
                  baggage.name,
                  style: HomeScreenTextStyle.title,
                ),
                Spacer(),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ConstructionScreen(baggage: baggage),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/icons/edit.svg'),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Edit',
                          style: HomeScreenTextStyle.title,
                        )
                      ],
                    ))
              ],
            ),
            const SizedBox(height: 8.0),
            baggage.things.isEmpty
                ? Row(
                    children: [
                      SvgPicture.asset('assets/icons/warning.svg'),
                      SizedBox(
                        width: 12,
                      ),
                      Flexible(
                        child: const Text(
                          'You need to add things to your baggage.',
                          style: HomeScreenTextStyle.warning,
                        ),
                      ),
                    ],
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: baggage.things.length,
                    itemBuilder: (context, index) {
                      final thing = baggage.things[index];
                      return ThingItemWidget(
                        name: thing.name,
                        category: thing.category?['label'] ?? 'Unknown',
                        categoryIcon: thing.category?['icon'] ?? 'default_icon',
                        quantity: thing.quantity,
                        weight: thing.weight,
                        color: baggage.color,
                      );
                    },
                  ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Text(
                  'Baggage info',
                  style: HomeScreenTextStyle.title,
                ),
                const Spacer(),
                SvgPicture.asset(
                  'assets/icons/amount.svg',
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 4.0),
                Text(
                  '${baggage.capacity}',
                  style: HomeScreenTextStyle.title,
                ),
                const SizedBox(width: 16.0),
                SvgPicture.asset(
                  'assets/icons/weight.svg',
                  height: 24,
                  width: 24,
                ),
                const SizedBox(width: 4.0),
                Text(
                  '${baggage.weight}',
                  style: HomeScreenTextStyle.title,
                ),
              ],
            ),
            ChosenActionButton(
              text: 'Add thing',
              color: Colors.white.withOpacity(0.2),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ConstructionScreen(baggage: baggage),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
