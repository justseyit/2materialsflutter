import 'package:candidateapp/first_app/tabs/favstab.dart';
import 'package:candidateapp/first_app/tabs/hometab.dart';
import 'package:candidateapp/widgets/app_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class FirstAppHomePage extends StatefulWidget {
  const FirstAppHomePage({Key? key}) : super(key: key);

  @override
  State<FirstAppHomePage> createState() => _FirstAppHomePageState();
}

class _FirstAppHomePageState extends State<FirstAppHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  static const List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    FavsTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favorites',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: _onItemTapped,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppLocalizations.of(context)?.theFirstApp ?? 'The First App'),
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => CaAlertDialog(
                title: Text(AppLocalizations.of(context)!.selectFilter),
                content: const SizedBox(),
              )
            ),
          )
        ],
      ),
    );
  }
}