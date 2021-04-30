class Response {
  final Map? data;
  final int? status;
  final String? message;
  final bool? error;

  const Response(this.data, this.status, this.message, this.error);
  Response.error({this.data, this.status, this.message, this.error});
  Response.fromJson(Map<String, dynamic> json)
      : data = json['data'],
        status = json['status'],
        message = json['statusText'],
        error = json['error'];
}
