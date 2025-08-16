//
//  Typealiases.swift
//  HelloWorld
//
//  Created by Adriano Rodrigues Vieira on 03/08/25.
//
import Networkingo

typealias ResultHandler<D: Decodable> = (Result<D, ApiError>) -> Void
