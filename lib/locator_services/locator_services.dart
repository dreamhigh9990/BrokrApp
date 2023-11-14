abstract class LocatorServices {
  static final LocatorServices _instance = _LocatorServicesImplementation();

  /// access to the Singleton instance of GetIt
  static LocatorServices get instance {
    return _instance;
  }

  /// Short form to access the instance of GetIt
  static LocatorServices get I => instance;

  T call<T>({String instanceName, dynamic param1, dynamic param2});

  // ignore: public_member_api_docs
  void register<T>(T instance);
}

class _LocatorServicesImplementation implements LocatorServices {
  Object? instance;
  _LocatorServicesImplementation({
    this.instance,
  });

  T get<T>({String? instanceName, dynamic param1, dynamic param2}) {
    return instance as T;
  }

  @override
  T call<T>({String? instanceName, dynamic param1, dynamic param2}) {
    return instance as T;
  }

  @override
  void register<T>(T instance) {
    this.instance = instance;
  }
}
