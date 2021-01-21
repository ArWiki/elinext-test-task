import 'package:elinext_test_task/presentation/utils/images.dart';
import 'package:elinext_test_task/presentation/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'country_bloc.dart';
import 'country_event.dart';
import 'tile/country_tile.dart';

class CountryScreen extends StatefulWidget {
  CountryScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  final _bloc = CountryBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: _bloc.country,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          final List<CountryTile> list = snapshot.data;

          return list == null
              ? Container(
                  height: 0.0,
                  width: 0.0,
                )
              : RefreshIndicator(
                  child: ListView.builder(
                    itemCount: list.length,
                    padding: EdgeInsets.all(20),
                    itemBuilder: (ctx, index) {
                      final tile = list[index];
                      return _listTile(tile);
                    },
                  ),
                  onRefresh: () async {
                    _bloc.counterEventSink.add(OnCountryRefresh());
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bloc.counterEventSink.add(OpenCountryFavourite()),
        tooltip: 'Increment',
        child: Icon(Icons.star_rate),
      ),
    );
  }

  _listTile(CountryTile tile) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/CountryDetails', arguments: tile),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0,
                spreadRadius: 6.0,
              ),
            ],
          ),
          child: IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.all(25),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text(
                      tile.title,
                      style: AppTextStyles.black14(
                        fontWeight: AppFonts.bold,
                      ),
                    ),
                  ),
                  tile.urlToImage == null
                      ? Image.asset(
                          AppImages.no_image_available,
                        )
                      : Image.network(
                          tile.urlToImage,
                          //style: AppTextStyles.greyDark12(),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   final _bloc = CountryBloc();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: StreamBuilder(
//           stream: _bloc.counter,
//           initialData: 0,
//           builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   'You have pushed the button this many times:',
//                 ),
//                 Text(
//                   '${snapshot.data}',
//                   style: Theme.of(context).textTheme.display1,
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           FloatingActionButton(
//             onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
//             tooltip: 'Increment',
//             child: Icon(Icons.add),
//           ),
//           SizedBox(width: 10),
//           FloatingActionButton(
//             onPressed: () => _bloc.counterEventSink.add(DecrementEvent()),
//             tooltip: 'Decrement',
//             child: Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _bloc.dispose();
//   }
// }
