import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/settings/settings.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/settings/settings_controller.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/settings/settings_view.dart';
import 'package:list_detail_mvc_vn_two_features_boilerplate_getit/src/users/user_list_view.dart';

class UserListApp extends StatelessWidget {
  const UserListApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I<SettingsController>();

    return ValueListenableBuilder<Settings>(
        valueListenable: controller,
        builder: (context, settings, _) {
          return MaterialApp(
            theme: controller.value.theme == AppTheme.light
                ? ThemeData()
                : ThemeData.dark(),
            routes: {
              '/': (context) => UserListView(),
              '/settings': (context) => SettingsView(),
            },
            onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
            locale: Locale.fromSubtags(languageCode: 'en'),
            supportedLocales: [Locale.fromSubtags(languageCode: 'en')],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
