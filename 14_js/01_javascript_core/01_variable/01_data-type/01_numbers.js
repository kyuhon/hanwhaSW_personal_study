/* 
    data-type은 값의 종류를 말하며 자바스크립트(ES6)는 7개의 데이터타입
    (number, string, boolean, undefined, null, symbol, object)을 제공한다.
*/

/*
    정수, 실수, 음수 모든 숫자(number)타입이다. (내부적으로는 실수로만 인식)
*/
var integer = 10;
var double = 5.5;
var negative = -10;

console.log(typeof integer);
var integer = '한글';            // 같은 이름의 변수를 또 선언할 수도 있다.(var로 선언된 변수면)
console.log(typeof integer);    // 동적 타입 언어
console.log(typeof double);
console.log(typeof negative);

console.log(10 / 4);
console.log(10 / 0);        // -Infinity
console.log(1 * '문자열');   // NaN
console.log("문자열");
