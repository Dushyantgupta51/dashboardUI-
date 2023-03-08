// ignore_for_file: file_names

import 'package:dashboardlive/percent_indigator/percentInd_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PercentageIndicator extends StatelessWidget {
  const PercentageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PercentageIndicatorViewModel>.reactive(
        viewModelBuilder: () => PercentageIndicatorViewModel(),
        builder: (context, viewModel, child) => Scaffold(
            body: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Leave you have taken",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w400)),
                      const SizedBox(height: 30),
                      Stack(children: [
                        Container(
                            height: 10,
                            width: MediaQuery.of(context).size.width *
                                0.9,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(38),
                                color: Colors.grey[200])),
                        Container(
                            height: 10,
                            width: MediaQuery.of(context).size.width *
                                0.9 *
                                (viewModel.value / 15),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(38)),
                            child: const Image(
                                image: AssetImage(
                                    'assets/images/Frame238315.png'),
                                fit: BoxFit.cover))
                      ]),
                      const SizedBox(height: 10),
                      Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            percentage("0"),
                            percentage(
                                "${(viewModel.value / 15 * 100).toStringAsFixed(0)}%"),
                            percentage("100%")
                          ]),
                      const SizedBox(height: 60),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10),
                          child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                details("Total Leaves", "  15",
                                    const Color(0xfffbff3e)),
                                details("Pending Leaves", "  4",
                                    const Color(0xff40ff74)),
                                details("Used Leaves", "  11",
                                    const Color(0xffff613f))
                              ]))
                    ]))));
  }

  details(String title, String days, Color boxcolor) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: .5)),
          const SizedBox(height: 10),
          Row(children: [
            Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: boxcolor)),
            Text(days,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w500))
          ])
        ]);
  }

  percentage(String percentage) {
    return Text(percentage,
        style: const TextStyle(
            letterSpacing: 1.6,
            fontWeight: FontWeight.bold,
            fontSize: 17));
  }
}
