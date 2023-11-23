import { createI18n } from "vue-i18n";
import EN from "./locale/en.json";
import VN from "./locale/vn.json";

let i18n = createI18n({
  locale: document.cookie.split("=")[1] ? document.cookie.split("=")[1] : 'EN', 
  messages: {
    EN: EN,
    VN: VN,
  },
});

export default i18n