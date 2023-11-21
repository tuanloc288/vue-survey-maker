<template>
  <div class="h-screen flex flex-col items-center justify-center space-y-3">
    <img
      :src="[
        isDark
          ? '/images/not-found-white.png'
          : '/images/not-found.png',
      ]"
      class="w-[500px] aspect-video"
    />
    <span class="text-gray-700 dark:text-gray-300 text-xl font-semibold">
      This survey URL probably not active anymore or it expired date has been
      passed!
    </span>
  </div>
</template>

<script setup>
import { useDark } from "@vueuse/core";

const isDark = useDark();
</script>

<style scoped></style>
