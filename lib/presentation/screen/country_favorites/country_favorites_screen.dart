import 'package:elinext_test_task/presentation/screen/country/tile/country_tile.dart';
import 'package:elinext_test_task/presentation/utils/images.dart';
import 'package:elinext_test_task/presentation/utils/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'country_favorites_bloc.dart';
import 'country_favorites_event.dart';

class CountryFavoritesScreen extends StatefulWidget {
  CountryFavoritesScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CountryFavoritesScreenState createState() => _CountryFavoritesScreenState();
}

class _CountryFavoritesScreenState extends State<CountryFavoritesScreen> {
  final _bloc = GetIt.I.get<CountryFavoritesBloc>();
  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: _bloc.countryFavorites,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          final List<CountryTile> list = snapshot.data;

          return list == null
              ? Container(
                  height: 0.0,
                  width: 0.0,
                )
              : SmartRefresher(
                  enablePullDown: false,
                  enablePullUp: true,
                  child: ListView.builder(
                    itemCount: list.length,
                    padding: EdgeInsets.all(20),
                    itemBuilder: (ctx, index) {
                      final tile = list[index];
                      return _listTile(tile);
                    },
                  ),
                  onLoading: () async {
                    _bloc.countryFavoritesEventSink
                        .add(OnCountryFavoritesRefresh());
                    _refreshController.loadComplete();
                  },
                  onRefresh: () async {
                    _bloc.countryFavoritesEventSink
                        .add(OnCountryFavoritesRefresh());
                  },
                  controller: _refreshController,
                );
        },
      ),
    );
  }

  _listTile(CountryTile tile) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, '/CountryDetails', arguments: tile),
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
    _refreshController.dispose();
    _bloc.dispose();
    super.dispose();
  }
}
