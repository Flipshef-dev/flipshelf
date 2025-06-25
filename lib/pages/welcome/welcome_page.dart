import 'package:flipshelf/common/color_extension.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int pageIndex = 0;
  PageController pageController = PageController();

  List pageAttr = [
    {
      "title": "Welcome to FlipShelf",
      "subtitle": "Discover and share your favorite books with the world.",
      "image": "assets/images/welcome_1.png",
    },
    {
      "title": "Connect with Readers",
      "subtitle": "Join a community of book lovers and share your thoughts.",
      "image": "assets/images/welcome_2.png",
    },
    {
      "title": "Track Your Reading",
      "subtitle": "Keep track of your reading progress and goals.",
      "image": "assets/images/welcome_3.png",
    },
  ];

  @override
  void initState() {
    super.initState();

    // Add page controller listener
    pageController.addListener(() {
      int newPageIndex = pageController.page?.round() ?? 0;
      if (newPageIndex != pageIndex && mounted) {
        setState(() {
          pageIndex = newPageIndex;
        });
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _animateToNextPage() {
    if (pageIndex < pageAttr.length - 1) {
      pageController.animateToPage(
        pageIndex + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      _navigateToLogin();
    }
  }

  void _navigateToLogin() {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Main PageView
            PageView.builder(
              controller: pageController,
              itemCount: pageAttr.length,
              itemBuilder: (context, index) {
                var pageObject = pageAttr[index] as Map? ?? {};
                return Container(
                  width: media.width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 50,
                  ),
                  child: SingleChildScrollView(
                    child: 
                  Column(
                    children: [
                      // Title
                      AnimatedOpacity(
                        opacity: pageIndex == index ? 1.0 : 0.5,
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          pageObject["title"].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: TColor.primary,
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),

                      AnimatedOpacity(
                        opacity: pageIndex == index ? 1.0 : 0.7,
                        duration: const Duration(milliseconds: 600),
                        child: Text(
                          pageObject["subtitle"].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: TColor.primaryLight,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(height: media.width * 0.25),

                      // Images
                      AnimatedScale(
                        scale: pageIndex == index ? 1.0 : 0.9,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeOut,
                        child: Image.asset(
                          pageObject["image"].toString(),
                          width: media.width * 0.8,
                          height: media.width * 0.8,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                  )
                );
              },
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Skip button
                      TextButton(
                        onPressed: _navigateToLogin,
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          overlayColor: Colors.transparent,
                        ),
                        child: Text(
                          "Skip",
                          style: TextStyle(
                            color: TColor.primary,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),

                      // Page indicators
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: pageAttr.asMap().entries.map((entry) {
                          int index = entry.key;
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: pageIndex == index ? 20 : 12,
                            height: 8,
                            decoration: BoxDecoration(
                              color: pageIndex == index
                                  ? TColor.primary
                                  : TColor.primaryLight.withValues(alpha: (0.5 * 255).round().toDouble()),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          );
                        }).toList(),
                      ),

                      // Next button
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          // color: pageIndex == pageAttr.length - 1
                          //     ? TColor.primary.withOpacity(0.1)
                          //     : Colors.transparent,
                          color: TColor.primary.withAlpha(1),
                        ),
                        child: TextButton(
                          onPressed: _animateToNextPage,
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            overlayColor: Colors.transparent,
                          ),
                          child: Text(
                            // pageIndex == pageAttr.length - 1
                            //     ? "Get Started"
                            //     : "Next",
                            "Next",
                            style: TextStyle(
                              color: TColor.primary,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.width * 0.15),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
