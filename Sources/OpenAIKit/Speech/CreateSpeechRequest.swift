import AsyncHTTPClient
import NIOHTTP1
import Foundation

struct CreateSpeechRequest: Request {
    let method: HTTPMethod = .POST
    let path = "v1/audio/speech"
    let body: Data?

    init(
        model: Speech.TextToSpeechModel,
        text: String,
        voice: Speech.Voice
    ) throws {
        let body = Body(
            model: model,
            text: text,
            voice: voice
        )

        self.body = try Self.encoder.encode(body)
    }
}

extension CreateSpeechRequest {
    struct Body: Encodable {
        let model: Speech.TextToSpeechModel
        let text: String
        let voice: Speech.Voice

        enum CodingKeys: CodingKey {
            case model
            case text
            case voice
        }

        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(model, forKey: .model)

            if !text.isEmpty {
                try container.encode(text, forKey: .text)
            }
            try container.encode(model, forKey: .model)
            try container.encode(voice, forKey: .voice)
        }
    }
}
