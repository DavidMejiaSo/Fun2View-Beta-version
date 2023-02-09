String get apiHost {
  bool isProd = const bool.fromEnvironment('dart.vm.product');
  if (isProd) {
    return 'https://fun2view.com/mobile/v1/';
    // replace with your production API endpoint
  }

  return "https://design2.fun2view.com/mobile/v1/";
  // replace with your own development API endpoint
}
