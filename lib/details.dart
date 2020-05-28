import 'package:flutter/material.dart';
import 'main.dart';

class PageTwo extends StatelessWidget {
  var id, title, description_short, description, text, imageURL;
  PageTwo(
      {Key key,
      this.id,
      this.title,
      this.description_short,
      this.description,
      this.text,
      this.imageURL})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details'),
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(id.toString(),
                    style: TextStyle(color: Colors.blue, fontSize: 20)),
                SizedBox(height: 10),
                Text(title.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                SizedBox(height: 10),
                Text(description_short.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                SizedBox(height: 10),
                Text(description.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 14)),
                SizedBox(height: 10),
                Text(text.toString(),
                    style: TextStyle(color: Colors.black, fontSize: 12)),
                SizedBox(height: 10),
                Image.network(imageURL),
                SizedBox(height: 10),
                RaisedButton(
                  child: Text('Back'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
