import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  final FirebaseAnalytics analytics;

  AnalyticsService(this.analytics);

  Future<void> setUserId(String? userId) {
    return analytics.setUserId(
      id: userId,
    );
  }

  Future<void> logLogin() {
    return analytics.logLogin();
  }

  Future<void> logRegister() {
    return analytics.logSignUp(
      signUpMethod: 'email',
    );
  }

  Future<void> logLogout() {
    return analytics.logEvent(
      name: 'logout',
    );
  }

  Future<void> logTodoCreated() {
    return analytics.logEvent(
      name: 'todo_created',
    );
  }

  Future<void> logTodoCompleted() {
    return analytics.logEvent(
      name: 'todo_completed',
    );
  }

  Future<void> logTodoDeleted() {
    return analytics.logEvent(
      name: 'todo_deleted',
    );
  }

  Future<void> logImageUploaded() {
    return analytics.logEvent(
      name: 'image_uploaded',
    );
  }

  Future<void> logImageDeleted() {
    return analytics.logEvent(
      name: 'image_deleted',
    );
  }

  Future<void> logFailure(
    String eventName,
    String reason,
  ) {
    return analytics.logEvent(
      name: eventName,
      parameters: {
        'reason': reason,
      },
    );
  }
}
