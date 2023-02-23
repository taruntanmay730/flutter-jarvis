
import 'dart:io';

import 'package:jarvis/analytics/BaseAnalyticsService.dart';
import 'package:jarvis/common/Storage/LoginHelper.dart';
import 'package:jarvis/login/responses/LoginModel.dart';

class AnalyticsService extends BaseAnalyticsService{
  final String _eventName;
  final Map<String, dynamic>? _parms;
  final Map<String, dynamic> _jsonParams = [] as Map<String, dynamic>;

  AnalyticsService(this._eventName, this._parms){
    _jsonParams["deviceOS"] = Platform.operatingSystem;
    _jsonParams["contactNumber"] = (LoginHelper.instance.getUserDetails() as LoginModel).number;
    _jsonParams["eventName"] = _eventName;
    _jsonParams["parameters"] = _parms;
  }

  void sendEvent(){
    print("sending events: $_eventName and parameters: $_parms");
    analytics.logEvent(name: this._eventName, parameters: _jsonParams);
  }
}