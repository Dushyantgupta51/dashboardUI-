import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../router/routes.locator.dart';
import 'bottom_sheet_type.dart';

final bottomSheetService = locator<BottomSheetService>();

class BottomSheetViewModal extends BaseViewModel {
  setupBottomSheetUi() {
    final builders = {
      BottomSheetType.floating: (context, sheetRequest, completer) =>
          _FloatingBoxBottomSheet(
              request: sheetRequest, completer: completer)
    };

    bottomSheetService.setCustomSheetBuilders(builders);
  }

  Future showCustomBottomSheet() async {
    await bottomSheetService.showCustomSheet(
      isScrollControlled: true,
      variant: BottomSheetType.floating,
    );
  }
}

List<String> salutation = ['Mr.', 'Mrs.'];
String salutationIndex = salutation.first;
List<String> gender = ['Male', 'Female'];
String genderIndex = gender.first;
List<String> marritalStatus = ['Married', 'Unmarried'];
String marritalStatusIndex = marritalStatus.first;

class _FloatingBoxBottomSheet extends StatefulWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;
  const _FloatingBoxBottomSheet(
      {required this.request, required this.completer});

  @override
  State<_FloatingBoxBottomSheet> createState() =>
      _FloatingBoxBottomSheetState();
}

class _FloatingBoxBottomSheetState
    extends State<_FloatingBoxBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(18),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Basic Information",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 10),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: [
                        Container(
                            padding: const EdgeInsets.all(5),
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 209, 213, 219),
                                    width: 1),
                                borderRadius:
                                    BorderRadius.circular(5)),
                            child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Salutation',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                  Expanded(
                                      child: Container(
                                          alignment:
                                              Alignment.centerLeft,
                                          height: 20,
                                          child: DropdownButton(
                                              value: salutationIndex,
                                              underline:
                                                  const SizedBox(),
                                              isExpanded: true,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                              elevation: 0,
                                              iconDisabledColor:
                                                  Colors.black,
                                              iconEnabledColor:
                                                  Colors.black,
                                              icon: const Icon(Icons
                                                  .keyboard_arrow_down),
                                              items: salutation
                                                  .map((value) {
                                                return DropdownMenuItem(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged:
                                                  (String? newValue) {
                                                setState(() {
                                                  salutationIndex =
                                                      newValue!;
                                                });
                                              })))
                                ])),
                        const SizedBox(height: 10),
                        Row(children: [
                          Expanded(
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 209, 213, 219),
                                        width: 1),
                                    borderRadius:
                                        BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "First Name",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight:
                                                  FontWeight.bold),
                                        ),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                            height: 20,
                                            child: TextFormField(
                                                decoration: const InputDecoration(
                                                    border:
                                                        InputBorder
                                                            .none,
                                                    hintText: "Jhon",
                                                    hintStyle:
                                                        TextStyle(
                                                            fontSize:
                                                                15))))
                                      ]))),
                          const SizedBox(width: 20),
                          Expanded(
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 209, 213, 219),
                                          width: 1),
                                      borderRadius:
                                          BorderRadius.circular(5)),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Middle Name",
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight:
                                                  FontWeight.bold),
                                        ),
                                        const SizedBox(height: 10),
                                        SizedBox(
                                            height: 20,
                                            child: TextFormField(
                                                decoration: const InputDecoration(
                                                    border:
                                                        InputBorder
                                                            .none,
                                                    hintText: "--",
                                                    hintStyle:
                                                        TextStyle(
                                                            fontSize:
                                                                15))))
                                      ])))
                        ]),
                        const SizedBox(height: 10),
                        Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 209, 213, 219),
                                  width: 1),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  const Text("Last Name",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight:
                                              FontWeight.bold)),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                      height: 20,
                                      child: TextFormField(
                                          decoration:
                                              const InputDecoration(
                                                  border: InputBorder
                                                      .none,
                                                  hintText: "Doe",
                                                  hintStyle:
                                                      TextStyle(
                                                          fontSize:
                                                              15))))
                                ])),
                        const SizedBox(height: 10),
                        Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 209, 213, 219),
                                    width: 1),
                                borderRadius:
                                    BorderRadius.circular(5)),
                            child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  const Text("Father's Name",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight:
                                              FontWeight.bold)),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                      height: 20,
                                      child: TextFormField(
                                          decoration:
                                              const InputDecoration(
                                                  border: InputBorder
                                                      .none,
                                                  hintText:
                                                      "Chris Hemsworth",
                                                  hintStyle:
                                                      TextStyle(
                                                          fontSize:
                                                              15))))
                                ])),
                        const SizedBox(height: 10),
                        Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 209, 213, 219),
                                    width: 1),
                                borderRadius:
                                    BorderRadius.circular(5)),
                            child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  const Text("Mother's Name",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight:
                                              FontWeight.bold)),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                      height: 20,
                                      child: TextFormField(
                                          decoration:
                                              const InputDecoration(
                                                  border: InputBorder
                                                      .none,
                                                  hintText:
                                                      "Jane Froster",
                                                  hintStyle:
                                                      TextStyle(
                                                          fontSize:
                                                              15))))
                                ])),
                        const SizedBox(height: 10),
                        Row(children: [
                          Expanded(
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 209, 213, 219),
                                          width: 1),
                                      borderRadius:
                                          BorderRadius.circular(5)),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text("DOB (Official)",
                                            style: TextStyle(
                                                fontWeight:
                                                    FontWeight.bold,
                                                fontSize: 12)),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            GestureDetector(
                                                child: const Icon(
                                                    Icons
                                                        .calendar_month,
                                                    size: 20),
                                                onTap: () {
                                                  selectFirstDate(
                                                      context);
                                                }),
                                            const SizedBox(width: 5),
                                            Text(
                                                "${selectedDate.toLocal()}"
                                                    .split(' ')[0])
                                          ],
                                        )
                                      ]))),
                          const SizedBox(width: 10),
                          Expanded(
                              child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 209, 213, 219),
                                          width: 1),
                                      borderRadius:
                                          BorderRadius.circular(5)),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                            "DOB (Celebrating)",
                                            style: TextStyle(
                                                fontWeight:
                                                    FontWeight.bold,
                                                fontSize: 12)),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            GestureDetector(
                                                child: const Icon(
                                                    Icons
                                                        .calendar_month,
                                                    size: 20),
                                                onTap: () {
                                                  selectLastDate(
                                                      context);
                                                }),
                                            const SizedBox(width: 5),
                                            Text(
                                                "${getDate.toLocal()}"
                                                    .split(' ')[0])
                                          ],
                                        )
                                      ])))
                        ]),
                        const SizedBox(height: 10),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(5),
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 209, 213, 219),
                                    width: 1),
                                borderRadius:
                                    BorderRadius.circular(5)),
                            child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Gender',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                  Expanded(
                                      child: Container(
                                          alignment:
                                              Alignment.centerLeft,
                                          height: 20,
                                          child: DropdownButton(
                                              value: genderIndex,
                                              underline:
                                                  const SizedBox(),
                                              isExpanded: true,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                              elevation: 0,
                                              iconDisabledColor:
                                                  Colors.black,
                                              iconEnabledColor:
                                                  Colors.black,
                                              icon: const Icon(Icons
                                                  .keyboard_arrow_down),
                                              items:
                                                  gender.map((value) {
                                                return DropdownMenuItem(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  genderIndex =
                                                      value!;
                                                });
                                              })))
                                ])),
                        const SizedBox(height: 10),
                        Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(5),
                            height: 60,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 209, 213, 219),
                                    width: 1),
                                borderRadius:
                                    BorderRadius.circular(5)),
                            child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Marrital Status',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                  Expanded(
                                      child: Container(
                                          alignment:
                                              Alignment.centerLeft,
                                          height: 20,
                                          child: DropdownButton(
                                              value:
                                                  marritalStatusIndex,
                                              underline:
                                                  const SizedBox(),
                                              isExpanded: true,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                              elevation: 0,
                                              iconDisabledColor:
                                                  Colors.black,
                                              iconEnabledColor:
                                                  Colors.black,
                                              icon: const Icon(Icons
                                                  .keyboard_arrow_down),
                                              items: marritalStatus
                                                  .map((value) {
                                                return DropdownMenuItem(
                                                  value: value,
                                                  child: Text(value),
                                                );
                                              }).toList(),
                                              onChanged: (value) {
                                                setState(() {
                                                  marritalStatusIndex =
                                                      value!;
                                                });
                                              })))
                                ])),
                        const SizedBox(height: 10)
                      ])),
                  Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 50,
                            width: 155,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color(0xff1d85d1)),
                                onPressed: () {},
                                child: const Text("Save",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight:
                                            FontWeight.bold)))),
                        SizedBox(
                            width: 155,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white),
                                onPressed: () {},
                                child: const Text("Cancel",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18))))
                      ])
                ])));
  }

  DateTime selectedDate = DateTime.now();
  Future<void> selectFirstDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1, 1),
        lastDate: DateTime(2024));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  DateTime getDate = DateTime.now();
  Future<void> selectLastDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: selectedDate,
        lastDate: DateTime(2101));
    if (picked != null && picked != getDate) {
      setState(() {
        getDate = picked;
      });
    }
  }
}
