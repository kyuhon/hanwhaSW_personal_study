import { createApp } from 'vue'
import App from './App.vue'
// import router from './router/01_router'
import router2 from './router/02_nestedRouter'

/* npm install vue-router@next로 dependency 추가 */
// create(App).use(router).mount('#app');
const app = createApp(App);
// app.use(router);
app.use(router2);
app.mount('#app');
