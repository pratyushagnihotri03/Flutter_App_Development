import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Tutorial',
    home: TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset('assets/lake.jpg',
                width: 600, height: 240, fit: BoxFit.cover),
            _titleSelection,
            _buttonSection,
            _textSection
          ],
        ),
      ),
    );
  }
}

/*
1. Putting a Column inside an Expanded widget stretches the column to use all remaining free space in the row. Setting the crossAxisAlignment property to CrossAxisAlignment.start positions the column at the start of the row.
2. Putting the first row of text inside a Container enables you to add padding. The second child in the Column, also text, displays as grey.
3. The last two items in the title row are a star icon, painted red, and the text “41”. The entire row is in a Container and padded along each edge by 32 pixels. Add the title section to the app body like this:
Reference: https://flutter.dev/docs/development/ui/layout/tutorial
 */
Widget _titleSelection = Container(
  padding: const EdgeInsets.all(32),
  child: Row(
    children: [
      Expanded(
        /*1*/
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /*2*/
            Container(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Oeschinen Lake Campground',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              'Kandersteg, Switzerland',
              style: TextStyle(color: Colors.grey[500]),
            ),
          ],
        ),
      ),
      /*3*/
      Icon(Icons.star, color: Colors.red[500]),
      Text('41'),
    ],
  ),
);

Column _buildButtonColumn(Color color, IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(icon, color: color),
      Container(
        margin: const EdgeInsets.only(top: 8),
        child: Text(
          label,
          style: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w400, color: color),
        ),
      ),
    ],
  );
}

Widget _buttonSection = Container(
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      _buildButtonColumn(Colors.blueAccent, Icons.call, 'CALL'),
      _buildButtonColumn(Colors.blueAccent, Icons.near_me, 'ROUTE'),
      _buildButtonColumn(Colors.blueAccent, Icons.share, 'SHARE'),
    ],
  ),
);

Widget _textSection = Container(
  padding: const EdgeInsets.all(32),
  child: Text(
    'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
    'Alps. Situated 1,578 meters above sea level, it is one of the '
    'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
    'half-hour walk through pastures and pine forest, leads you to the '
    'lake, which warms to 20 degrees Celsius in the summer. Activities '
    'enjoyed here include rowing, and riding the summer toboggan run.',
    softWrap: true,
  ),
);
