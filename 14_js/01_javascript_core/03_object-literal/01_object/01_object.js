/* 
    자바스크립트는 프로토타입 기반의 객체 지향(기반) 프로그래밍 언어로 원시 값을 제외한 나머지 값
    (함수, 배열, 정규표현식 등)은 모두 객체(object)이다.(프로토타입을 가지면 객체)
*/
var name = '홍씨';
var age = 10;
console.log(globalThis);
var student = {

    /* 속성 프로퍼티 */
    name: '유관순',
    age: 16,

    /* 기능 프로퍼티(=메서드) */
    /* 메서드 안에서는 this.을 반드시 쓰자(안쓰면 전역 변수(global 객체의 property)가 나올 수 있음) */
    getInfo: function () {
        return `${this.name}(은)는 ${this.age}세 입니다.`;  // this는 메서드를 포함한 객체를 의미
        // this를 붙여야 전역객체가 아닌 속성 프로퍼티에서 값을 가져옴
    }
};

console.log('student:', student);
console.log('이름:', student.name);
console.log('나이:', student.age);
console.log('정보:', student.getInfo);