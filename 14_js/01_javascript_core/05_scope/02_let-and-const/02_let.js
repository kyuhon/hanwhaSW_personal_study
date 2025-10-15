/* 1. 변수의 중복 선언 방지 */
let msg = '안녕';
// let msg = '잘가';

/* 2. 블록 레벨 스코프 인정 */
let i = 0;
for (let i = 0; i < 10; i++) {

}
console.log('i:', i);

/* 3. 변수 호이스팅 방지 */     // 실제로는 호이스팅이 되게 설정해놔서 다른 오류 문구 발생시킴
console.log(x);     //error 발생
let x = 1;