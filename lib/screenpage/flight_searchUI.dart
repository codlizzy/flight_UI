import 'package:flutter/material.dart';

import 'airport_info.dart';

class FlightSearchUI extends StatefulWidget {
  const FlightSearchUI({Key? key}) : super(key: key);

  @override
  State<FlightSearchUI> createState() => _FlightSearchUIState();
}

enum TripType {
  oneway,
  rountrip,
  multicity,
}

Map<TripType, String> _tripTypes = {
  TripType.oneway: 'ONEWAY',
  TripType.rountrip: 'ROUNTRIP',
  TripType.multicity: 'MULTICITY',
};

class _FlightSearchUIState extends State<FlightSearchUI> {
  TripType _selectedTrip = TripType.oneway;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        // there are two text flight and search with different text styles
        title: RichText(
          text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: 32),
            children: [
              TextSpan(
                text: 'Flight',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w300),
              ),
              // search
              TextSpan(
                text: 'Search',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(58),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(21),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(
                            0,
                            6,
                          ),
                          blurRadius: 6)
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(_tripTypes.length, (index) {
                    return buildTripTypeSelector(
                        _tripTypes.keys.elementAt(index));
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              height: 20,
            ),
            TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.all(24)),
              onPressed: () {},
              child: buildAirportSelector(
                  AirportInfo(
                    'BOM',
                    'Find transport links to UK. ',
                    'Mumbai',
                  ),
                  Icons.flight_takeoff),
            ),
            Container(
              height: 1,
              color: Colors.black26,
            ),
            TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.all(24)),
              onPressed: () {},
              child: buildAirportSelector(
                  AirportInfo(
                    ' DEL',
                    'Find transport links to UK.',
                    'New Delhi',
                  ),
                  Icons.flight_land),
            ),
            Container(
              height: 1,
              color: Colors.black26,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        backgroundColor: Colors.white),
                    onPressed: () {},
                    child: buildDateSelector('DEPARTITE', DateTime.now()),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        backgroundColor: Colors.white),
                    onPressed: () {},
                    child: buildDateSelector(
                        'RETURN', DateTime.now().add(Duration(days: 10))),
                  ),
                ),
              ],
            ),
            Container(
              height: 1,
              color: Colors.black26,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        backgroundColor: Colors.white),
                    onPressed: () {},
                    child: buildTravelersView(),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        backgroundColor: Colors.white),
                    onPressed: () {},
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'CABIN CLASS',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            Text(
                              'ECONOMY\nCLASS',
                              style:
                                  TextStyle(fontSize: 24, color: Colors.black),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 12),
                            blurRadius: 12,
                          ),
                        ],
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.elliptical(
                              MediaQuery.of(context).size.width * 2, 110),
                        ))),
                Center(
                  child: Material(
                    color: Colors.blue,
                    shape: CircleBorder(),
                    clipBehavior: Clip.antiAlias,
                    elevation: 13,
                    child: InkWell(
                      onTap: () {},
                      splashColor: Colors.orange,
                      child: Container(
                        width: 100,
                        height: 100,
                        alignment: Alignment.center,
                        child: Text(
                          'SEARCH',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTripTypeSelector(TripType tripType) {
    var isSelected = _selectedTrip == tripType;
    return TextButton(
      onPressed: () {
        setState(() {
          _selectedTrip = tripType;
        });
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              isSelected ? Colors.blue : Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          )),
      child: Row(
        children: <Widget>[
          if (isSelected)
            Icon(
              Icons.check_circle,
              color: Colors.white,
            ),
          Text(
            _tripTypes[tripType]!,
            style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget buildAirportSelector(AirportInfo airportInfo, IconData iconData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // airportCode
        Container(
          width: 60,
          child: Text(
            airportInfo.airportCode!,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 24,
                color: Colors.black54),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              airportInfo.airportLongName!,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              airportInfo.airportShortName!,
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ],
        ),
        Icon(
          iconData,
          color: Colors.black,
          size: 25,
        ),
      ],
    );
  }

  Widget buildDateSelector(String title, DateTime dateTime) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
        Row(
          children: <Widget>[
            Text(
              dateTime.day.toString().padLeft(2, '0'),
              style: TextStyle(color: Colors.black, fontSize: 48),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Jan 2022',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                Text(
                  'Friday',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget buildTravelersView() {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'TRAVELLERS',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            Text(
              '01',
              style: TextStyle(fontSize: 48, color: Colors.black),
            )
          ],
        )
      ],
    );
  }
}
