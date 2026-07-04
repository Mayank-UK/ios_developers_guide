import FactoryKit

extension Container {

    var apiService: Factory<any APIServiceProtocol> {
        /// Scoped and singleton — only one single instance for all injections
        Factory(self) {
            let config = AppConfiguration.shared
            if config.useFakeAPI {
                return FakeApiService(
                    scenario: .success
                ) as any APIServiceProtocol
            } else {
                return APIService() as any APIServiceProtocol
            }
        }
        .scope(.singleton)
    }
}
