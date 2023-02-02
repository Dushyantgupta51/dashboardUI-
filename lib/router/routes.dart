import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../profile/profile_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: Profile, initial: true),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
  ],
)
class $Router {}
