/* 단축 평가 구문 */
/* 논리 연산의 결과를 결정지을 항만 남는다. */
/* 1. OR의 경우 */
console.log('apple' || 'banana');
console.log('' || 'banana');
console.log('apple' || false);

/* 2. AND의 경우 */
console.log('apple' && 'banana');
console.log('' && 'banana');
console.log('apple' && false);

/* 3. 단축 평가 구문 */
var num = 3;
num % 2 == 0 && console.log('짝수입니다.');     // &&일 때는 좌축이 true여야 우측이 실행
num % 2 == 0 || console.log('홀수입니다.');     // ||일 때는 좌측이 false여야 우측이 실행

// if (num % 2 == 0) {
//     console.log('짝수입니다.');
// } else {
//     console.log('홀수입니다.')
// }