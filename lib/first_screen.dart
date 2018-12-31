import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final AssetImage imageLocation;
  List data;

  DetailsScreen(
      {@required this.name, @required this.color, @required this.imageLocation})
      : assert(name != null),
        assert(color != null),
        assert(imageLocation != null);

  void callFun(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Calling ${name}"),
      content: Text("Please Wait..."),
    );

    showDialog(context: context, builder: (BuildContext) => alertDialog);
  }








  @override
  Widget build(BuildContext context) {
    final _imageAssest = Container(
        child: Image(image: imageLocation), margin: EdgeInsets.only(top: 10.0));

    final _btn = Container(
      padding: EdgeInsets.all(5),
      child: RaisedButton(
        color: Colors.deepPurple,
        child: Text(
          "Call Me",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 6.0,
        onPressed: () => debugPrint(""),
      ),
      margin: EdgeInsets.only(top: 20.0),
      width: 150.0,
    );

    // TODO: implement build
    return Material(
        color: Colors.amberAccent, //Activity background color
        child: Center(
          child: Container(
            //width: 200.0,
            //height: 200.0,
            margin: EdgeInsets.only(top: 30.0),
            padding: EdgeInsets.only(left: 20.0, top: 10.0),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text("Call ${name}",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                        color: Colors.deepPurpleAccent,
                        fontSize: 40.0,
                        fontFamily: "Roboto")),
                _imageAssest,
                _btn
              ],
            ),
          ),
        ));
  }
}

/*class ImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var image = Image(image: AssetImage('images/Mt._Lady_anime_portrait.png'));

    return Container(
      child: image,
      margin: EdgeInsets.only(top: 10.0),
    );
  }
}

class Btn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = RaisedButton(
      color: Colors.deepPurple,
      child: Text(
        "Call Me",
        style: TextStyle(color: Colors.white),
      ),
      elevation: 6.0,
      onPressed: () => callFun(context),
    );

    return Container(
      padding: EdgeInsets.all(5),
      child: button,
      margin: EdgeInsets.only(top: 20.0),
      width: 150.0,
    );
  }

  void callFun(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text("Calling Mt. Lady"),
      content: Text("Please Wait..."),
    );

    showDialog(context: context, builder: (BuildContext) => alertDialog);
  }
}*/
