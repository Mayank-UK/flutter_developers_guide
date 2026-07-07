/// Selects which failure path the dev-only [FakeAppDatabase] simulates.
/// Mirrors Android's `core/scenario/Scenarios.kt`.
enum DbScenario { success, empty, readError, writeError }
