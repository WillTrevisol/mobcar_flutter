import 'package:flutter/material.dart';

import 'package:mobcar/ui/pages/pages.dart';
import 'package:mobcar/main/factories/pages/dashboard/dashboard.dart';

Widget dashboardPageFactory() {
  return DashboardPage(presenter: getxDashboardPresenterFactory());
}
