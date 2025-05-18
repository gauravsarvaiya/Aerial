library utils;

import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:aerial/app/auth/use_cases/auth_use_cases.dart';
import 'package:aerial/repository/auth/auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../app/auth/application/auth_provider.dart';
import '../app/auth/route/auth_route.dart';
import '../app/home/route/home_route.dart';
import '../app/lending/application/lending_provider.dart';
import '../app/lending/route/lending_route.dart';
import '../app/lending/use_cases/lending_use_case.dart';
import '../app/tab/application/tab_provider.dart';
import '../app/tab/route/tab_route.dart';
import '../base/server_configs/config.dart';
import 'package:http/http.dart' as http;

import '../repository/lending/lending_repo.dart';


part 'sizer/size_util.dart';
part 'sizer/size_widget.dart';
part 'sizer/size_extension.dart';
part 'common_utils/extensions.dart';
part 'theme/constants.dart';
part 'theme/constants_style.dart';
part 'theme/app_theme.dart';
part 'routes/routes.dart';
part 'common_utils/enums.dart';
part 'common_utils/user_pref.dart';
part 'services/provider.dart';
part 'services/secure_storage.dart';
part 'services/state_manager.dart';
part 'services/web_services.dart';
part 'common_utils/navigation_context.dart';

