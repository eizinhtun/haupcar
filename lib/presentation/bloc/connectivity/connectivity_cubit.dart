// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

enum ConnectivityStatus { connected, disconnected }

class ConnectivityCubit extends Cubit<ConnectivityStatus> {
  final Connectivity _connectivity;
  ConnectivityCubit(this._connectivity) : super(ConnectivityStatus.connected) {
    _connectivity.onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        emit(ConnectivityStatus.disconnected);
      } else {
        emit(ConnectivityStatus.connected);
      }
    });
  }
}
