var obj = {
    normal: 'normal value',
    '@ s p a c e@': 'space value',      // 특수기호 (_, $)를 쓸 수는 있으며 하지만 사용은 지양
    '': '',                             // 빈 문자열도 가능은 하지만 지양
    0: 1,                               // 숫자형 프로퍼티명은 내부적으로 문자열로 변환됨('0')
    var: 'var',                         // 예약어(존재하는 키워드) 사용 지양
    normal: 'new value'                 // 프로퍼티명이 중복되면 나중에 작성된 것만 인정
};

/* 기존에 없는 프로퍼티는 접근하면 추가됨 */
obj['test'] = 'test value';
console.log(obj);

console.log(obj['@ s p a c e@']);
console.log(obj['normal']);