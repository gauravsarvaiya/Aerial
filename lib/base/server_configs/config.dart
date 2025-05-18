
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> kNavigatorKey = GlobalKey<NavigatorState>();

/// BASE_URL
String baseUrl = "https://api.aerial-iot.com";

/// API_URL
String get loginUrl => "$baseUrl/aerial_login_user_into_cognito";

