<template>
  <div class="h-screen flex flex-col items-center justify-center space-y-3">
    <img
      :src="[
        isDark
          ? '/images/not-found-white.png'
          : '/images/not-found.png',
      ]"
      class="w-[300px] sm:w-[400px] md:w-[500px] aspect-video"
    />
    <span class="text-gray-700 dark:text-gray-300 text-center px-2 md:text-xl font-semibold">
      {{ $t('notFound') }}
    </span>
  </div>
</template>

<script setup>
import { useDark } from "@vueuse/core";

const isDark = useDark();
</script>

<style scoped></style>
