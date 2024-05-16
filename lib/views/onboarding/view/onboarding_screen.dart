import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/onboarding_cubit/onboarding_cubit.dart';
import '../../../consts/app_text_styles/onboarding_text_style.dart';
import '../../../util/app_routes.dart';
import '../../app/widgets/chosen_action_button_widget.dart';
import '../widgets/introduction_widget.dart';

class OnboardingScreen extends StatefulWidget {
  final bool? isFirstTime;

  const OnboardingScreen({
    Key? key,
    this.isFirstTime,
  }) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final CarouselController _carouselController = CarouselController();

  void _onActionButtonTap() {
    context.read<OnboardingCubit>().setFirstTime();
    Navigator.pushReplacementNamed(context, AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: CarouselSlider(
                items: const [
                  IntroductionWidget(
                    imagePath: 'assets/images/onboarding.png',
                  ),
                ],
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: size.height * 0.6,
                  autoPlay: false,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {});
                  },
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
              width: double.infinity,
              height: size.height * 0.5,
              child: Padding(
                padding: EdgeInsets.all(size.height * 0.02),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            'Your personal travel packing pssistant!',
                            style: OnboardingTextStyle.introduction,
                            textAlign: TextAlign.center,
                            softWrap: true,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.025,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Flexible(
                        child: Text(
                          'Create a list of items for your trip in just a few steps and set off on your journey with a sense of confidence and comfort.',
                          style: OnboardingTextStyle.description,
                          textAlign: TextAlign.center,
                          softWrap: true,
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ]),
                    const Spacer(),
                    ChosenActionButton(
                      onTap: _onActionButtonTap,
                      text: 'Get started',
                    ),
                    SizedBox(
                      height: size.height * 0.035,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
