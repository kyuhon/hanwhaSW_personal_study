var sym = Symbol('심볼');

var student = {
    name: '유관순',
    age: 15,
    test: undefined
};

student[sym] = '추가';
console.log(student);

/* 해당 객체에 해당 프로퍼티 키 값이 있는지 확인해서 boolean을 남김 */
console.log('name' in student);
console.log('age' in student);
console.log('test' in student);

/* for-in문: 객체가 가진 프로퍼티 키 값들을 순회하며 변수에 담아서 반복 */
for (var key in student) {
    console.log(`key: ${key}`);
    console.log(`value: ${student[key]}`);
    console.log(`<td>${student[key]}</td>`);
}