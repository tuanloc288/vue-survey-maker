<template>
  <div
    class="relative min-w-[700px] max-w-[700px] min-h-[250px] max-h-[250px] p-10 px-12 bg-white dark:bg-gray-900 text-black dark:text-white animate-appear rounded-md"
  >
    <span
      class="absolute top-4 right-5 text-black dark:text-white cursor-pointer"
      @click="closeDialog"
    >
      <svg
        xmlns="http://www.w3.org/2000/svg"
        fill="none"
        viewBox="0 0 24 24"
        stroke-width="1.5"
        stroke="currentColor"
        class="w-8 h-8"
      >
        <path
          stroke-linecap="round"
          stroke-linejoin="round"
          d="M6 18L18 6M6 6l12 12"
        />
      </svg>
    </span>
    <div class="text-2xl font-semibold">
      {{ data?.title }}
    </div>
    <div class="w-full flex justify-between items-center mt-16">
      <button
        @click="closeDialog"
        class="flex items-center space-x-2 bg-gray-800 dark:bg-white text-white dark:text-black border border-gray-300 dark:border-gray-700 py-2 px-5 rounded-lg hover:scale-110"
      >
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="1.5"
          stroke="currentColor"
          class="w-5 h-5"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M12 9.75L14.25 12m0 0l2.25 2.25M14.25 12l2.25-2.25M14.25 12L12 14.25m-2.58 4.92l-6.375-6.375a1.125 1.125 0 010-1.59L9.42 4.83c.211-.211.498-.33.796-.33H19.5a2.25 2.25 0 012.25 2.25v10.5a2.25 2.25 0 01-2.25 2.25h-9.284c-.298 0-.585-.119-.796-.33z"
          />
        </svg>

        <span> {{ $t("cancel") }} </span>
      </button>
      <button
        @click="confirmed"
        class="flex items-center space-x-2 bg-green-500 text-white py-2 px-5 rounded-lg hover:scale-110"
      >
        <span> {{ $t("confirm") }} </span>
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="1.5"
          stroke="currentColor"
          class="w-6 h-6"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
          />
        </svg>
      </button>
    </div>
  </div>
</template>

<script setup>
import { computed, onMounted, onUnmounted } from "vue";
import store from "../store";

const data = computed(() => store.state.confirmDialog.data);

onMounted(() => {
  window.addEventListener("keydown", keyListener);
});

onUnmounted(() => {
  window.addEventListener("keydown", keyListener);
});

function keyListener(e) {
  if (e.key === "Escape" || e.keyCode === 27 || e.which === 27) {
    closeDialog();
  }
}

function closeDialog() {
  store.commit("setConfirmDialogData", {
    open: false,
    data: {},
  });
}

function confirmed() {
  store.commit("setConfirmDialogData", {
    open: false,
    data: {
      ...data.value,
      response: true,
    },
  });
}
</script>
