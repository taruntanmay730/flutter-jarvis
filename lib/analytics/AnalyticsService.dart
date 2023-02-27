
import 'dart:io';

import 'package:jarvis/analytics/BaseAnalyticsService.dart';
import 'package:jarvis/common/Storage/LoginHelper.dart';
import 'package:jarvis/login/responses/LoginModel.dart';

class AnalyticsService{
  final String _eventName;

  AnalyticsService(this._eventName){
    late Map<String, dynamic> jsonParams = {};
    jsonParams["deviceOS"] = Platform.operatingSystem;
    jsonParams["contactNumber"] = "testNumber";
        // (LoginHelper.instance.getUserDetails() as LoginModel).number;
    jsonParams["eventName"] = _eventName;

    print("sending events: $_eventName and parameters: $jsonParams");
    BaseAnalyticsService.analytics.logEvent(name: this._eventName, parameters: jsonParams);
  }
}