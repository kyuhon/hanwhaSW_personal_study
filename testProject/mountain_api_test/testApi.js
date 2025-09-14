// testApi.js
import fetch from "node-fetch";  // 설치 필요: npm install node-fetch

const params = new URLSearchParams({
    service: "data",
    request: "GetFeature",
    data: "frstclimb", // ✅ 등산로 데이터셋
    key: "발급받은키", // 환경변수 대신 직접 넣어도 됨
    domain: "http://localhost:3000", // 브이월드에 등록한 도메인
    format: "json",
    attrFilter: "mntn_nm:=:설악산",
    crs: "EPSG:4326",
    page: "1",
    size: "5"
});

const url = `https://api.vworld.kr/req/data?${params.toString()}`;
console.log("요청 URL:", url);

fetch(url)
    .then(res => res.json())
    .then(json => {
        console.log("응답 데이터:", JSON.stringify(json, null, 2));
    })
    .catch(err => {
        console.error("API 요청 실패:", err);
    });
