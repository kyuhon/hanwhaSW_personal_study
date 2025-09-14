package com.ohgiraffers.mountain_api_spring_test;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@Controller
public class VWorldController {

    @GetMapping("/")
    public String search(Model model) throws UnsupportedEncodingException {
        String apiKey = "F811D44A-06A3-36B5-9DDD-FE08EC43D4B4"; // 실제 키 넣기
        String query = URLEncoder.encode("성남시 분당구 판교로 242","UTF-8");
        String apiUrl = "https://api.vworld.kr/req/search?"
                    + "service=search&request=search&version=2.0&crs=EPSG:900913&bbox=14140071.146077,4494339.6527027,14160071.146077,4496339.6527027&size=10&page=1&query=" + query + "&type=address&category=road&format=json&errorformat=json"
                    + "&key=" + apiKey;


        try {
            URL url = new URL(apiUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            BufferedReader br = new BufferedReader(
                    new InputStreamReader(conn.getInputStream(), "UTF-8"));

            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }

            br.close();
            conn.disconnect();

            // JSON Pretty Print
            ObjectMapper mapper = new ObjectMapper();
            Object jsonObj = mapper.readValue(sb.toString(), Object.class);
            String prettyJson = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(jsonObj);


            // JSON 결과를 JSP로 전달
            model.addAttribute("result", prettyJson);

        } catch (Exception e) {
            model.addAttribute("result", "API 요청 실패: " + e.getMessage());
        }

        return "searchResult"; // searchResult.jsp

    }
}
