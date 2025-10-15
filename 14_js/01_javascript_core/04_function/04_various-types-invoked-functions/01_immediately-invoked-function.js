function hello(name) {
    return `${name}님 안녕!`;
}

(function () {
    console.log('익명 즉시 실행함수! 함수 정의와 동시에 자동 호출');
})();

/* 매개변수 있는 함수에 인수를 전달할 수는 있지만 기명함수로 만들어도 외부에서 호출은 안됨 */
(function greeting(name) {
    console.log(`${name}씨 반가워~`);
})('홍길동');

greeting('피카츄');