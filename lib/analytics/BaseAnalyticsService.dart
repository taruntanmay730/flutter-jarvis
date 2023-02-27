
import 'package:flutter/cupertino.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

abstract class BaseAnalyticsService{
  static final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
}