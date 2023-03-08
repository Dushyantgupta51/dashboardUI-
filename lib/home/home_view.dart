import 'package:dashboardlive/home/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, viewModel, child) => Scaffold(
            drawer: const Drawer(),
            appBar: AppBar(
                foregroundColor: Colors.black,
                elevation: 0,
                actions: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Switch(
                          value: HomeViewModel.isDarkModeOn,
                          onChanged: (value) {
                            setState(() {
                              HomeViewModel.isDarkModeOn = value;
                            });
                          }))
                ]),
            body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(children: [
                  const SizedBox(
                      height: 75,
                      child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: ClipOval(
                              child: CircleAvatar(
                                  radius: 23,
                                  child: Image(
                                      image: AssetImage(
                                          'assets/images/android.png')))),
                          title: Text("Dhruv Swami",
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold)),
                          subtitle: Text("UI/UX Designer",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12)))),
                  const Divider(
                      thickness: 1,
                      color: Color.fromARGB(12, 0, 0, 0)),
                  Expanded(
                      child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(children: [
                            Container(
                                padding: const EdgeInsets.all(8),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            12, 0, 0, 0),
                                        width: 1),
                                    borderRadius:
                                        BorderRadius.circular(10)),
                                child: Column(children: [
                                  header(
                                      const Icon(Icons.people,
                                          color: Colors.blue),
                                      "Basic Information"),
                                  const Divider(
                                      thickness: 1,
                                      color: Color.fromARGB(
                                          12, 0, 0, 0)),
                                  details(
                                      const Icon(Icons.people,
                                          // color: Colors.black54,
                                          size: 16),
                                      "Jhon Doe"),
                                  const SizedBox(height: 10),
                                  details(
                                      const Icon(Icons.people,
                                          // color: Colors.black54,
                                          size: 16),
                                      "Chris Hemsworth"),
                                  const SizedBox(height: 10),
                                  details(
                                      const Icon(Icons.people,
                                          // color: Colors.black54,
                                          size: 16),
                                      "Jane Froster"),
                                  const SizedBox(height: 10),
                                  details(
                                      const Icon(Icons.calendar_month,
                                          // color: Colors.black54,
                                          size: 16),
                                      "Feb. 19, 2003 (Official)"),
                                  const SizedBox(height: 10),
                                  details(
                                      const Icon(Icons.calendar_month,
                                          // color: Colors.black54,
                                          size: 16),
                                      "Feb. 19, 2003 (B'day Celebration)"),
                                  const SizedBox(height: 10),
                                  details(
                                      const Icon(Icons.male,
                                          // color: Colors.black54,
                                          size: 16),
                                      "Male"),
                                  const SizedBox(height: 10),
                                  details(
                                      const Icon(Icons.wifi,
                                          // color: Colors.black54,
                                          size: 16),
                                      "Unmarried")
                                ])),
                            const SizedBox(height: 22),
                            Container(
                                padding: const EdgeInsets.all(8),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            12, 0, 0, 0),
                                        width: 1),
                                    borderRadius:
                                        BorderRadius.circular(10)),
                                child: Column(children: [
                                  header(
                                      const Icon(Icons.phone_outlined,
                                          color: Colors.blue),
                                      'Contact Details'),
                                  const Divider(
                                      thickness: 1,
                                      color: Color.fromARGB(
                                          12, 0, 0, 0)),
                                  details(
                                      const Icon(Icons.email_outlined,
                                          // color: Colors.black54,
                                          size: 16),
                                      "swamidhruv058@gmail.com"),
                                  const SizedBox(height: 10),
                                  details(
                                      const Icon(Icons.phone_outlined,
                                          // color: Colors.black54,
                                          size: 16),
                                      "+ 91 8239209316")
                                ])),
                            const SizedBox(height: 22),
                            Container(
                                padding: const EdgeInsets.all(8),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            12, 0, 0, 0),
                                        width: 1),
                                    borderRadius:
                                        BorderRadius.circular(10)),
                                child: Column(children: [
                                  header(
                                      const Icon(Icons.home_outlined,
                                          color: Colors.blue),
                                      "Bank Account Details"),
                                  const Divider(
                                      thickness: 1,
                                      color: Color.fromARGB(
                                          12, 0, 0, 0)),
                                  details(
                                      const Icon(Icons.cases_outlined,
                                          // color: Colors.black54,
                                          size: 16),
                                      "Bank of India"),
                                  const SizedBox(height: 10),
                                  details(
                                      const Icon(
                                          Icons
                                              .qr_code_scanner_outlined,
                                          // color: Colors.black54,
                                          size: 16),
                                      "BKOID0006630"),
                                  const SizedBox(height: 7),
                                  Row(children: [
                                    const Icon(Icons.task_outlined,
                                        // color: Colors.black54,
                                        size: 16),
                                    const SizedBox(width: 10),
                                    const Text(
                                        "6630 4459 8392 0440 435",
                                        style: TextStyle(
                                            // color: Colors.black54,
                                            fontSize: 12,
                                            fontWeight:
                                                FontWeight.bold)),
                                    Expanded(child: Container()),
                                    const Text('Sallary Account',
                                        style: TextStyle(
                                            // color: Colors.black54,
                                            fontSize: 12,
                                            fontWeight:
                                                FontWeight.bold))
                                  ])
                                ])),
                            const SizedBox(height: 22),
                            Container(
                                padding: const EdgeInsets.all(8),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            12, 0, 0, 0),
                                        width: 1),
                                    borderRadius:
                                        BorderRadius.circular(10)),
                                child: Column(children: [
                                  header(
                                      const Icon(Icons.phone_outlined,
                                          color: Colors.blue),
                                      'Emergency Contact Details'),
                                  const Divider(
                                      thickness: 1,
                                      color: Color.fromARGB(
                                          12, 0, 0, 0)),
                                  details(
                                      const Icon(Icons.people,
                                          // color: Colors.black54,
                                          size: 16),
                                      "Dhruv Swami"),
                                  const SizedBox(height: 10),
                                  details(
                                      const Icon(Icons.people,
                                          // color: Colors.black54,
                                          size: 16),
                                      "BKOID0006630"),
                                  const SizedBox(height: 4),
                                  Row(children: [
                                    const Icon(
                                      Icons.task_outlined,
                                      size: 16,
                                      // color: Colors.black54
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                        "6630 4459 8392 0440 435",
                                        style: TextStyle(
                                            // color: Colors.black54,
                                            fontSize: 12,
                                            fontWeight:
                                                FontWeight.bold)),
                                    Expanded(child: Container()),
                                    const Text('Sallary Account',
                                        style: TextStyle(
                                            // color: Colors.black54,
                                            fontSize: 12,
                                            fontWeight:
                                                FontWeight.bold))
                                  ])
                                ]))
                          ])))
                ]))));
  }

  static header(Icon headerIcon, String header) {
    return Row(children: [
      headerIcon,
      const SizedBox(width: 10),
      Text(header,
          style: const TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold)),
      Expanded(child: Container()),
      const Icon(Icons.edit_outlined, color: Colors.blue)
    ]);
  }

  static details(Icon leadingIcon, String details) {
    return Row(children: [
      leadingIcon,
      const SizedBox(width: 10),
      Text(details,
          style: const TextStyle(
              // color: Colors.black54,
              fontSize: 12,
              fontWeight: FontWeight.bold))
    ]);
  }
}
