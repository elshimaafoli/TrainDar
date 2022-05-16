class URI {
  static Map<String, String> headers = {
    "Accept": "application/json",
    "content-type": "application/json"
  };
// trains
  static String getTrainId =
      "https://train-dar.azurewebsites.net/api/v1/train/view";
  static String getTrainLocation =
      "https://train-dar.azurewebsites.net/api/v1/train/view/";

//Stations
  static String getNameStations =
      "https://train-dar.azurewebsites.net/api/v1/station/all";
//User
  static String login = "https://train-dar.azurewebsites.net/api/v1/sign-in";
  static String createUser =
      'https://train-dar.azurewebsites.net/api/v1/registration';
  static String getUserData =
      'https://train-dar.azurewebsites.net/api/v1/user/';

//return password
  static String email =
      "https://train-dar.azurewebsites.net/api/v1/reset-password/";
  static String code =
      'https://train-dar.azurewebsites.net/api/v1/reset-password/email-token?';
  static String newPassword =
      "https://train-dar.azurewebsites.net/api/v1/reset-password/email-password";

  //share location
  static String sendId =
      "https://train-dar.azurewebsites.net/api/v1/train/add-user?";
}
