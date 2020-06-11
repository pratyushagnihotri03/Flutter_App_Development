import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = true; // Remove to suppress visual layout
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        // Change to buildFoo() for the other examples
        body: Center(child: buildExpandedassets()),
      ),
    );
  }

  Widget buildOverflowingRow() =>
      // #docregion overflowing-row
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image.asset('assets/pic1.jpg'),
      Image.asset('assets/pic2.jpg'),
      Image.asset('assets/pic3.jpg'),
    ],
  );
  // #enddocregion overflowing-row

  Widget buildExpandedassets() =>
      // #docregion expanded-assets
  Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Image.asset('assets/pic1.jpg'),
      ),
      Expanded(
        child: Image.asset('assets/pic2.jpg'),
      ),
      Expanded(
        child: Image.asset('assets/pic3.jpg'),
      ),
    ],
  );
  // #enddocregion expanded-assets

  Widget buildExpandedassetsWithFlex() =>
      // #docregion expanded-assets-with-flex
  Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Expanded(
        child: Image.asset('assets/pic1.jpg'),
      ),
      Expanded(
        flex: 2,
        child: Image.asset('assets/pic2.jpg'),
      ),
      Expanded(
        child: Image.asset('assets/pic3.jpg'),
      ),
    ],
  );
// #enddocregion expanded-assets-with-flex
}