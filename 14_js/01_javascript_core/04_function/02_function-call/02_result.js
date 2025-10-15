/* 반환이 있는 경우: 반환 이후 코드는 동작하지 않음 */
function hello(name) {
    return `${name} 하이~`;
    console.log('return 이후');
}
console.log(hello('꼬부기'));

/* 반환이 없는 경우: undefined가 반환됨 */
function hello2(name) {
    console.log('함수가 호출됨');
}
console.log(hello('파이리'));