import { createApp } from 'vue'
import App from './App.vue'
import router from './router/01_router'

/* npm install vue-router@next로 dependency 추가 */
// create(App).use(router).mount('#app');
const app = createApp(App);
app.use(router);
app.mount('#app');
