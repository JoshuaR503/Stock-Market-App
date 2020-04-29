import 'package:data_connection_checker/data_connection_checker.dart';

class NetworkHelper {
  Future<bool> get isConnected async => await DataConnectionChecker().hasConnection;
}