import FactoryKit

extension Container {

    var apiService: Factory<any APIServiceProtocol> {

        Factory(self) {

            let config = AppConfiguration.shared

            if config.useFakeAPI {

                print("🧪 Using FakeApiService")

                return FakeApiService(
                    scenario: .success
                ) as any APIServiceProtocol

            } else {

                print("🌐 Using APIService")

                return APIService() as any APIServiceProtocol
            }
        }
        .scope(.singleton)
    }
}
