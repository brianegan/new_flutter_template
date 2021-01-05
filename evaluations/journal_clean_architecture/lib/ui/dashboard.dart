import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:journal_clean_architecture/domain/entities/journal_entry.dart';
import 'package:journal_clean_architecture/domain/services/journal_service.dart';
import 'package:journal_clean_architecture/ui/error_view.dart';

class Dashboard extends StatefulWidget {
  final VoidCallback onAddEntryTap;
  final VoidCallback onSettingsTap;
  final void Function(String id) onEntryTap;
  final JournalService journalService;

  Dashboard({
    Key key,
    @required this.onAddEntryTap,
    @required this.onSettingsTap,
    @required this.onEntryTap,
    @required this.journalService,
  }) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedTabIndex = 0;
  Future<List<JournalEntry>> _entries;

  @override
  void initState() {
    _entries = widget.journalService.entries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appTitle),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: widget.onSettingsTap,
          ),
        ],
      ),
      body: FutureBuilder<List<JournalEntry>>(
        future: _entries,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.isNotEmpty) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  final entry = snapshot.data[index];

                  return ListTile(
                    title: Text(entry.title),
                    onTap: () => widget.onEntryTap(entry.id),
                  );
                },
              );
            } else {
              return Center(child: Text("No Journal Entries"));
            }
          } else if (snapshot.hasError) {
            return ErrorView(
              message: "Oh no! There was an error loading the journal :(",
            );
          }

          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.onAddEntryTap,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: AppLocalizations.of(context).entries,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: AppLocalizations.of(context).favorites,
          )
        ],
        onTap: (index) {
          setState(() {
            _selectedTabIndex = index;
          });
        },
        currentIndex: _selectedTabIndex,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
