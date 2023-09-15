import '/network/model/base/base_resp.dart';

import 'http_util.dart';
import 'network/error_code.dart';

BaseResp<T?> _parseResponse<T>(json, T Function(dynamic json)? dataParse) {
  return BaseResp<T?>.fromJson(json, (data) {
    if (json['code'] == ErrorCode.Success && dataParse != null) {
      return dataParse(data);
    }
    return null;
  });
}

Future<BaseResp<T?>> httpRequest<T>(String path, String method,
    {postData,
    Map<String, String>? getParams,
    T Function(dynamic json)? dataParse}) async {
  var json =
      await HttpUtil().request(path, HttpMethod.GET, getParams: getParams);
  return _parseResponse(json, dataParse);
}

Future<BaseResp<T?>> httpGet<T>(String path,
        {Map<String, String>? getParams,
        T Function(dynamic json)? dataParse}) async =>
    httpRequest(path, HttpMethod.GET,
        getParams: getParams, dataParse: dataParse);

Future<BaseResp<T?>> httpPost<T>(String path,
        {postData,
        Map<String, String>? getParams,
        T Function(dynamic json)? dataParse}) async =>
    httpRequest(path, HttpMethod.POST,
        postData: postData, getParams: getParams, dataParse: dataParse);
