import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:krish_news_app/presentation/routes/app_router.dart';

@RoutePage()
class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

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
                    'News Today',
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
                'News you can trust.',
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
              height: 25,
            ),
            Center(
              child: Image.asset(
                'assets/news_mic.png',
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
                  begin: Alignment(1.00, -0.06),
                  end: Alignment(-1, 0.06),
                  colors: [Color(0xFFA71E1E), Color(0x84A71E1E)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11.54),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: 140.90,
                    top: 23.16,
                    child: Row(
                      // mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.router.push(const OnBoardingRouteTwo());
                          },
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21.54,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                        const SizedBox(width: 13.08),
                        // Container(
                        //   width: 23.08,
                        //   height: 23.08,
                        //   clipBehavior: Clip.antiAlias,
                        //   decoration: BoxDecoration(),
                        //   child: Stack(children: []),
                        // ),
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
