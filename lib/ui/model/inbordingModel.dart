import '../utils/app_assets.dart';

class OnbordingModel {
  String image;
  String title;
  String? description;
  String buttonText;
  bool showLanguageTheme;
  OnbordingModel({
    required this.image,
    required this.title,
    this.description,
    required this.buttonText,
    this.showLanguageTheme = false,
  });

  static List<OnbordingModel> datalist = [
    OnbordingModel(
      image: AppAssets.onbording_1,
      title: "Personalize Your Experience",
      description: "Choose your preferred theme and language to get started with a comfortable, tailored experience that suits your style.",
      buttonText: "Let's start",
      showLanguageTheme: true,
    ),
    OnbordingModel(
      image: AppAssets.appLogo,
      title: "Find Events That Inspire You",
      description: "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
      buttonText: "Next",
      showLanguageTheme: false,
    ),
    OnbordingModel(
      image: AppAssets.appLogo,
      title: "Effortless Event Planning",
      description: "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we've got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
      buttonText: "Next",
      showLanguageTheme: false,
    ),
    OnbordingModel(
      image: AppAssets.appLogo,
      title: "Bearish",
      description: "Praise the name of your Lord, the Most High",
      buttonText: "Next",
      showLanguageTheme: false,
    ),
    OnbordingModel(
      image: AppAssets.appLogo,
      title: "Connect with Friends & Share Moments",
      description: "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
      buttonText: "Get started",
      showLanguageTheme: false,
    ),
  ];
}