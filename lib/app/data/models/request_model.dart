class RequestModel {
  final int? status;
  final String? message;
  final dynamic data;

  RequestModel({this.status, this.message, this.data});

  factory RequestModel.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return RequestModel(
        status: json['status'],
        message: json['message'],
        data: json['data'],
      );
    }
    return RequestModel(data: json);
  }
}
