var x = 'global x';
var y = 'global y';

function outer() {
    var z = "outer's local z";

    console.log(x);
    console.log(y);
    console.log(z);

    function inner() {
        var x = "inner's local x";

        console.log('inner:', x);
        console.log('inner:', y);
        console.log('inner:', z);
    }
    inner();
}

outer();
console.log(z);     // 전역에서는 outer나 inner같은 지역 변수는 활용할 수 x

/*
    스코프 체인

    inner 스코프 -> outer 스코프 -> global 스코프 순으로 우선순위가 결정된다.
    모든 스코프는 하나의 계층적 구조로 연결되며 자바스크립트 엔진은 스코프 체인을 통해
    변수를 참조하며 코드의 상위 스코프 방향으로 이동한다.
    (하위 스코프에서 유효한 변수를 상위 스코프에서는 참조할 수 없다.)
*/