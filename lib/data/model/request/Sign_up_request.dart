/// displayName : "Affvcvfnan"
/// email : "Affcfvnvan@gmail.com"
/// phoneNumber : "01201305203"
/// password : "P@asswo0rd"

class SignUpRequest {
  SignUpRequest({
      this.displayName, 
      this.email, 
      this.phoneNumber, 
      this.password,});

  SignUpRequest.fromJson(dynamic json) {
    displayName = json['displayName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
  }
  String? displayName;
  String? email;
  String? phoneNumber;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['displayName'] = displayName;
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['password'] = password;
    return map;
  }

}