import 'dart:async';

import 'package:event_bus/event_bus.dart';

AppEvent appEvent = AppEvent();

typedef EventSubscription = StreamSubscription;

class AppEventOnce<T> {
  late EventSubscription subscription;
  EventSubscription on(void Function(T event) onData) {
    subscription = appEvent.on<T>((event) {
      subscription.cancel();
      onData(event);
    });
    return subscription;
  }
}

class AppEvent {
  static final EventBus _eventBus = EventBus();

  EventSubscription on<T>(void Function(T event) onData) {
    return _eventBus.on<T>().listen(onData);
  }

  void off(EventSubscription? subscription) {
    subscription?.cancel();
  }

  void fire<T>(T event) {
    _eventBus.fire(event);
  }
}
