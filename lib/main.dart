import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:evently2/ui/screens/navigation/tabs/login/login_screen.dart';
import 'package:evently2/ui/screens/navigation/tabs/provider/language_provider.dart';
import 'package:evently2/ui/screens/navigation/tabs/provider/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تحقق أولاً إذا كان Firebase مثبتاً بالفعل
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyCmkHtjK29IRqt7K6iVDVSomHR7V0h7_BE",
          appId: "1:956929519141:android:23ab1bdb3b0a4bd386d9cc",
          messagingSenderId: "",
          projectId: "evently-offline-c17",
        ),
      );
    } else {
      // إذا كان مثبتاً بالفعل، استخدم التطبيق الموجود
      Firebase.app();
    }
  } catch (e) {
    print("Error initializing Firebase: $e");
  }

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: languageProvider.currentLocale.isNotEmpty
          ? Locale(languageProvider.currentLocale)
          : const Locale('en'),
      themeMode: themeProvider.themeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
    );
  }
}