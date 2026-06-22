import 'package:flutter/material.dart';
import 'package:flutter_developers_guide/core/config/app_config.dart';
import 'package:logging/logging.dart';

void configureLogging(AppConfig config) {
  /* 
    It simply allows loggers like:
      Logger('ApiService')
      Logger('Repository')
      Logger('PostsBloc')
    to participate in the logging hierarchy
  */
  hierarchicalLoggingEnabled = true;

  // turns logging completely off
  if (!config.enableLogs) {
    Logger.root.level = Level.OFF;
    return;
  }

  Logger.root.level = Level.ALL;

  // whenever any logger emits a log record, send it here.
  Logger.root.onRecord.listen((record) {
    debugPrint(
      '[${record.level.name}] '
      '[${record.loggerName}] '
      '${record.message}',
    );
  });
}
