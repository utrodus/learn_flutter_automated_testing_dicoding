import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:integration_test/integration_test_driver.dart';

/// To run this performance test we can use the command:
/// flutter drive --driver=test_driver/perf_driver.dart --target=integration_test/app_test.dart --no-dds
/// Automatically, the recording will be saved in the build folder
/// with the file name timeline.timeline.json. You can review the file through
/// the tool owned by Chrome Browser, namely tracing by accessing the chrome link:
/// chrome://tracing
/// Tool tersebut menyediakan interface yang mudah digunakan layaknya profiling aplikasi.
Future<void> main() {
  return integrationDriver(responseDataCallback: (data) async {
    if (data != null) {
      final timeline = driver.Timeline.fromJson(data['timeline']);
      final summary = driver.TimelineSummary.summarize(timeline);

      ///
      await summary.writeTimelineToFile(
        'timeline',
        pretty: true,
        includeSummary: false,
      );
    }
  });
}
