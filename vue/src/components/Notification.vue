<template>
  <div
    v-if="notification.show"
    class="fixed w-[300px] left-4 bottom-4 px-4 py-4 text-white text-lg animate-fade-in-down flex justify-between items-center"
    :class="[notification.type === 'success' ? 'bg-emerald-500' : 'bg-red-500']"
  >
    {{ notification.message }}
    <svg
      xmlns="http://www.w3.org/2000/svg"
      fill="none"
      viewBox="0 0 24 24"
      stroke-width="1.5"
      stroke="currentColor"
      class="w-5 h-5 cursor-pointer"
      @click="closeNotification"
    >
      <path
        stroke-linecap="round"
        stroke-linejoin="round"
        d="M6 18L18 6M6 6l12 12"
      />
    </svg>
  </div>
</template>

<script setup>
import { computed } from "vue";
import { useStore } from "vuex";

const store = useStore();

const notification = computed(() => store.state.notification);

function closeNotification(){
  store.commit("closeNotification")
}

</script>

<style scoped></style>
