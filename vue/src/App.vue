<template>
  <router-view> </router-view>
</template>

<script setup>
import { useDark } from "@vueuse/core";
import { onMounted } from "vue";

useDark();

function checkCookie(name) {
  var cookies = document.cookie.split(";");
  for (var i = 0; i < cookies.length; i++) {
    var cookie = cookies[i].trim();
    if (cookie.indexOf(name + "=") === 0) {
      return true;
    }
  }
  return false;
}

onMounted(() => {
  if (!checkCookie("locale")) {
    document.cookie = "locale=EN; path=/";
  }
});
</script>

<style scoped></style>
