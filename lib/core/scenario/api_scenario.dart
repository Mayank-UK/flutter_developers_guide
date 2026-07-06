/// Selects which failure path the dev-only [FailureInjectionInterceptor] (and the
/// [FakeApiService]) simulates. Mirrors Android's `core/scenario/Scenarios.kt`.
///
/// Shared so the REST failure-injection interceptor and the Firebase-backed fake
/// service describe the same set of simulated outcomes.
enum ApiScenario {
  success,
  networkError,
  timeout,
  serverError,
  invalidJson,
}
