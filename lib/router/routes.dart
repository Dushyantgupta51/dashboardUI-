import 'package:dashboardlive/bottomsheet/bottomsheet_view.dart';
import 'package:dashboardlive/home/home_view.dart';
import 'package:dashboardlive/percent_indigator/percentInd_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../profile/profile_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: Profile),
    MaterialRoute(page: PercentageIndicator),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: BottomSheet),

  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: BottomSheetService),

  ],
)
class $Router {}
