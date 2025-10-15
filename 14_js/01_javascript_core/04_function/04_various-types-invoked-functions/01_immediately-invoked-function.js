function hello(name) {
    return `${name}님 안녕!`;
}

(function () {
    console.log('익명 즉시 실행함수! 함수 정의와 동시에 자동 호출');
})();

(function (name) {
    console.log(`${name}씨 반가워~`);
})('홍길동');