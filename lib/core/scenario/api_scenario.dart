/// Selects which failure path the dev-only [FailureInjectionInterceptor] (and
/// the single-responsibility fake remote data sources) simulates. Mirrors
/// Android's `core/scenario/Scenarios.kt`.
///
/// Shared so the REST failure-injection interceptor and the Firebase-backed
/// fake services describe the same set of simulated outcomes.
enum ApiScenario {
  success,
  networkError,
  timeout,
  serverError,
  invalidJson,
}
