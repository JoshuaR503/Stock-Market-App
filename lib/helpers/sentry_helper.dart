import 'package:sentry/io_client.dart';
import 'package:sma/keys/api_keys.dart';

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

    await SentryClient(dsn: kSentryDomainNameSystem).captureException(
      exception: exception,
      stackTrace: stackTrace
    );
  }
}