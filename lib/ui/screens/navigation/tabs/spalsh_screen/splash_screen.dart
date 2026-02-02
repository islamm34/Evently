import 'package:evently2/ui/widgets/evently_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../model/inbordingModel.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/app_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  PageController pageController = PageController(initialPage: 0);
  var dataList = OnbordingModel.datalist;
  int currentPage = 0;
  String selectedLanguage = "English";
  String selectedTheme = "Light";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  Image.asset(AppAssets.appLogo, height: 50),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 400,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: dataList.length,
                      onPageChanged: (index) {
                        setState(() {
                          currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        OnbordingModel item = dataList[index];
                        return item.image.endsWith('.svg')
                            ? SvgPicture.asset(item.image)
                            : Image.asset(item.image, fit: BoxFit.contain);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    child: Center(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: dataList.length,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: AppColors.blue,
                          dotColor: AppColors.grey,
                          dotHeight: 10,
                          dotWidth: 10,
                          spacing: 8,
                          expansionFactor: 4,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            dataList[currentPage].title,
                            style: AppTextStyles.black20SemiBold,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            dataList[currentPage].description ?? '',
                            style: AppTextStyles.grey14Regular,
                          ),
                        ),
                        const SizedBox(height: 40),
                        if (dataList[currentPage].showLanguageTheme)
                          _buildLanguageAndThemeSections(),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 20,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: EventlyButton(
                    text: dataList[currentPage].buttonText,
                    onPress: _onButtonPressed,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLanguageAndThemeSections() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Language", style: AppTextStyles.black20SemiBold),
            _buildLanguageOptions(),
          ],
        ),
         SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Theme", style: AppTextStyles.black20SemiBold),
            _buildThemeOptions(),
          ],
        ),
      ],
    );
  }

  Widget _buildLanguageOptions() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          _buildToggleItem(
            text: "English",
            isSelected: selectedLanguage == "English",
            onTap: () => setState(() => selectedLanguage = "English"),
          ),
          _buildToggleItem(
            text: "Arabic",
            isSelected: selectedLanguage == "Arabic",
            onTap: () => setState(() => selectedLanguage = "Arabic"),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeOptions() {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          _buildToggleItem(
            icon: Icons.wb_sunny_outlined,
            isSelected: selectedTheme == "Light",
            onTap: () => setState(() => selectedTheme = "Light"),
          ),
          _buildToggleItem(
            icon: Icons.nightlight_round,
            isSelected: selectedTheme == "Dark",
            onTap: () => setState(() => selectedTheme = "Dark"),
          ),
        ],
      ),
    );
  }

  Widget _buildToggleItem({
    String? text,
    IconData? icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.blue : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: icon != null
            ? Icon(
          icon,
          color: isSelected ? Colors.white : AppColors.blue,
          size: 20,
        )
            : Text(
          text!,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  void _onButtonPressed() {
    if (currentPage < dataList.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.push(context, AppRoutes.login);
    }
  }
}