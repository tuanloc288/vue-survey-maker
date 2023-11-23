import { createApp } from "vue";
import store from "./store";
import router from "./router";
import "./index.css";
import App from "./App.vue";
import i18n from './i18n'

createApp(App).use(i18n).use(store).use(router).mount("#app");
