import 'package:dashboardlive/bottomsheet/bottomsheet_view_modal.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class BottomSheet extends StatelessWidget {
  const BottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => BottomSheetViewModal(),
      builder: (context, viewModel, child) => Scaffold(
        
        body: Center(
          child: FloatingActionButton(onPressed: ()  {
             viewModel.showCustomBottomSheet();
          }),
        ),
      ),
    );
  }
}
