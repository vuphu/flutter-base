abstract class Environment {}

class ProdEnvironment extends Environment {}

class BuildSetting {
  static initialize(Environment environment) {
    // No-op
  }
}
