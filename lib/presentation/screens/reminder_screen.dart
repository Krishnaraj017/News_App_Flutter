import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:krish_news_app/presentation/widgets/elevated_container.dart';

@RoutePage()
class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
            ElevatedContainer(
            child: SizedBox(
              width: 170,
              height: 120,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Quick reminder"),
                        //Assets.icons.addImageIcon.image(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:  const Color(0xFFDDDADA),
                              ),
                            ),
                            //const Gap(5),
                            const Text(
                              "Dolo 650",
                              // style: Theme.of(context)
                              //     .textTheme
                              //     .regularSmall
                              //     .copyWith(
                              //         fontSize: 11,
                              //         fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "8:30 AM",
                              // style: Theme.of(context)
                              //     .textTheme
                              //     .regularSmall
                              //     .copyWith(
                              //       fontSize: 11,
                              //       fontWeight: FontWeight.w500,
                              //     ),
                            ),
                           // const Gap(5),
                            //Assets.icons.checkBoxUnselected.image(),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black),
                            ),
                            //const Gap(5),
                            const Text(
                              "Fish Curry",
                              // style: Theme.of(context)
                              //     .textTheme
                              //     .regularSmall
                              //     .copyWith(
                              //         fontSize: 11,
                              //         fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "8:30 AM",
                              // style: Theme.of(context)
                              //     .textTheme
                              //     .regularSmall
                              //     .copyWith(
                              //         fontSize: 11,
                              //         fontWeight: FontWeight.w500),
                            ),
                           // const Gap(5),
                            //Assets.icons.checkBoxSelected.image()
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 5,
                              height: 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black),
                            ),
                            //const Gap(5),
                            const Text(
                              "Sleep early",
                              // style: Theme.of(context)
                              //     .textTheme
                              //     .regularSmall
                              //     .copyWith(
                              //         fontSize: 11,
                              //         fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "10:30 AM",
                              // style: Theme.of(context)
                              //     .textTheme
                              //     .regularSmall
                              //     .copyWith(
                              //         fontSize: 11,
                              //         fontWeight: FontWeight.w500),
                            ),
                            //const Gap(5),
                            //Assets.icons.checkBoxUnselected.image(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}