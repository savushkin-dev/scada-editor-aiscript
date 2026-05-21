package ru.drm.scada.adapter.ai;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import ru.drm.scada.usecase.AiLuaAnalyzer;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * ИИ-анализатор Lua на базе OpenAI API.
 * Извлекает теги (DI/DO/AI/AO) из динамических конструкций: конкатенация, string.format, циклы.
 * Читает OPENAI_API_KEY из переменной окружения.
 */
public class OpenAiLuaAnalyzer implements AiLuaAnalyzer {

    private static final String API_URL = "https://api.openai.com/v1/chat/completions";
    private static final String MODEL = "gpt-4o-mini";
    private static final int MAX_TOKENS = 2000;
    private static final Duration TIMEOUT = Duration.ofSeconds(60);

    private final String apiKey;
    private final ObjectMapper json = new ObjectMapper();
    private final HttpClient http = HttpClient.newBuilder().connectTimeout(TIMEOUT).build();

    public OpenAiLuaAnalyzer() {
        String key = System.getenv("OPENAI_API_KEY");
        this.apiKey = key != null ? key.trim() : null;
    }

    public OpenAiLuaAnalyzer(String apiKey) {
        this.apiKey = apiKey != null ? apiKey.trim() : null;
    }

    @Override
    public Set<String> extractAdditionalTags(String luaCode) {
        if (apiKey == null || apiKey.isEmpty() || luaCode == null || luaCode.isBlank()) {
            return Set.of();
        }
        String truncated = luaCode.length() > 8000 ? luaCode.substring(0, 8000) + "\n-- [...]" : luaCode;

        String prompt = """
            В Lua-коде для SCADA используются теги: вызовы DI("..."), DO("..."), AI("..."), AO("...").
            Извлеки ВСЕ возможные имена тегов, включая те, что формируются динамически:
            - конкатенация: "PREFIX"..var.."SUFFIX"
            - string.format
            - циклы, переменные
            Верни ТОЛЬКО JSON: {"tags":["TAG1","TAG2",...]}
            Без пояснений и markdown. Если ничего не найдено — {"tags":[]}
            """ + "\n\nLua:\n" + truncated;

        String response = callApi(prompt);
        return response != null ? parseTags(response) : Set.of();
    }

    private String callApi(String prompt) {
        try {
            Map<String, Object> body = Map.of(
                    "model", MODEL,
                    "messages", List.of(Map.of("role", "user", "content", prompt)),
                    "max_tokens", MAX_TOKENS
            );
            HttpRequest req = HttpRequest.newBuilder()
                    .uri(URI.create(API_URL))
                    .header("Content-Type", "application/json")
                    .header("Authorization", "Bearer " + apiKey)
                    .timeout(TIMEOUT)
                    .POST(HttpRequest.BodyPublishers.ofString(json.writeValueAsString(body), StandardCharsets.UTF_8))
                    .build();

            HttpResponse<String> res = http.send(req, HttpResponse.BodyHandlers.ofString(StandardCharsets.UTF_8));
            if (res.statusCode() != 200) return null;

            JsonNode root = json.readTree(res.body());
            JsonNode choice = root.path("choices").get(0);
            if (choice == null) return null;
            String content = choice.path("message").path("content").asText();
            return content.isBlank() ? null : content;
        } catch (Exception e) {
            return null;
        }
    }

    private Set<String> parseTags(String content) {
        String cleaned = content.replaceAll("(?s)```json\\s*", "").replaceAll("(?s)\\s*```", "").trim();
        try {
            JsonNode root = json.readTree(cleaned);
            JsonNode arr = root.path("tags");
            if (!arr.isArray()) return Set.of();
            Set<String> tags = new HashSet<>();
            for (JsonNode n : arr) {
                String t = n.asText("").trim();
                if (!t.isEmpty()) tags.add(t);
            }
            return tags;
        } catch (Exception e) {
            return Collections.emptySet();
        }
    }
}
