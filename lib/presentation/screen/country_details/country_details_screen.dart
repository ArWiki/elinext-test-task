import 'package:elinext_test_task/presentation/screen/country/tile/country_tile.dart';
import 'package:elinext_test_task/presentation/utils/images.dart';
import 'package:elinext_test_task/presentation/utils/text_style.dart';
import 'package:flutter/material.dart';

import 'country_details_bloc.dart';
import 'country_details_event.dart';

class CountryDetailsScreen extends StatefulWidget {
  CountryDetailsScreen({
    @required this.tile,
    Key key,
    this.title,
  }) : super(key: key);

  final CountryTile tile;

  final String title;

  @override
  _CountryDetailsScreenState createState() => _CountryDetailsScreenState(tile);
}

class _CountryDetailsScreenState extends State<CountryDetailsScreen> {
  final CountryTile tile;

  _CountryDetailsScreenState(this.tile);

  final _bloc = CountryDescriptionBlocImpl();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: tile == null
          ? Container(
              height: 0.0,
              width: 0.0,
            )
          : _tile(tile),
    );
  }

  _tile(CountryTile tile) {
    return Padding(
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
            child: tile == null
                ? Container(
                    width: 0.0,
                    height: 0.0,
                  )
                : Column(
                    children: [
                      _header(tile),
                      _mainContent(tile),
                      _footer(tile),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _header(CountryTile tile) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            tile.source == null || tile.source.name == null
                ? Container(
                    width: 0.0,
                    height: 0.0,
                  )
                : Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: Text(
                      tile.source.name,
                      style: AppTextStyles.black14(
                        fontWeight: AppFonts.bold,
                      ),
                    ),
                  ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                child: Icon(Icons.star_border),
              ),
            ),
          ],
        ),
        tile.title == null
            ? Container(
                width: 0.0,
                height: 0.0,
              )
            : Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  tile.title,
                  style: AppTextStyles.black14(
                    fontWeight: AppFonts.bold,
                  ),
                ),
              ),
      ],
    );
  }

  Widget _mainContent(CountryTile tile) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tile.urlToImage == null
            ? Container(
                width: 0.0,
                height: 0.0,
              )
            : Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: tile.urlToImage == null
                    ? Image.asset(
                        AppImages.no_image_available,
                      )
                    : Image.network(
                        tile.urlToImage,
                        //style: AppTextStyles.greyDark12(),
                      ),
              ),
        tile.description == null
            ? Container(
                width: 0.0,
                height: 0.0,
              )
            : Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  tile.description,
                  style: AppTextStyles.black14(
                    fontWeight: AppFonts.regular,
                  ),
                ),
              ),
        tile.content == null
            ? Container(
                width: 0.0,
                height: 0.0,
              )
            : Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Text(
                  tile.content,
                  style: AppTextStyles.black14(
                    fontWeight: AppFonts.regular,
                  ),
                ),
              ),
        tile.url == null
            ? Container(
                width: 0.0,
                height: 0.0,
              )
            : Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: GestureDetector(
                  onTap: () => _bloc.counterEventSink
                      .add(OpenCountryDescriptionNews(tile.url)),
                  child: Text(
                    tile.url,
                    style: AppTextStyles.blue14(
                      fontWeight: AppFonts.regular,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
      ],
    );
  }

  Widget _footer(CountryTile tile) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        tile.author == null
            ? Container(
                width: 0.0,
                height: 0.0,
              )
            : Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    tile.author,
                    style: AppTextStyles.black14(
                      fontWeight: AppFonts.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
        tile.publishedAt == null
            ? Container(
                width: 0.0,
                height: 0.0,
              )
            : Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    tile.publishedAt,
                    style: AppTextStyles.black14(
                      fontWeight: AppFonts.regular,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }
}
