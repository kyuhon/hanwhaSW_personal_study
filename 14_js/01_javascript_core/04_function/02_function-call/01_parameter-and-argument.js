function hello(name) {
    console.log('넘어온 값:', name);

    /*
        모든 함수는 반드시 arguments라는 유사배열(배열같은 객체(인덱스 같은 프로퍼티와 length라는 프로퍼티를 가짐))
        모든 인수(전달인자)는 함수 안에서 arguments 객체의 프로퍼티로 보관된다.
    */
    console.log('arguments:', arguments);
    console.log('arguments[1]:', arguments[1]);     // 배열은 아니지만 유사 배열처럼 사용한다(엄연히 객체)

    return `${name}님 안녕하세요`;
}

hello('홍길동');
console.log('result:', hello('홍길동'));

console.log('======================')

console.log('result:', hello());

console.log('======================')

var result = hello('홍길동', '유관순');
console.log('result:', result);