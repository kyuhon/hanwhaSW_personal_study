/* 
    flag option의 종류
    1. i(case insensitive): 대소문자 구분 X
    2. g(global): 대상 문자열 텍스트 내에서 패턴과 일치하는 모든 문자열을 전역에서 검색
                  (이 옵션이 없으면 좌측에서부터 일치하는 하나만 검색 됨)
    3. m(multiline): ^, $가 패턴에 있는 경우 매 개행마다 각 줄의 시작과 종료를 기준으로 
                    검색되게 하는 옵션
                    (이 옵션이 없으면 ^와 $는 전체 문자열의 시작과 끝만 매칭)
*/

const target = "Java JavaScript";
const regex = /va/g;    // exec를 쓸 때는 정규표현식을 변수에 담아야 찾고 다음 것을 또 검색할 수 있다.(정보 유지)

/* 1. exec: 정규표현식에서 제공하는 메소드로 인수로 문자열을 주면 패턴을 찾아 반환(한 번에 하나씩) */
console.log(regex.exec(target));
console.log(regex.exec(target));
console.log(regex.exec("hello"));   //패턴과 일치하지 않으면 null 반환

/* 2. test: 정규표현식에서 제종하는 메소드로 매칭 결과를 boolean으로 반환 */
console.log(/va/.test(target));

/* 3. match: 문자열이 제공하는 메소드로 인수로 정규표현식을 주면 패턴을 찾아 배열로 반환
             (패턴과 일치하는 문자열을 한번에 확인하기 용이) 
*/
console.log(target.match(/va/g));
console.log("패턴과 일치하는 문자열 갯수:", target.match(/va/g).length);

/* multiline 플래그 옵션 예제 */
const text = `첫 번째 줄
두 번째 줄
세 번째 줄`;

const regex1 = /^두/;
console.log(regex.exec(text));
const regex2 = /^두/m;
console.log(regex.exec(text));
const regex3 = /줄$/;
console.log(regex.exec(text));
const regex4 = /줄$/m;
console.log(regex.exec(text));

