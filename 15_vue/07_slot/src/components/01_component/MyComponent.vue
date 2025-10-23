<!-- 
    플러그인 설치 이후 vbase-3-setup로 작성
-->
<!-- 
    template
    vue는 사용자의 화면에 보여질 부분을 template 영역에 html요소들로 작성한다.
    (template 태그는 DOM tree로 구성되지 않고 랜더링 될 때 해석되지 않는다.)
-->

<template>
    <div>
        <h1 id="test">MyComponent</h1>
    </div>
</template>

<!-- 
    script
    setup 키워드 덕에 setup() 함수 내부 코드만 작성해도 된다.
-->
<script setup>
// <script>
    import {onMounted} from 'vue';

    // export default {
    //     setup(){
            onMounted(() => {
                console.log('MyComponent 부착!');
            })
    //     }
    // }
</script>

<!-- 
    style scoped
    현재 컴포넌트에서만 적용되는 스타일을 작성한다.(범위 css)
    (해당 컴포넌트가 또 다른 컴포넌트를 품고 있으면 하위 컴포넌트
    에도 적용되는 css)
-->

<style scoped>
    #test {
        color: blue;
    }
</style>