import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:on_finance_task/constants/stock_data.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:on_finance_task/model/data_model.dart';

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
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        child: SfCartesianChart(
                          // isTransposed: true,
                          // enableSideBySideSeriesPlacement: false,
                          plotAreaBorderWidth: 0,
                          // plotAreaBorderColor: Colors.amber,
                          enableAxisAnimation: true,

                          legend: Legend(isVisible: true),
                          margin: const EdgeInsets.all(0),


                          primaryXAxis: DateTimeAxis(
                            // isVisible: false,
                            borderColor: Colors.amber,
                            // plotOffset: 0,
                            axisBorderType: AxisBorderType.withoutTopAndBottom,
                            majorGridLines: const MajorGridLines(
                              color: Colors.white12,
                              width: 0.2,
                            ),
                            minorGridLines: const MinorGridLines(
                              color: Colors.white,
                              width: 0.1,
                            ),
                            labelPosition: ChartDataLabelPosition.inside,
                            tickPosition: TickPosition.inside,
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            enableAutoIntervalOnZooming: true,
                            minimum: DateTime(2004, 01, 01),
                            maximum: DateTime(2010, 12, 31),
                          ),


                          primaryYAxis: NumericAxis(
                            // isVisible: false,
                            autoScrollingMode: AutoScrollingMode.end,
                            majorGridLines: const MajorGridLines(
                              color: Colors.white12,
                              width: 0.2,
                            ),
                            minorGridLines: const MinorGridLines(
                              color: Colors.white,
                              width: 0.1,
                            ),
                            labelPosition: ChartDataLabelPosition.inside,
                            anchorRangeToVisiblePoints: false,
                            tickPosition: TickPosition.inside,
                            edgeLabelPlacement: EdgeLabelPlacement.shift,
                            // borderColor: Colors.amber,
                            enableAutoIntervalOnZooming: true,
                            numberFormat: NumberFormat.currency(
                              locale: "en_IND",
                              symbol: "₹",
                            ),
                            minimum: 13,
                            maximum: 25,
                          ),


                          zoomPanBehavior:
                              ZoomPanBehavior(enablePinching: true),
                          backgroundColor: const Color(0xff111115).withAlpha(180),
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
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
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
                                      children: const [
                                        Text(
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
                                            color: Color(0xff3455FF),
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
                        left: 35.0,
                        top: 130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // PRICE RATE
                            ElevatedButton(
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
                            const SizedBox(
                              width: 15.0,
                            ),
                            // ASCENDING ANGLE
                            ElevatedButton(
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
                            const SizedBox(
                              width: 15.0,
                            ),
                            // HIGH EXPOSURE
                            ElevatedButton(
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
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0.0,
                        width: MediaQuery.of(context).size.width,
                        child: Align(
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: const IntrinsicHeight(
                                      child: FloatingActionBar()),
                                ),
                                IntrinsicHeight(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() =>
                                          chart == 0 ? (chart = 1) : chart = 0);
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
                      ),
                    ],
                  );
                },
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
      selectedBackgroundColor: const Color(0xff3353FA),
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
