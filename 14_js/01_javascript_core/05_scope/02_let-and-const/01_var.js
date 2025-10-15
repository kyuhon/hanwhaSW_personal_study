/* 함수 레벨 스코프 */
/*
    C, 자바 등 대부분의 프로그래밍 언어는 모든 코드 블럭(if, for, while, try/catch 등)이
    지역 스코프를 만드는 블록 레벨 스코프(block level scope)를 가진다.
    하지만 var 키워드로 선언된 변수는 함수의 코드블록(함수 몸체)만을 지역 스코프로 인정하는
    함수 레벨 스코프(function level scope)를 가진다.
*/
var i = 0;
for (var i = 0; i < 10; i++) {

}


console.log(i);     // for문 안의 var i는 for문 범위가 스코프로 인정되지 않기 때문에 지역변수가 아니게 됨

/* var 키워드의 특징 */
/* 1. 같은 범위(전역 또는 같은 함수 레벨 스코프)에서 변수 중복 선언 가능 */
var msg = '안녕하세요';
console.log('msg:', msg);
var msg = '안녕히 가세요';
console.log('msg:', msg);
var msg;                // 변수가 초기화 되지 않고 중복 선언된 경우는 무시됨(불규칙)
console.log('msg:', msg);

/* 2. 함수 레벨 스코프만 인정 됨(위에서 확인) */

/* 3. 변수 호이스팅 */
console.log(test);      // undefined

test = '반갑습니다.';     // 대입이 안된 상태로 호이스팅 됨 
var test;