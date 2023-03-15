class Urls {
  static String baseUrl = "https://task.teamrabbil.com/api/v1";
  static String loginUrl = "$baseUrl/login";
  static String registrationUrl = "$baseUrl/registration";
  static String addNewTask = "$baseUrl/createTask";
  static String newTaskList = "$baseUrl/listTaskByStatus/New";
  static String completedTaskList = "$baseUrl/listTaskByStatus/Completed";
  static String cancelTaskList = "$baseUrl/listTaskByStatus/Cancel";
  static String progressTaskList = "$baseUrl/listTaskByStatus/Progress";

  static String changeStatusUrl(taskId, taskStatus) =>
      "$baseUrl/updateTaskStatus/$taskId/$taskStatus";

  static String deleteTask(taskId) => "$baseUrl/deleteTask/$taskId";

  static String forgetPassword(registeredEmailId) =>
      "$baseUrl/RecoverVerifyEmail/$registeredEmailId";

  static String recoverVerifyOtP(registeredEmailId, otp) =>
      "$baseUrl/RecoverVerifyOTP/$registeredEmailId/$otp";

  static String resetPassword = "$baseUrl//RecoverResetPass";

}