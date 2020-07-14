import 'package:auto_size_text/auto_size_text.dart';

import 'package:covid_19/misc/helper.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class SummaryCard extends StatelessWidget {
  static const int CHART_LENGTH = 15;
  final int totalValue;
  final int todayChange;
  final String name;

  final Color cardColor;
  final Alignment cardImageAlignment;
  final String lastUpdatedTime;
  final NumberFormat numberFormatter = new NumberFormat("##,##,##,##,###");

  SummaryCard({
    @required this.totalValue,
    @required this.name,
    @required this.todayChange,

    @required this.lastUpdatedTime,
    this.cardColor = Colors.white,
    this.cardImageAlignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: name,
      transitionOnUserGestures: true,
      child: Material(
        type: MaterialType.transparency,
        child: IntrinsicHeight(
          child: Container(
            height: 200,
            // padding: EdgeInsets.symmetric(
            //   horizontal: 10,
            //   vertical: 10,
            // ),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: cardColor,

              borderRadius: BorderRadius.all(Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 24,
                  spreadRadius: 0,
                  color: cardColor.withAlpha(200),
                  offset: Offset(4, 8),
                ),
              ],
            ),
            child: IntrinsicHeight(
              child: Material(
                type: MaterialType.transparency,
                child: InkWell(
                  // behavior: HitTestBehavior.translucent,
                  onTap: () {

                  },
                  borderRadius: BorderRadius.circular(16),
                  splashColor: Colors.white.withOpacity(0.4),
                  highlightColor: Colors.white.withOpacity(0.2),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white.withAlpha(200),
                              ),
                            ),
                            Text(
                              todayChange.isNegative ? Helper.formatNumber(todayChange) : "+" + Helper.formatNumber(todayChange),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  AutoSizeText(
                                    Helper.formatNumber(totalValue),
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                    ),
                                    maxLines: 1,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            child: showChart(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget showChart() {
    //todo: show chart here


    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(48),
        ),
      ),

    );
  }


}
