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
              Builder(builder: (context) {
                return Stack(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: MediaQuery.of(context).size.height - 300,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20.0),bottomRight: Radius.circular(20.0),)
                      ),
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
                              Container(
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      foregroundImage: NetworkImage(
                                          "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQsAgQtWc9HFEPOn1_zE_rkEfQsTHTUEXwsvgKtaN6-z05Yst51"),
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
                                            fontSize: 30.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "MATIC",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            color: Color(0xff314FEE),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
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
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
