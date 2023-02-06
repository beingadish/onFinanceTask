import '../model/data_model.dart';

List<StockData> chartData = [
  StockData(DateTime(2005, 01, 05), 17.83, 18.79, 17.78, 18.37),
  // StockData(DateTime(2005, 01, 15), 23.5, 25.5, 31.2, 22.9),
  // StockData(DateTime(2005, 01, 25), 28.5, 26.3, 52.1, 18.2),
  // StockData(DateTime(2005, 02, 5), 28.5, 26.3, 52.1, 18.2),
  StockData(DateTime(2005, 02, 12), 17.74, 17.76, 17.27, 17.48),
  // StockData(DateTime(2005, 02, 15), 28.5, 26.3, 52.1, 18.2),
  // StockData(DateTime(2005, 02, 25), 28.5, 26.3, 52.1, 18.2),
  // StockData(DateTime(2005, 03, 5), 28.5, 26.3, 52.1, 18.2),
  StockData(DateTime(2005, 03, 14), 17.01, 17.04, 16.48, 17.01),
  // StockData(DateTime(2005, 03, 25), 28.5, 26.3, 52.1, 18.2),
  StockData(DateTime(2005, 04, 16), 16.63, 17.2, 16.43, 17.11),
  StockData(DateTime(2005, 05, 17), 15.37, 16.62, 15.25, 16.48),
  StockData(DateTime(2005, 06, 15), 15.2, 15.74, 15.1, 15.15),
  StockData(DateTime(2005, 07, 30), 15.35, 15.62, 14.87, 15.28),
  StockData(DateTime(2005, 08, 13), 15.86, 15.88, 15.27, 15.27),
  StockData(DateTime(2005, 09, 18), 18.54, 18.62, 18.05, 18.13),
  StockData(DateTime(2005, 10, 29), 18.17, 18.88, 18.12, 18.83),
  StockData(DateTime(2005, 11, 12), 17.98, 18.31, 17.52, 17.88),
  StockData(DateTime(2005, 12, 31), 18.04, 18.21, 17.84, 17.93),

  StockData(DateTime(2006, 01, 19), 17.37, 18.59, 17.31, 18.33),
  // StockData(DateTime(2006, 01, 25), 28.5, 26.3, 52.1, 18.2),
  StockData(DateTime(2006, 02, 15), 17.32, 17.65, 16.88, 17.06),
  StockData(DateTime(2006, 03, 11), 17.37, 17.45, 16.92, 17.14),
  StockData(DateTime(2006, 04, 22), 17.03, 17.22, 16.6, 16.96),
  StockData(DateTime(2006, 05, 17), 16.32, 16.9, 16.26, 16.9),
  StockData(DateTime(2006, 06, 19), 16.82, 16.96, 16.24, 16.25),
  StockData(DateTime(2006, 07, 28), 16.98, 17.05, 16.18, 16.65),
  StockData(DateTime(2006, 08, 05), 16.12, 16.4, 15.89, 16.12),
  StockData(DateTime(2006, 09, 27), 16.03, 16.24, 15.64, 15.88),
  StockData(DateTime(2006, 10, 02), 15.96, 16.25, 15.72, 15.79),
  StockData(DateTime(2006, 11, 18), 16.29, 16.52, 16.1, 16.15),
  StockData(DateTime(2006, 12, 03), 17.05, 17.08, 16.42, 16.42),
  // StockData(DateTime(2006, 12, 25), 28.5, 26.3, 52.1, 18.2),

  StockData(DateTime(2007, 01, 05), 17.01, 17.24, 16.46, 16.96),
  StockData(DateTime(2007, 02, 06), 17.03, 17.35, 16.36, 17.17),
  StockData(DateTime(2007, 03, 07), 18.02, 18.15, 17.16, 17.21),
  StockData(DateTime(2007, 04, 12), 17.77, 18.19, 17.66, 18),
  StockData(DateTime(2007, 05, 15), 18.3, 18.38, 17.81, 17.91),
  // StockData(DateTime(2007, 05, 16), 28.5, 26.3, 52.1, 18.2),
  StockData(DateTime(2007, 06, 15), 18.22, 18.45, 18, 18.12),
  StockData(DateTime(2007, 07, 15), 18.49, 18.5, 17.89, 18.09),
  StockData(DateTime(2007, 08, 17), 19.27, 19.47, 19.04, 19.09),
  StockData(DateTime(2007, 09, 11), 18.97, 19.32, 18.54, 19.26),
  StockData(DateTime(2007, 10, 22), 18.94, 19.49, 18.92, 19.21),
  StockData(DateTime(2007, 11, 30), 19.25, 19.8, 18.7, 18.8),
  StockData(DateTime(2007, 12, 31), 19.64, 19.77, 19.26, 19.44),

  StockData(DateTime(2008, 01, 29), 19.16, 19.93, 19.06, 19.66),
  StockData(DateTime(2008, 02, 25), 18.51, 19.14, 18.25, 19.04),
  StockData(DateTime(2008, 03, 25), 18.54, 19, 18.5, 18.63),
  StockData(DateTime(2008, 04, 15), 17.85, 18.61, 17.6, 18.5),
  StockData(DateTime(2008, 05, 22), 17.03, 18.13, 17, 17.83),
  // StockData(DateTime(2008, 06, 09), 28.5, 26.3, 52.1, 18.2),
  StockData(DateTime(2008, 06, 27), 17.74, 17.79, 17.1, 17.1),
  StockData(DateTime(2008, 07, 26), 17.78, 17.96, 17.56, 17.59),
  StockData(DateTime(2008, 08, 15), 17.8, 18.31, 17.76, 18.04),
  StockData(DateTime(2008, 09, 16), 17.78, 17.97, 17.43, 17.66),
  StockData(DateTime(2008, 10, 19), 17.29, 17.81, 17.23, 17.63),
  StockData(DateTime(2008, 11, 09), 16.97, 17.49, 16.75, 17.2),
  StockData(DateTime(2008, 12, 31), 18.05, 18.18, 17.07, 17.11),

  StockData(DateTime(2009, 01, 08), 18.87, 19.45, 18.46, 19.38),
  StockData(DateTime(2009, 02, 10), 19.46, 19.62, 18.37, 18.48),
  StockData(DateTime(2009, 03, 13), 19.63, 19.91, 19.15, 19.71),
  StockData(DateTime(2009, 04, 23), 19.07, 19.3, 18.52, 19.24),
  StockData(DateTime(2009, 05, 28), 19.53, 19.68, 19.01, 19.09),
  StockData(DateTime(2009, 06, 24), 19.52, 19.99, 19.52, 19.82),
  StockData(DateTime(2009, 07, 11), 19.71, 19.79, 19.3, 19.47),
  StockData(DateTime(2009, 08, 13), 20.17, 20.3, 19.41, 19.52),
  StockData(DateTime(2009, 09, 28), 19.63, 20.19, 19.55, 20.12),
  StockData(DateTime(2009, 10, 12), 20.19, 20.29, 19.48, 19.51),
  StockData(DateTime(2009, 11, 17), 20.75, 21, 20.61, 20.76),
  StockData(DateTime(2009, 12, 22), 20.2, 20.67, 20.06, 20.52),

  StockData(DateTime(2010, 01, 16), 19.53, 20.4, 19.37, 20.33)
];