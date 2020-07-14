import 'package:covid_19/data/models/custom_radio_model.dart';

import 'package:covid_19/ui/widgets/custom_radio_button.dart';
import 'package:covid_19/ui/widgets/date_value.dart';
import 'package:flutter/material.dart';

class LineChartCumulative extends StatefulWidget {
  final String name;
  final int totalValue;

  final Color chartColor;
  LineChartCumulative({Key key, @required this.name, @required this.totalValue,  @required this.chartColor}) : super(key: key);

  @override
  _LineChartCumulativeState createState() => _LineChartCumulativeState();
}

class _LineChartCumulativeState extends State<LineChartCumulative> {
  int valueDivider = 10000;
  double valueMultiplier = 10;
  int chartLength = 14;
  int selectedValue = 14;
  String name;
  int totalValue;

  Color chartColor;
  String selectedDate;
  int selectedCount;
  double touchedSpotXValue;
  bool isSpotSelected;

  // DateValue dateValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.name = widget.name;
    this.totalValue = widget.totalValue;

    this.chartColor = widget.chartColor;
    this.isSpotSelected = false;

    updateValueDividerAndMultiplier(this.totalValue);
    this.touchedSpotXValue = (chartLength - 1).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return showChart(context);
  }

  Widget showChart(BuildContext context) {
    //todo: show chart here

    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 6,
                left: 16,
                right: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Cumulative",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: chartColor.withOpacity(0.75),
                    ),
                  ),
                  isSpotSelected
                      ? DateValue(
                          selectedDate: selectedDate,
                          selectedCount: selectedCount,
                          chartColor: chartColor,
                        )
                      : Container(
                          height: 28,
                        ),
                ],
              ),
            ),
           
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 16,
                left: 16,
                right: 16,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CustomRadioButton(
                    customRadioModel: CustomRadioModel(
                      value: 10,
                      title: "Beginning",
                      bgColor: chartColor,
                      selectedValue: selectedValue,
                    ),
                    onChanged: () {
                      setState(() {
                        this.selectedValue = 10;

                        isSpotSelected = false;
                      });
                    },
                  ),
                  SizedBox(
                    width: 8,
                  ),

                ],
              ),
            ),
          ],
        ),
      ],
    );
  }



  void updateValueDividerAndMultiplier(int totalValue) {
    if (totalValue < 120) {
      valueDivider = 20;
      valueMultiplier = 20;
    } else if (totalValue < 600) {
      valueDivider = 100;
      valueMultiplier = 100;
    } else if (totalValue < 1200) {
      valueDivider = 200;
      valueMultiplier = 0.2;
    } else if (totalValue < 3000) {
      valueDivider = 500;
      valueMultiplier = 0.5;
    } else if (totalValue < 6000) {
      valueDivider = 1000;
      valueMultiplier = 1;
    } else if (totalValue < 12000) {
      valueDivider = 2000;
      valueMultiplier = 2;
    } else if (totalValue < 30000) {
      valueDivider = 5000;
      valueMultiplier = 5;
    } else if (totalValue < 60000) {
      valueDivider = 10000;
      valueMultiplier = 10;
    } else if (totalValue < 120000) {
      valueDivider = 20000;
      valueMultiplier = 20;
    } else if (totalValue < 300000) {
      valueDivider = 50000;
      valueMultiplier = 50;
    } else if (totalValue < 600000) {
      valueDivider = 100000;
      valueMultiplier = 100;
    } else if (totalValue < 1200000) {
      valueDivider = 200000;
      valueMultiplier = 200;
    } else if (totalValue < 3000000) {
      valueDivider = 500000;
      valueMultiplier = 500;
    } else if (totalValue < 6000000) {
      valueDivider = 1000000;
      valueMultiplier = 1000;
    }
  }
}
