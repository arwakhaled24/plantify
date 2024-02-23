/// displayName : "aFofo"
/// email : "afofo@gmail.com"
/// token : "eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJhRm9mbyIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6ImFmb2ZvQGdtYWlsLmNvbSIsImV4cCI6MTcxMTA0MTM1MiwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzAwMSIsImF1ZCI6Ik15U2VjdXJlZFVzZXIifQ.ydpE0s1iZtf281CDHXuxg5Flr40mkTJLiXd0tiWal6M"

class SigningRespond {
  SigningRespond({
      this.displayName, 
      this.email,
    this.statusCode,
    this.message,
      this.token,});

  SigningRespond.fromJson(dynamic json) {
    displayName = json['displayName'];
    email = json['email'];
    token = json['token'];
    statusCode = json['statusCode'];
    message = json['message'];
  }
  String? displayName;
  String? email;
  String? token;
  String?message;
  int? statusCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['displayName'] = displayName;
    map['email'] = email;
    map['statusCode'] = statusCode;
    map['token'] = token;
    map['message'] = message;
    return map;
  }

}