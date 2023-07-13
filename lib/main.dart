import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'generated/l10n.dart';

void main() {
  runApp(const LocalizationSample());
}

class LocalizationSample extends StatelessWidget {
  const LocalizationSample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Flutter Demo',
      home: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).hello,
              style: const TextStyle(fontSize: 50),
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: isArabic() ? 16 : 0, left: isArabic() ? 0 : 16),
              child: Text(
                S.of(context).world,
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == "ar";
}
