enum AppRoute {
  loginPage('/login', 'loginPage'),
  registerPage('/register', 'registerPage'),
  homePage('/home', 'homePage');

  final String path;
  final String name;
  const AppRoute(this.path, this.name);
}
