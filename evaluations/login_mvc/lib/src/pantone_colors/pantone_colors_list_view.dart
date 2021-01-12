import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:login_mvc/src/pantone_colors/pantone_color_feed.dart';
import 'package:login_mvc/src/pantone_colors/pantone_color_repository.dart';

class PantoneColorsScreen extends StatefulWidget {
  final PantoneColorRepository repository;

  const PantoneColorsScreen({
    Key key,
    @required this.repository,
  }) : super(key: key);

  @override
  _PantoneColorsScreenState createState() => _PantoneColorsScreenState();
}

class _PantoneColorsScreenState extends State<PantoneColorsScreen> {
  Future<PantoneColorFeed> _colors;

  @override
  void initState() {
    _colors = widget.repository.colors();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).colors),
      ),
      body: FutureBuilder<PantoneColorFeed>(
        future: _colors,
        builder: (context, snapshot) {
          return AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: _buildContent(snapshot),
          );
        },
      ),
    );
  }

  Widget _buildContent(AsyncSnapshot<PantoneColorFeed> snapshot) {
    if (snapshot.hasData) {
      final feed = snapshot.data;

      return ListView.builder(
          itemCount: feed.colors.length,
          itemBuilder: (context, index) {
            final color = feed.colors[index];

            return ListTile(
              title: Text(color.name),
              subtitle: Text(color.pantoneValue),
            );
          });
    } else if (snapshot.hasError) {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.warning),
            SizedBox(height: 16),
            Text(AppLocalizations.of(context).loadingColorsError),
          ],
        ),
      );
    }

    return Center(child: CircularProgressIndicator());
  }
}
