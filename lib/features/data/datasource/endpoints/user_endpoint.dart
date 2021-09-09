class UserEndPoint {
  //ip e porta do servidor da API
  static String HOST = "192.168.100.25:8080";

  static Uri createUser() => Uri.http(HOST, "/api/user");
}
