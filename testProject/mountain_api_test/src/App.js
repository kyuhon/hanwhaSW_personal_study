import React, { useEffect, useState } from "react";

function App() {
  const [features, setFeatures] = useState(null);

  useEffect(() => {
    const fetchTrails = async () => {
      try {
        // URL 전체를 한 번에 작성
        const url = `https://api.vworld.kr/req/search?service=search&request=search&version=2.0&crs=EPSG:900913&bbox=14140071.146077,4494339.6527027,14160071.146077,4496339.6527027&size=10&page=1&query=성남시 분당구 판교로 242&type=address&category=road&format=json&errorformat=json&key=${process.env.REACT_APP_VWORLD_KEY}`;
        // ${process.env.REACT_APP_VWORLD_KEY} ${process.env.REACT_APP_VWORLD_DOMAIN}
        console.log("Request URL:", url);

        const res = await fetch(url);
        if (!res.ok) throw new Error(`HTTP ${res.status}`);
        const json = await res.json();
        console.log("vworld response:", json);

        const feats = json?.response?.result?.featureCollection?.features || [];
        setFeatures(feats);
      } catch (err) {
        console.error("API 요청 실패:", err);
        setFeatures({ error: err.message });
      }
    };

    fetchTrails();
  }, []);

  return (
      <div style={{ padding: 20 }}>
        <h1>브이월드 등산로(frstclimb) 테스트</h1>
        <h3 style={{ whiteSpace: "pre-wrap" }}>
          {features ? JSON.stringify(features, null, 2) : "로딩 중..."}
        </h3>
      </div>
  );
}

export default App;
