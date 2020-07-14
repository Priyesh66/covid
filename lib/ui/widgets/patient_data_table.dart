
import 'package:covid_19/data/models/my_state_data.dart';

import 'package:covid_19/ui/pages/state_page.dart';
import 'package:flutter/material.dart';

class PatientDataTable extends StatefulWidget {
  final List<MyStateData> stateWiseData;

  final bool isStateDataTable;

  PatientDataTable({Key key, @required this.stateWiseData, @required this.isStateDataTable}) : super(key: key);

  @override
  _PatientDataTableState createState() => _PatientDataTableState();
}

class _PatientDataTableState extends State<PatientDataTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 32,
      ),
      child: Column(
        children: <Widget>[
           Column(
              children: <Widget>[
                buildTableHeaderRow()
              ],
            ),

           Column(
              children: buildTable(),
            ),

          widget.isStateDataTable
              ? Column(
                  children: <Widget>[
                     buildTableRow(0, widget.stateWiseData.firstWhere((item) => item.state == "Total")),

                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  /// This function takes no arguments and returns a list of widget containing
  /// the rows for our table of stateWise data

  List<Widget> buildTable() {
    return List<Widget>.generate(widget.stateWiseData.length, (index) {
      if (widget.stateWiseData[index].state == "Total") {
        return Container();
      }
      return buildTableRow(index, widget.stateWiseData[index]);
    });
  }

  ///This function takes no arguments
  ///and returns the header row
  ///for our statewise table

  Widget buildTableHeaderRow() {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.all(1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // State Name Cell
            Expanded(
              flex: 16,
              child: Tooltip(
                message: widget.isStateDataTable ? "State Name" : "District Name",
                child: Container(
                  margin: EdgeInsets.only(
                    right: 1,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.black.withAlpha(5),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.isStateDataTable ? "State/UT" : "District",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: Colors.black.withBlue(100),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Confirmed Count Cell

          ],
        ),
      ),
    );
  }

  ///This function takes two arguments i.e.
  /// @param index
  /// &
  /// @param stateData and
  ///returns a single table row for our stateData

  Widget buildTableRow(int index, MyStateData stateData) {
    return IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              if (widget.isStateDataTable) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StatePage(
                      title: stateData.state,
                      stateData: stateData,
                    ),
                    settings: RouteSettings(name: "home/india/${stateData.state}/details_page"),
                  ),
                );
              }
            },
            borderRadius: BorderRadius.circular(4),
            splashColor: Colors.blueAccent.withOpacity(0.3),
            highlightColor: Colors.blueAccent.withOpacity(0.15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // State Name Cell
                Expanded(
                  flex: 16,
                  child: Container(
                    margin: EdgeInsets.only(
                      right: 1,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black.withAlpha(5),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        stateData.state,
                        style: TextStyle(
                          fontWeight: stateData.state != "Total" ? FontWeight.w600 : FontWeight.w900,
                          fontSize: stateData.state != "Total" ? 14 : 16,
                          color: Colors.black.withBlue(100),
                        ),
                      ),
                    ),
                  ),
                ),
                // Confirmed Count Cell

                // Deaths Count Cell

              ],
            ),
          ),
        ),
      ),
    );
  }
}
