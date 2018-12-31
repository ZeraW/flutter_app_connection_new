import 'package:flutter/material.dart';
import 'package:flutter_app_connection/first_screen.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Heroes extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final AssetImage imageLocation;

  Heroes(
      {Key key,
      @required this.name,
      @required this.color,
      @required this.imageLocation})
      : assert(name != null),
        assert(color != null),
        assert(imageLocation != null),
        super(key: key);

  void _navigateToDetails(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
      builder: (BuildContext context) {
        return Scaffold(
          body: DetailsScreen(
            color: color,
            name: name,
            imageLocation: imageLocation,
          ),
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    final getRow = Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Image(image: imageLocation),
          ),
          Center(
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline,
            ),
          )
        ],
      ),
    );

    return Material(
      color: Colors.transparent,
      child: Container(
          height: _rowHeight,
          child: InkWell(
            borderRadius: _borderRadius,
            highlightColor: color,
            splashColor: color,
            onTap: () => _navigateToDetails(context),
            child: getRow,
          )),
    );
  }
}
