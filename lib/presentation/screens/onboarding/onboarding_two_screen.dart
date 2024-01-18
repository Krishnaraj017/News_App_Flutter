import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:krish_news_app/presentation/routes/app_router.dart';
import 'package:krish_news_app/presentation/screens/all_news_screen.dart';

@RoutePage()
class OnBoardingScreenTwo extends StatelessWidget {
  const OnBoardingScreenTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0x1B1B1B1B),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 18.0, top: 8),
                  child: Text(
                    'NEWS TODAY',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.62,
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 18, top: 8),
                  child: Container(
                    width: 30,
                    height: 30,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(color: Colors.white),
                    child: const Center(
                        child: Stack(children: [Icon(Icons.menu)])),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 55,
            ),
            const SizedBox(
              width: 300.60,
              child: Text(
                "Topics that mater you the most",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 49.24,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w900,
                  height: 0,
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              width: 300.75,
              height: 147.68,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(1.00, 0.00),
                  end: const Alignment(-1, 0),
                  colors: [
                    Colors.white,
                    Colors.amber.withOpacity(0),
                    Colors.orange.withOpacity(0),
                    Colors.red
                  ],
                ), 
              ),
            ),
            const SizedBox(
              height: 120,
            ),
            Container(
              width: 336.96,
              height: 72.32,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(1.00, -0.07),
                  end: Alignment(-1, 0.07),
                  colors: [Color(0xFF2A2A2A), Color(0xFF1D1D1D)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.54),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 118.40,
                    top: 23.16,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.router.push(const AllNewsRoute());
                          },
                          child: const Text(
                            'Finish',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21.54,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10.08),
                        Container(
                          width: 23.08,
                          height: 23.08,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Stack(children: [
                            Image.asset('assets/check_circle.png')
                          ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
