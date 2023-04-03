class CreateUserResponse {
  String? access;
  String? refresh;
  CreateUserResponse({required this.access, required this.refresh});

  CreateUserResponse.fromMap(Map<String, dynamic> map) {
    access = map["access"];
    refresh = map["refresh"];
  }
}
