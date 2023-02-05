import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.0,
          title: const Text("Polygon"),
          leading: const Icon(Icons.arrow_back_ios_new),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white12,
                ),
                child: const Icon(Icons.bookmark_border_rounded),
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
              const Divider(
                height: 0.1,
                indent: 2.0,
                color: Colors.white,
              ),
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: SfCartesianChart(
                      margin: const EdgeInsets.all(0),
                      primaryXAxis: DateTimeAxis(
                        minimum: DateTime(2005),
                        maximum: DateTime.now(),
                      ),
                      primaryYAxis: NumericAxis(
                        borderColor: Colors.amber,
                        minimum: 20,
                        maximum: 100,
                      ),
                      zoomPanBehavior: ZoomPanBehavior(enablePinching: true),
                      backgroundColor: const Color.fromRGBO(17, 17, 21, 0.95),
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0),
                        ),),
                    height: 120,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
