class Response {
  final Map? data;
  final int? status;
  String message = '';
  final bool? error;

  Response.init(this.data, this.status, this.message, this.error);
  Response.error({this.data, this.status, required this.message, this.error});
/*   Response.fromJson(Map<String, dynamic> json)
      : data = json['data'],
        status = json['status'],
        message = json['statusText'],
        error = json['error']; */

  factory Response(Map<String, dynamic> json) {
    return Response.init(json['data'], json['status'], json['statusText'], json['error']);
  }
}
