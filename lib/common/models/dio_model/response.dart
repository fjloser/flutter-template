/// 响应异常处理类（服务器返回的异常）
/// TODO 后续对接根据返回情况进行完善
class ResponseException implements Exception {
  int? code;
  String? errMsg;

  ResponseException({this.code});

  int? get errorCode => code;

//statusCode==200时候返回的data中存在的code
  String? get errorMessage {
    String msg = errMsg ?? "未知错误";
    return msg;
  }

  @override
  String toString() {
    return 'RequestException{errorCode: $errorCode, errorMessage: $errorMessage}';
  }
}

abstract class BaseResponse {
  int? code;
  String message;
  dynamic data;
  bool get success;
  BaseResponse({this.code, this.message = "服务器未知错误", this.data});
  @override
  String toString() {
    return 'BaseResponse{code: $code, message: $message, data: $data}';
  }
}

class ResponseData extends BaseResponse {
  @override
  bool get success => data != null;
  ResponseData.fromJson(Map<String, dynamic> json) {
    if (json['code'] != null && json['code'] is String) {
      json['code'] = int.parse(json['code']);
    }
    code = json['code'] ?? json['respCode'];
    message = json['message'] ?? json['respDesc'] ?? json['msg'];
    dynamic attribute = json["data"] ?? json['attribute'];
    if (attribute is Map && attribute.containsKey("data")) {
      data = attribute['data'];
    } else {
      data = attribute;
    }
  }
}
