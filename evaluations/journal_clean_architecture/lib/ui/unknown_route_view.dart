import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UnknownRouteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).notFoundTitle),
      ),
      body: Center(
        child: Text(AppLocalizations.of(context).notFoundErrorMessage),
      ),
    );
  }
}
