//
//  APIRequestHelper.swift
//  StarWarsBlastersTournament
//
//  Created by Soumya Ranjan Mishra on 11/07/24.
//

import Alamofire

class APIRequestHelper {
    static let shared = APIRequestHelper()

    private init() {}

    private let session: Session = {
        let manager = ServerTrustManager(evaluators: ["jsonkeeper.com": DisabledTrustEvaluator()])
        let configuration = URLSessionConfiguration.af.default
        return Session(configuration: configuration, serverTrustManager: manager)
    }()

    func request<T: Decodable>(_ url: String, method: HTTPMethod = .get, parameters: Parameters? = nil, completion: @escaping (Result<T, NetworkError>) -> Void) {
        session.request(url, method: method, parameters: parameters).validate().responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(.error(error.localizedDescription)))
            }
        }
    }
}

