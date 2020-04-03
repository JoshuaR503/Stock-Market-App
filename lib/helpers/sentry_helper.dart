import 'package:sentry/io_client.dart';
import 'package:sma/key.dart';

class SentryHelper {

  final dynamic exception;
  final dynamic stackTrace;

  SentryHelper({
    this.exception,
    this.stackTrace
  });

  Future<void> report() async {

    print(this.exception);
    print(this.stackTrace);

    await SentryClient(dsn: sentryDNS).captureException(
      exception: exception,
      stackTrace: stackTrace
    );
  }
}