import 'package:candidateapp/app_constants.dart';
import 'package:candidateapp/first_app/tabs/favstab.dart';
import 'package:candidateapp/first_app/tabs/hometab.dart';
import 'package:candidateapp/models/filters/activity_no_filter.dart';
import 'package:candidateapp/models/filters/activity_participants.dart';
import 'package:candidateapp/models/filters/activity_price.dart';
import 'package:candidateapp/models/filters/activity_type.dart';
import 'package:candidateapp/models/filters/filter.dart';
import 'package:candidateapp/repositories/bored_activity_repository.dart';
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
  FilterType _selectedFilterType = FilterType.none;

  void _changeFilterType(FilterType filterType) {
    _selectedFilterType = filterType;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[HomeTab(), FavsTab()];

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
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.favorite_border),
          label: AppLocalizations.of(context)!.favorites,
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(AppLocalizations.of(context)!.theFirstApp),
          () {
            if (_selectedIndex == 0) {
              return IconButton(
                icon: const Icon(Icons.filter_alt_outlined),
                onPressed: filterButtonPressed,
              );
            } else {
              return const SizedBox();
            }
          }()
        ],
      ),
    );
  }

  void filterButtonPressed() {
    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) {
          return CaAlertDialog(
            title: Text(AppLocalizations.of(context)!.selectFilter),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(AppLocalizations.of(context)!.noFilter),
                          leading: Radio<FilterType>(
                            value: FilterType.none,
                            groupValue: _selectedFilterType,
                            onChanged: (FilterType? filterType) {
                              _changeFilterType(filterType!);
                              setState(() {});
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(AppLocalizations.of(context)!.priceFilter),
                          leading: Radio<FilterType>(
                            value: FilterType.price,
                            groupValue: _selectedFilterType,
                            onChanged: (FilterType? filterType) {
                              _changeFilterType(filterType!);
                              setState(() {});
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(AppLocalizations.of(context)!.participantsFilter),
                          leading: Radio<FilterType>(
                            value: FilterType.participants,
                            groupValue: _selectedFilterType,
                            onChanged: (FilterType? filterType) {
                              _changeFilterType(filterType!);
                              setState(() {});
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(AppLocalizations.of(context)!.activityTypeFilter),
                          leading: Radio<FilterType>(
                            value: FilterType.activityType,
                            groupValue: _selectedFilterType,
                            onChanged: (FilterType? filterType) {
                              _changeFilterType(filterType!);
                              setState(() {});
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(thickness: 5,),
                  SizedBox(
                    child: (){
                      switch(_selectedFilterType){
                        case FilterType.none:
                          BoredActivityRepository.instance.currentFilter = ActivityNoFilter();
                          return const SizedBox();

                        case FilterType.price:
                          BoredActivityRepository.instance.currentFilter = ActivityPriceFilter(minPrice: _priceRangeValues.start/AppConstants.apiPriceRate, maxPrice: _priceRangeValues.end/AppConstants.apiPriceRate);
                          return priceFilter();

                        case FilterType.participants:
                          BoredActivityRepository.instance.currentFilter = ActivityParticipantsFilter(participants: _participantsValue.toInt());
                          return participantsFilter();

                        case FilterType.activityType:
                          BoredActivityRepository.instance.currentFilter = ActivityTypeFilter(activityType: _actType);
                          return typeFilter();
                      }
                    }(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  //#region Price Range Filter
  RangeValues _priceRangeValues = const RangeValues(0, 200);

  Widget priceFilter(){
    return StatefulBuilder(
      builder: (context, setState) {
        return SizedBox(
          child: Column(
            children: [
              Text(AppLocalizations.of(context)!.priceFilter),
              CheckboxListTile(
                title: Text(AppLocalizations.of(context)!.convertToTRY),
                value: BoredActivityRepository.instance.convertPricesToTRY,
                onChanged: (value){
                  setState((){
                    if(value == false){
                      _priceRangeValues = RangeValues(_priceRangeValues.start/AppConstants.usdToTryRate, _priceRangeValues.end/AppConstants.usdToTryRate);
                    }else{
                      _priceRangeValues = RangeValues(_priceRangeValues.start*AppConstants.usdToTryRate, _priceRangeValues.end*AppConstants.usdToTryRate);
                    }
                    BoredActivityRepository.instance.convertPricesToTRY = value!;

                    BoredActivityRepository.instance.currentFilter = ActivityPriceFilter(minPrice: _priceRangeValues.start/AppConstants.apiPriceRate, maxPrice: _priceRangeValues.end/AppConstants.apiPriceRate);
                  });
                },
              ),
              RangeSlider(
                values: _priceRangeValues,
                max: BoredActivityRepository.instance.convertPricesToTRY == true ? AppConstants.apiPriceRate*AppConstants.usdToTryRate : AppConstants.apiPriceRate,
                divisions: AppConstants.apiPriceRate.toInt(),
                labels: RangeLabels(
                  _priceRangeValues.start.round().toString(),
                  _priceRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _priceRangeValues = values;
                  });
                  BoredActivityRepository.instance.currentFilter = ActivityPriceFilter(minPrice: _priceRangeValues.start/AppConstants.apiPriceRate, maxPrice: _priceRangeValues.end/AppConstants.apiPriceRate);
                },
              ),
            ],
          ),
        );
      }
    );
  }
  //#endregion


  //#region Participants Filter
  double _participantsValue = 5;

  Widget participantsFilter(){
    return StatefulBuilder(
        builder: (context, setState) {
          return SizedBox(
            child: Column(
              children: [
                Text(AppLocalizations.of(context)!.participantsFilter),
                Slider(
                  value: _participantsValue,
                  max: 5,
                  min: 1,
                  divisions: 4,
                  label: _participantsValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _participantsValue = value.roundToDouble();
                    });
                    BoredActivityRepository.instance.currentFilter = ActivityParticipantsFilter(participants: _participantsValue.toInt());
                  },
                ),
              ],
            ),
          );
        }
    );
  }
  //#endregion


  //#region Activity Type Filter
  String _actType = 'recreational';

  Widget typeFilter(){
    return StatefulBuilder(
        builder: (context, setState) {
          return SizedBox(
            child: Column(
              children: [
                Text(AppLocalizations.of(context)!.activityTypeFilter),
                DropdownButton<String>(
                  value: _actType,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  //style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _actType = newValue!;
                    });
                    BoredActivityRepository.instance.currentFilter = ActivityTypeFilter(activityType: _actType);
                  },
                  items: ActivityTypes.all.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        }
    );
  }
  //#endregion

}
