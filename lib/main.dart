import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:on_finance_task/constants/stock_data.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:on_finance_task/model/data_model.dart';
import 'package:expandable/expandable.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int chart = 0;
  int save = 0;
  late TrackballBehavior _trackball;

  @override
  void initState() {
    _trackball = TrackballBehavior(
      enable: true,
      tooltipDisplayMode: TrackballDisplayMode.floatAllPoints,
      tooltipSettings: const InteractiveTooltip(
        enable: true,
        color: Colors.amberAccent,
      ),
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          toolbarHeight: 70.0,
          title: const Text(
            "Polygon",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          leading: const Icon(Icons.arrow_back_ios_new),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () => setState(() => save == 0 ? save = 1 : save = 0),
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff16161C),
                  ),
                  child: save == 0
                      ? const Icon(Icons.bookmark_border_rounded)
                      : const Icon(Icons.bookmark),
                ),
              ),
            )
          ],
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Builder(
                builder: (context) {
                  return Stack(
                    clipBehavior: Clip.antiAlias,
                    // textDirection: TextDirection.ltr,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        height: MediaQuery.of(context).size.height - 300,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(40.0),
                            bottomRight: Radius.circular(40.0),
                          ),
                        ),
                        child: SfCartesianChart(
                          trackballBehavior: _trackball,
                          plotAreaBorderWidth: 0,
                          enableAxisAnimation: true,
                          legend: Legend(isVisible: true),
                          margin: const EdgeInsets.all(0),

                          // X AXIS (DATE TIME)
                          primaryXAxis: DateTimeAxis(
                            minorTicksPerInterval: 5,
                            tickPosition: TickPosition.inside,
                            majorTickLines: const MajorTickLines(
                                size: 0, color: Colors.white12),
                            minorTickLines: const MinorTickLines(
                                color: Colors.white12, width: 0),
                            majorGridLines: const MajorGridLines(
                              color: Colors.white12,
                              width: 0.3,
                            ),
                            minorGridLines: const MinorGridLines(
                              color: Colors.white,
                              width: 0.03,
                            ),
                            maximumLabelWidth: 0,
                            axisLine: const AxisLine(
                              width: 0,
                            ),
                            borderColor: Colors.amber,
                            axisBorderType: AxisBorderType.withoutTopAndBottom,
                            labelPosition: ChartDataLabelPosition.inside,
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            enableAutoIntervalOnZooming: true,
                            minimum: DateTime(2004, 01, 01),
                            maximum: DateTime(2010, 12, 31),
                            autoScrollingMode: AutoScrollingMode.end,
                          ),

                          primaryYAxis: NumericAxis(
                            minimum: 11,
                            maximum: 25,
                            minorTicksPerInterval: 5,
                            tickPosition: TickPosition.inside,
                            majorTickLines: const MajorTickLines(
                                size: 0, color: Colors.white12),
                            minorTickLines: const MinorTickLines(
                                color: Colors.white12, width: 0),
                            majorGridLines: const MajorGridLines(
                              color: Colors.white12,
                              width: 0.3,
                            ),
                            minorGridLines: const MinorGridLines(
                              color: Colors.white,
                              width: 0.03,
                            ),
                            maximumLabelWidth: 0,
                            decimalPlaces: 7,
                            axisLine: const AxisLine(width: 0),
                            // isVisible: false,
                            autoScrollingMode: AutoScrollingMode.end,
                            labelPosition: ChartDataLabelPosition.inside,
                            anchorRangeToVisiblePoints: false,
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            enableAutoIntervalOnZooming: true,
                            numberFormat: NumberFormat.currency(
                              locale: "en_IND",
                              symbol: "₹",
                            ),
                          ),

                          zoomPanBehavior:
                              ZoomPanBehavior(enablePinching: true),
                          backgroundColor:
                              const Color(0xff111115).withAlpha(180),
                          series: <ChartSeries>[
                            chart == 1
                                ? CandleSeries<StockData, dynamic>(
                                    bearColor: Colors.red,
                                    bullColor: Colors.green,
                                    dataSource: chartData,
                                    xValueMapper: (StockData stock, _) =>
                                        stock.time,
                                    lowValueMapper: (StockData stock, _) =>
                                        stock.low,
                                    highValueMapper: (StockData stock, _) =>
                                        stock.high,
                                    openValueMapper: (StockData stock, _) =>
                                        stock.open,
                                    closeValueMapper: (StockData stock, _) =>
                                        stock.close)
                                : SplineSeries<StockData, dynamic>(
                                    color: const Color(0xff00EB7A),
                                    dataSource: chartData,
                                    xValueMapper: (StockData stock, _) =>
                                        stock.time,
                                    yValueMapper: (StockData stock, _) =>
                                        (stock.open + stock.close) / 2,
                                  ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white12,
                              blurRadius: 0.5,
                              blurStyle: BlurStyle.normal,
                            )
                          ],
                          color: Colors.black,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                          ),
                        ),
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Divider(
                              height: 0.0001,
                              // indent: 2.0,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      foregroundImage: AssetImage(
                                          "assets/images/polygon.png"),
                                      maxRadius: 30,
                                    ),
                                    const SizedBox(
                                      width: 20.0,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "₹94.634",
                                          style: TextStyle(
                                            fontSize: 25.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "MATIC",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.blue.shade700,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Discuss",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Stack(
                                        children: const [
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 18.0,
                                            color: Colors.black,
                                          ),
                                          Positioned(
                                            width: 6.0,
                                            left: 5.5,
                                            child: Icon(
                                              Icons.arrow_forward_ios_rounded,
                                              size: 18.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        left: 10.0,
                        top: 130,
                        right: MediaQuery.of(context).size.width*0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // PRICE RATE
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.black,
                                  backgroundColor: Colors.black,
                                  elevation: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      "assets/images/up.png",
                                      scale: 4.0,
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    const Text(
                                      "2.75%",
                                      style: TextStyle(
                                        color: Color(0xff00EB7A),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            // ASCENDING ANGLE
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  backgroundColor: const Color(0xff202027),
                                  elevation: 10.0,
                                ),
                                child: const Text(
                                  "Ascending Angle",
                                  style: TextStyle(
                                    color: Color(0xff98B5FF),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 15.0,
                            ),
                            // HIGH EXPOSURE
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  backgroundColor: const Color(0xff202027),
                                  elevation: 10.0,
                                ),
                                child: const Text(
                                  "High Exposure",
                                  style: TextStyle(
                                    color: Color(0xffDC3F40),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Align(
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: const IntrinsicHeight(
                                          child: FloatingActionBar()),
                                    ),
                                    IntrinsicHeight(
                                      child: ElevatedButton(
                                        onPressed: () {
                                          setState(() => chart == 0
                                              ? (chart = 1)
                                              : chart = 0);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          foregroundColor: Colors.white,
                                        ),
                                        child: chart == 0
                                            ? Image.asset(
                                                "assets/images/candlebar.png",
                                                scale: 3.0,
                                              )
                                            : Image.asset(
                                                "assets/images/chart.png",
                                                scale: 3.0,
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                height: 80.0,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    topRight: Radius.circular(30.0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white12,
                                      blurRadius: 0.5,
                                      blurStyle: BlurStyle.normal,
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                     Text(
                                      "Analyst Ratings",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: MediaQuery.of(context).size.width*0.07),
                                    ),
                                    Stack(
                                      alignment: AlignmentDirectional.topEnd,
                                      children: [
                                        SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: Image.asset(
                                              "assets/images/spark1.png",
                                              scale: 5.0,
                                            )),
                                        Positioned(
                                          height: 15,
                                          width: 15,
                                          child: Image.asset(
                                            "assets/images/spark2.png",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
              Builder(builder: (context) {
                return Container(
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white24,
                        blurRadius: 0.5,
                        blurStyle: BlurStyle.normal,
                      )
                    ],
                    color: Colors.black,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade700,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.4, 35)),
                          child: const Text(
                            "Buy",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.4, 35)),
                          onPressed: () {},
                          child: const Text(
                            "Sell",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
              Container(
                width: double.infinity,
                color: const Color(0xff111115).withAlpha(180),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Column(
                    children: [
                      Container(
                        color: Colors.black,
                        child: Builder(
                          builder: (context) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                buildButton("Strong Buy",context,(){}),
                                buildButton("Buy",context,(){}),
                                buildButton("Hold",context,(){}),
                                buildButton("Sell",context,(){}),
                                buildButton("Strong Sell",context,(){}),
                              ],
                            );
                          }
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          return Container(
                            color: Colors.black,
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: ExpandablePanel(
                                theme: ExpandableThemeData(
                                  iconSize: 30,
                                  iconPlacement:
                                      ExpandablePanelIconPlacement.left,
                                  iconColor: Colors.white,
                                  iconPadding: EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width *
                                              0.4399 -
                                          18),
                                ),
                                header: const SizedBox(),
                                collapsed: Container(
                                  clipBehavior: Clip.antiAlias,
                                  width: double.infinity,
                                  height: 1.0,
                                  decoration: const BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(50.0),
                                      bottomLeft: Radius.circular(50.0),
                                    ),
                                  ),
                                ),
                                expanded: SizedBox(
                                  height: 500,
                                  child: Column(
                                    children: [
                                      const Divider(
                                        thickness: 0.1,
                                        color: Colors.green,
                                      ),
                                      Container(
                                        height: 400,
                                        width: double.maxFinite,
                                        color: Colors.amberAccent,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Builder(
                        builder: (context) {
                          return Center(
                            child: Container(
                              height: 5.0,
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: const BoxDecoration(
                                color: Colors.tealAccent,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(40.0),
                                  bottomRight: Radius.circular(40.0),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FloatingActionBar extends StatefulWidget {
  const FloatingActionBar({Key? key}) : super(key: key);

  @override
  State<FloatingActionBar> createState() => _FloatingActionBarState();
}

class _FloatingActionBarState extends State<FloatingActionBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return FloatingNavbar(
      selectedBackgroundColor: Colors.blue.shade700,
      onTap: (int val) => setState(() => _index = val),
      currentIndex: _index,
      items: [
        FloatingNavbarItem(
          customWidget: Text(
            "1H",
            style: TextStyle(
                color: _index == 0 ? Colors.white : const Color(0xff424242),
                fontSize: 18),
          ),
        ),
        FloatingNavbarItem(
          customWidget: Text(
            "1D",
            style: TextStyle(
                color: _index == 1 ? Colors.white : const Color(0xff424242),
                fontSize: 18),
          ),
        ),
        FloatingNavbarItem(
          customWidget: Text(
            "1W",
            style: TextStyle(
                color: _index == 2 ? Colors.white : const Color(0xff424242),
                fontSize: 18),
          ),
        ),
        FloatingNavbarItem(
          customWidget: Text(
            "1M",
            style: TextStyle(
                color: _index == 3 ? Colors.white : const Color(0xff424242),
                fontSize: 18),
          ),
        ),
        FloatingNavbarItem(
          customWidget: Text(
            "5Y",
            style: TextStyle(
                color: _index == 4 ? Colors.white : const Color(0xff424242),
                fontSize: 18),
          ),
        ),
      ],
    );
  }
}


Widget buildButton(String text, BuildContext context, VoidCallback function){
  return Expanded(
    child: TextButton(
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: MediaQuery.of(context).size.width*0.05),
      ),
    ),
  );
}