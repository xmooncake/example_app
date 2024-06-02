import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/numeric/pie.dart';
import 'package:flutter/material.dart';

//
// As per requirements it wasn't stated that statistics should be based on the API here are some mock data
//
// For simplicity components haven't been separated into different files
//
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  get numericDataList => [
        NumericData(domain: 1, measure: 3, color: Colors.grey[300]),
        NumericData(domain: 2, measure: 5, color: Colors.green[300]),
        NumericData(domain: 3, measure: 9, color: Colors.orange[300]),
        NumericData(domain: 4, measure: 6.5, color: Colors.red[300]),
      ];

  get customLabel => (numericData, index) =>
      'Domain: ${numericData.domain}, Measure: ${numericData.measure}';

  get labels => Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          labelWidget('Domain 1', Colors.grey[300]),
          labelWidget('Domain 2', Colors.green[300]),
          labelWidget('Domain 3', Colors.orange[300]),
          labelWidget('Domain 4', Colors.red[300]),
        ],
      );

  labelWidget(String title, Color? color) => Row(
        children: [
          Icon(Icons.circle, color: color),
          const SizedBox(width: 10),
          Text(title),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 250,
                        width: 250,
                        child: AspectRatio(
                          aspectRatio: 16 / 9,
                          child: DChartPieN(
                            customLabel: (numericData, index) => customLabel,
                            data: numericDataList,
                          ),
                        ),
                      ),
                      labels,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
