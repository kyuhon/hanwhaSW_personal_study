/* 콜백 함수: 다른 함수의 인수로 쓰이는 함수 */
function increase(value) {
    return value + 1;
}

function decrease(value) {
    return value - 1;
}

/* 고차 함수: 다른 함수를 활용하는 함수 */
function apply(func, value) {
    return func(value);
}

/* 필요에 따라 콜백함수를 정해 고차함수를 호출할 수 있다. */
console.log(apply(increase, 5));    // 6
console.log(apply(decrease, 5));    // 4

console.log([3, 2, 1, 5, 4].sort(function (left, right) { return right - left; }));
console.log([3, 2, 1, 5, 4].sort((left, right) => -(right - left)));

/* 비동기 처리(이벤트, 타이머, ajax, fetch, ...) */