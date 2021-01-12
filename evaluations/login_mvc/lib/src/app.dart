import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:login_mvc/src/auth/auth_controller.dart';
import 'package:login_mvc/src/auth/auth_screen.dart';
import 'package:login_mvc/src/pantone_colors/pantone_color_repository.dart';
import 'package:login_mvc/src/pantone_colors/pantone_colors_list_view.dart';
import 'package:login_mvc/src/users/user.dart';

class LoginDemoApp extends StatefulWidget {
  final AuthController authController;
  final PantoneColorRepository colorRepository;
  final GlobalKey<NavigatorState> navigatorKey;

  LoginDemoApp({
    Key key,
    @required this.navigatorKey,
    @required this.authController,
    @required this.colorRepository,
  }) : super(key: key);

  @override
  _LoginDemoAppState createState() => _LoginDemoAppState();
}

class _LoginDemoAppState extends State<LoginDemoApp> {
  User _prevUser = User.loggedOut;

  @override
  void initState() {
    super.initState();
    widget.authController.addListener(_onAuthChange);
  }

  @override
  void dispose() {
    widget.authController.removeListener(_onAuthChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      navigatorKey: widget.navigatorKey,
      initialRoute: widget.authController.loggedIn ? '/colors' : '/auth',
      routes: {
        '/colors': (context) =>
            PantoneColorsScreen(repository: widget.colorRepository),
        '/auth': (context) => AuthScreen(authController: widget.authController),
      },
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      locale: Locale.fromSubtags(languageCode: 'en'),
      supportedLocales: [Locale.fromSubtags(languageCode: 'en')],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }

  bool get _wasLoggedOut => _prevUser == User.loggedOut;

  bool get _wasLoggedIn => _prevUser != User.loggedOut;

  NavigatorState get _navigator => widget.navigatorKey.currentState;

  void _onAuthChange() {
    if (_wasLoggedOut && widget.authController.loggedIn) {
      _navigator.pushNamedAndRemoveUntil(
        '/colors',
        (route) => false,
      );
    } else if (_wasLoggedIn && widget.authController.loggedOut) {
      _navigator.pushNamedAndRemoveUntil(
        '/auth',
        (route) => false,
      );
    }

    _prevUser = widget.authController.currentUser;
  }
}
