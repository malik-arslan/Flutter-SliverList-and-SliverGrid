import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:math' as math;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Collapsing List Demo")),
        body: CollapsingList(),
      ),
    );
  }
}

class CollapsingList extends StatelessWidget {
  const CollapsingList({Key key}) : super(key: key);

  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
        pinned: true,
        delegate: _SliverAppBarDelegate(
            minHeight: 60,
            maxHeight: 200,
            child: Container(
              child: Image.asset(
                headerText,
                fit: BoxFit.fill,
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        makeHeader("assets/fruit header.jpg"),
        SliverGrid.count(
          crossAxisCount: 3,
          children: [
            InkWell(
              child: Image.asset(
                "assets/1.jpg",
                fit: BoxFit.fill,
              ),
              onTap: null,
            ),
            InkWell(
              child: Image.asset(
                "assets/2.jpg",
                fit: BoxFit.fill,
              ),
              onTap: null,
            ),
            InkWell(
              child: Image.asset(
                "assets/3.jpg",
                fit: BoxFit.fill,
              ),
              onTap: null,
            ),
            InkWell(
              child: Image.asset(
                "assets/4.jpg",
                fit: BoxFit.fill,
              ),
              onTap: null,
            ),
            InkWell(
              child: Image.asset(
                "assets/5.jpg",
                fit: BoxFit.fill,
              ),
              onTap: null,
            ),
            InkWell(
              child: Image.asset(
                "assets/6.jpg",
                fit: BoxFit.fill,
              ),
              onTap: null,
            ),
            InkWell(
              child: Image.asset(
                "assets/7.jpg",
                fit: BoxFit.fill,
              ),
              onTap: null,
            ),
            InkWell(
              child: Image.asset(
                "assets/8.jpg",
                fit: BoxFit.fill,
              ),
              onTap: null,
            ),
            InkWell(
              child: Image.asset(
                "assets/9.jpg",
                fit: BoxFit.fill,
              ),
              onTap: null,
            ),
          ],
        ),
        makeHeader("assets/vegetables header.jpg"),
        SliverFixedExtentList(
            delegate: SliverChildListDelegate([
              InkWell(
                child: Image.asset(
                  "assets/10.jpg",
                  fit: BoxFit.fill,
                ),
                onTap: null,
              ),
              InkWell(
                child: Image.asset(
                  "assets/11.jpg",
                  fit: BoxFit.fill,
                ),
                onTap: null,
              ),
              InkWell(
                child: Image.asset(
                  "assets/12.jpg",
                  fit: BoxFit.fill,
                ),
                onTap: null,
              ),
              InkWell(
                child: Image.asset(
                  "assets/13.jpg",
                  fit: BoxFit.fill,
                ),
                onTap: null,
              ),
            ]),
            itemExtent: 200.0),
        makeHeader("assets/sweet.jpg"),
        SliverGrid(
          delegate: new SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return new Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: new Text(
                  "Sweet Dish $index",
                  style: new TextStyle(fontSize: 20),
                ),
              );
            },
            childCount: 20,
          ),
          gridDelegate: new SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 2.0),
        ),
        makeHeader('assets/color.png'),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                color: Colors.pink,
                height: 150,
              ),
              Container(
                color: Colors.cyan,
                height: 150,
              ),
              Container(
                color: Colors.indigo,
                height: 150,
              ),
              Container(
                color: Colors.blue,
                height: 150,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;
  _SliverAppBarDelegate(
      {@required this.minHeight,
      @required this.maxHeight,
      @required this.child});

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
