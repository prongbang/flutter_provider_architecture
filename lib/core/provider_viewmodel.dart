import 'package:flutter/widgets.dart';
import 'package:flutter_provider_architecture/core/provider_state.dart';

class ProviderViewModel with ChangeNotifier {
  ProviderState _state = Idle();

  ProviderState get state => _state;

  void setState(ProviderState state) {
    _state = state;
    notifyListeners();
  }
}
