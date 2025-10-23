
<!-- 다른 파일을 불러올 때는 상대경로(./) 또는 src부터의 경로인 절대경로(@)를 사용할 수 있다. -->
<script setup>
  // import MyComponent from './components/01_component/MyComponent.vue';
  import MyComponent from '@/components/01_component/MyComponent.vue'
  import SlotParent from './components/02_slotintro/SlotParent.vue'
  import NamedParent from './components/03_namedslot/NamedParent.vue'
  import DynamicParent from './components/04_dynamicslot/DynamicParent.vue'
</script>

<template>
  <header>
    <div class="redColor">
      <MyComponent/>
    </div>
  </header>
  <main>
      <SlotParent/>
      <NamedParent/>
      <DynamicParent/>
  </main>
</template>

<style scoped>
.redColor {
  color: red;
}
</style>
