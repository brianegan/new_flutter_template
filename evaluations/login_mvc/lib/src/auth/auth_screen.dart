import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:login_mvc/src/auth/auth_controller.dart';

class AuthScreen extends StatefulWidget {
  final AuthController authController;

  const AuthScreen({Key key, @required this.authController}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final _registerFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    widget.authController.addListener(_onAuthChange);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    widget.authController.removeListener(_onAuthChange);
    super.dispose();
  }

  void _onAuthChange() {
    if (widget.authController.hasLoginError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)
              .loginError(widget.authController.loginError)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [
                _LoginForm(
                  authController: widget.authController,
                  formKey: _loginFormKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                _RegistrationForm(
                  authController: widget.authController,
                  formKey: _registerFormKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                ),
              ],
            ),
          ),
          _PageViewIndicator(
            controller: _pageController,
            numPages: 2,
          )
        ],
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AuthController authController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const _LoginForm({
    Key key,
    @required this.authController,
    @required this.formKey,
    @required this.emailController,
    @required this.passwordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: AnimatedBuilder(
            animation: authController,
            builder: (context, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context).logIn,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  _EmailFormField(
                    authController: authController,
                    textEditingController: emailController,
                  ),
                  _PasswordFormField(
                    authController: authController,
                    textEditingController: passwordController,
                  ),
                  SizedBox(height: 16),
                  RaisedButton(
                    onPressed: authController.loggingIn ? null : onSubmit,
                    child: Text(AppLocalizations.of(context).logIn),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void onSubmit() {
    if (formKey.currentState.validate()) {
      authController.login(emailController.text, passwordController.text);
    }
  }
}

class _RegistrationForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final AuthController authController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const _RegistrationForm({
    Key key,
    @required this.authController,
    @required this.formKey,
    @required this.emailController,
    @required this.passwordController,
    @required this.confirmPasswordController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: AnimatedBuilder(
            animation: authController,
            builder: (context, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context).register,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  _EmailFormField(
                    authController: authController,
                    textEditingController: emailController,
                  ),
                  _PasswordFormField(
                    authController: authController,
                    textEditingController: passwordController,
                  ),
                  SizedBox(height: 16),
                  RaisedButton(
                    onPressed: authController.loggingIn ? null : onSubmit,
                    child: Text(AppLocalizations.of(context).logIn),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void onSubmit() {
    if (formKey.currentState.validate()) {
      authController.register(emailController.text, passwordController.text);
    }
  }
}

class _EmailFormField extends StatelessWidget {
  final AuthController authController;
  final TextEditingController textEditingController;

  const _EmailFormField({
    Key key,
    @required this.authController,
    @required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context).email,
        hintText: AppLocalizations.of(context).emailHint,
      ),
      controller: textEditingController,
      validator: (input) {
        if (!authController.isValidEmail(input)) {
          return AppLocalizations.of(context).invalidEmail;
        }

        return null;
      },
    );
  }
}

class _PasswordFormField extends StatelessWidget {
  final AuthController authController;
  final TextEditingController textEditingController;
  final String labelText;

  const _PasswordFormField({
    Key key,
    @required this.authController,
    @required this.textEditingController,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: labelText ?? AppLocalizations.of(context).password,
        hintText: AppLocalizations.of(context).passwordHint,
      ),
      controller: textEditingController,
      validator: (input) {
        if (!authController.isValidPassword(input)) {
          return AppLocalizations.of(context).invalidPassword;
        }

        return null;
      },
    );
  }
}

class _PageViewIndicator extends StatelessWidget {
  final PageController controller;
  final int numPages;
  final double size;

  const _PageViewIndicator({
    Key key,
    @required this.controller,
    @required this.numPages,
    this.size = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, children) {
        final page = controller.page?.round() ?? controller.initialPage;

        return Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final i in List.generate(numPages, (i) => i))
                Container(
                  width: size,
                  height: size,
                  margin: EdgeInsets.all(size),
                  decoration: BoxDecoration(
                    color: page == i
                        ? Theme.of(context).indicatorColor
                        : Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(size),
                  ),
                )
            ],
          ),
        );
      },
    );
  }
}
