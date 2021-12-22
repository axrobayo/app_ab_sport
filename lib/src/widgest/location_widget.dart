import 'package:flutter/material.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  String _fontFamily = "Roboto";
  final String _fontNexa = "Nexa";
  final String _fontAkrobat = "Akrobat";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () {
                  _fontFamily = _fontAkrobat;
                  setState(() {});
                },
                child: Text(_fontAkrobat,
                    style: TextStyle(fontFamily: _fontAkrobat))),
            const SizedBox(width: 25.0),
            ElevatedButton(
                onPressed: () {
                  _fontFamily = _fontNexa;
                  setState(() {});
                },
                child:
                    Text(_fontNexa, style: TextStyle(fontFamily: _fontNexa))),
          ]),
          Text('Bodytext 1',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontFamily: _fontFamily)),
          Text('Bodytext 2',
              style: Theme.of(context)
                  .textTheme
                  .headline5!
                  .copyWith(fontFamily: _fontFamily))
        ],
      ),
    );
  }
}
