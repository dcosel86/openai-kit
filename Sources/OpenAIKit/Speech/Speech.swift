import Foundation

/**
 Given a prompt, the model will return one or more predicted chat completions, and can also return the probabilities of alternative tokens at each position.
 */
public struct Speech {
  public let model: TextToSpeechModel
  public let text: String
  public let voice: Voice
//    public let id: String
}

extension Speech: Codable {}

extension Speech {
    public enum Voice: String {
      case alloy
      case echo
      case fable
      case onyx
      case nova
      case shimmer
    }
}

extension Speech.Voice: Codable {}

extension Speech {
    public enum TextToSpeechModel: String {
      case tts
      case tts_1 = "tts-1"
      case tts_1_hd = "tts-1-hd"
    }
}

extension Speech.TextToSpeechModel: Codable {}


//extension Chat {
//    public enum Message {
//        case system(content: String)
//        case user(content: String)
//        case assistant(content: String)
//    }
//}
//
//extension Chat.Message: Codable {
//    private enum CodingKeys: String, CodingKey {
//        case role
//        case content
//    }
//
//    public init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        let role = try container.decode(String.self, forKey: .role)
//        let content = try container.decode(String.self, forKey: .content)
//        switch role {
//        case "system":
//            self = .system(content: content)
//        case "user":
//            self = .user(content: content)
//        case "assistant":
//            self = .assistant(content: content)
//        default:
//            throw DecodingError.dataCorruptedError(forKey: .role, in: container, debugDescription: "Invalid type")
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.container(keyedBy: CodingKeys.self)
//        switch self {
//        case .system(let content):
//            try container.encode("system", forKey: .role)
//            try container.encode(content, forKey: .content)
//        case .user(let content):
//            try container.encode("user", forKey: .role)
//            try container.encode(content, forKey: .content)
//        case .assistant(let content):
//            try container.encode("assistant", forKey: .role)
//            try container.encode(content, forKey: .content)
//        }
//    }
//}
//
//extension Chat.Message {
//    public var content: String {
//        get {
//            switch self {
//            case .system(let content), .user(let content), .assistant(let content):
//                return content
//            }
//        }
//        set {
//            switch self {
//            case .system: self = .system(content: newValue)
//            case .user: self = .user(content: newValue)
//            case .assistant: self = .assistant(content: newValue)
//            }
//        }
//    }
//}
