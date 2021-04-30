//
//  TVShowAPIModel.swift
//  Infotainment
//
//  Created by Denny Feng on 4/29/21.
//

import Foundation


class TVShowAPIModel: FetchTVShowModel{
    static let shared = TVShowAPIModel()
    private init() {}
    private let apiKey = "ad72e3da31fb5a89ff269c553aa812c6"
    private let baseAPIURL = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    private let jsonDecoder = Utility.jsonDecoder
    
    
    func fetchAllShows(from endpoint: ShowEndpoint, completion: @escaping (Result<TVShowModel, ShowError>) -> ()) {
        guard let url = URL(string: "\(baseAPIURL)/tv/\(endpoint.rawValue)") else {
                   completion(.failure(.invalidEndpoint))
                   return
               }
               self.loadURLAndDecode(url: url, completion: completion)
    }
    
    func fetchSingleShow(id: Int, completion: @escaping (Result<Shows, ShowError>) -> ()) {
        guard let url = URL(string: "\(baseAPIURL)/tv/\(id)") else {
                   completion(.failure(.invalidEndpoint))
                   return
               }
               self.loadURLAndDecode(url: url, params: [
                   "append_to_response": "videos,credits"
               ], completion: completion)
    }
    
    func searchShow(query: String, completion: @escaping (Result<TVShowModel, ShowError>) -> ()) {
        guard let url = URL(string: "\(baseAPIURL)/search/tv") else {
                   completion(.failure(.invalidEndpoint))
                   return
               }
               self.loadURLAndDecode(url: url, params: [
                   "language": "en-US",
                   "include_adult": "false",
                   "region": "US",
                   "query": query
               ], completion: completion)
    }
    
    // MARK: Load Movie API url and decode
        private func loadURLAndDecode<D: Decodable>(url: URL, params: [String: String]? = nil, completion: @escaping (Result<D, ShowError>) -> ()) {
               guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
                   completion(.failure(.invalidEndpoint))
                   return
               }
               
               var queryItems = [URLQueryItem(name: "api_key", value: apiKey)]
               if let params = params {
                   queryItems.append(contentsOf: params.map { URLQueryItem(name: $0.key, value: $0.value) })
               }
               
               urlComponents.queryItems = queryItems
               
               guard let finalURL = urlComponents.url else {
                   completion(.failure(.invalidEndpoint))
                   return
               }
               
               urlSession.dataTask(with: finalURL) { [weak self] (data, response, error) in
                   guard let self = self else { return }
                   
                   if error != nil {
                       self.executeCompletionHandlerInMainThread(with: .failure(.apiError), completion: completion)
                       return
                   }
                   
                   guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                       self.executeCompletionHandlerInMainThread(with: .failure(.invalidResponse), completion: completion)
                       return
                   }
                   
                   guard let data = data else {
                       self.executeCompletionHandlerInMainThread(with: .failure(.noData), completion: completion)
                       return
                   }
                   
                   do {
                       let decodedResponse = try self.jsonDecoder.decode(D.self, from: data)
                       self.executeCompletionHandlerInMainThread(with: .success(decodedResponse), completion: completion)
                   } catch {
                       self.executeCompletionHandlerInMainThread(with: .failure(.serializationError), completion: completion)
                   }
               }.resume()
           }
           
    //MARK:    Dispatch the result in async
           private func executeCompletionHandlerInMainThread<D: Decodable>(with result: Result<D, ShowError>, completion: @escaping (Result<D, ShowError>) -> ()) {
               DispatchQueue.main.async {
                   completion(result)
               }
           }
           
           
           
       }

