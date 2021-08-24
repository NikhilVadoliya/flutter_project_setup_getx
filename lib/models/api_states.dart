class APIStatus {
  bool isOk;
  String message;
  int errorCode;

  APIStatus({this.isOk = true, this.errorCode = 200, this.message = ''});

  APIStatus.init({this.isOk = false, this.errorCode = -1, this.message = ''});
}
