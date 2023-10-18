import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Weather Forecast",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.red,
          ),
        ),
        body: _buildBody(),
        backgroundColor: Colors.red,
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _searchInput(),
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _weatherDescription(),
              _temperature(),
              _temperatureForecast(),
              const Text(
                '7-DAYS WEATHER FORECAST',
                style: TextStyle(color: Colors.white),
              ),
              _footerRatings()
            ],
          ),
        ))
      ],
    ),
  );
}

Container _searchInput() {
  return Container(
      padding: const EdgeInsets.all(25),
      child: SizedBox(
        child: TextFormField(
            decoration: const InputDecoration(
          icon: Icon(Icons.search),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelText: 'Enter City Name',
          iconColor: Colors.white,
          labelStyle: TextStyle(color: Colors.white),
        )),
      ));
}

Column _weatherDescription() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      Text(
        'Nurmansk Oblast, RU',
        style: TextStyle(
            fontSize: 32, fontWeight: FontWeight.w300, color: Colors.white),
      ),
      Padding(padding: EdgeInsets.only(top: 10)),
      Text(
        'Friday, Mar 20, 2023',
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
      ),
      Padding(padding: EdgeInsets.only(top: 60)),
    ],
  );
}

Row _temperature() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.wb_sunny,
            color: Colors.white,
            size: 66,
          ),
        ],
      ),
      SizedBox(
        width: 16.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                '14* F',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                    fontWeight: FontWeight.w100),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                'Light snow',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w300),
              ),
            ],
          )
        ],
      )
    ],
  );
}

Wrap _temperatureForecast() {
  return Wrap(spacing: 10.0, children: <Widget>[
    Container(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(36),
              child: const Column(
                children: [
                  Icon(
                    Icons.ac_unit,
                    color: Colors.white,
                    size: 34,
                  ),
                  Text(
                    '32',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text('night', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(36),
              child: const Column(
                children: [
                  Icon(
                    Icons.ac_unit,
                    color: Colors.white,
                    size: 34,
                  ),
                  Text(
                    '32',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text('night', style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(36),
              child: const Column(
                children: [
                  Icon(
                    Icons.ac_unit,
                    color: Colors.white,
                    size: 34,
                  ),
                  Text(
                    '32',
                    style: TextStyle(color: Colors.red),
                  ),
                  Text('night', style: TextStyle(color: Colors.white)),
                ],
              ),
            )
          ],
        )),
  ]);
}

Widget _footerRatings() {
  return SizedBox(
    height: 120,
    width: 900,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 7,
      itemBuilder: (BuildContext context, int index) {
        var ctx = <String>[
          'Monday',
          'Tuesday',
          'Wendsday',
          'Thursday',
          'Friday',
          'Sunday',
          'Saturday'
        ];
        return SizedBox(
          width: 150,
          height: 150,

          // set a value,
          child: Container(
              margin: EdgeInsets.all(5),
              color: Color(0x54d2d2d2),
              padding: EdgeInsets.all(15),
              child: Column(children: [
                Center(
                    child: Text(
                  '${ctx[index]}',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${index + 10}',
                          style: TextStyle(color: Colors.white, fontSize: 28)),
                      Icon(
                        Icons.sunny,
                        color: Colors.white,
                        size: 22,
                      )
                    ],
                  ),
                )
              ])),
        );
      },
    ),
  );
}
