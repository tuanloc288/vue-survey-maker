<template>
  <header class="bg-white dark:bg-gray-800 shadow">
    <div class="mx-auto max-w-7xl px-4 py-6 sm:px-6 lg:px-8">
      <h1
        v-if="title"
        class="text-3xl font-bold tracking-tight text-gray-900 dark:text-gray-100"
      >
        {{ title }}
      </h1>
      <slot name="header"></slot>
    </div>
  </header>
  <main>
    <!-- Jump to bottom -->
    <div
      @click="jumpToY(1)"
      v-if="showJump && topAxis"
      class="z-50 fixed right-0 top-36 md:top-32 bg-indigo-500 border border-black border-dashed px-2 pt-4 pb-2 rounded-full mt-10 mr-8 cursor-pointer animate-pulse"
    >
      <button>
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="1.5"
          stroke="currentColor"
          class="w-5 h-5 animate-bounce"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M15.75 17.25L12 21m0 0l-3.75-3.75M12 21V3"
          />
        </svg>
      </button>
    </div>
    <!-- Jump to top -->
    <div
      @click="jumpToY(2)"
      v-if="showJump && botAxis"
      class="z-50 fixed right-0 bottom-0 bg-indigo-500 border border-black border-dashed px-2 pt-4 pb-2 rounded-full mb-5 mr-8 cursor-pointer animate-pulse"
    >
      <button>
        <svg
          xmlns="http://www.w3.org/2000/svg"
          fill="none"
          viewBox="0 0 24 24"
          stroke-width="1.5"
          stroke="currentColor"
          class="w-5 h-5 animate-bounce"
        >
          <path
            stroke-linecap="round"
            stroke-linejoin="round"
            d="M8.25 6.75L12 3m0 0l3.75 3.75M12 3v18"
          />
        </svg>
      </button>
    </div>
    <div class="mx-auto max-w-7xl py-6 sm:px-6 lg:px-8">
      <div class="px-4 py-6 sm:px-0">
        <!-- Work like children in next/react -->
        <slot></slot>
      </div>
    </div>
  </main>
</template>

<script setup>
const props = defineProps({
  title: String,
  showJump: Boolean,
});

function jumpToY(pos) {
  switch (pos) {
    case 1: {
      let currentY = document.documentElement.scrollTop;
      let int = setInterval(() => {
        if (document.documentElement.offsetHeight < currentY)
          clearInterval(int);
        else {
          currentY = currentY + 30;
          document.documentElement.scrollTop = currentY;
        }
      }, 6);
      break;
    }
    case 2: {
      let currentY = document.documentElement.scrollTop;
      let int = setInterval(() => {
        if (0 > currentY) clearInterval(int);
        else {
          currentY = currentY - 30;
          document.documentElement.scrollTop = currentY;
        }
      }, 6);
      break;
    }
    default:
      break;
  }
}
</script>

<script>
export default {
  data() {
    return {
      topAxis: false,
      botAxis: false,
    };
  },
  mounted() {
    window.addEventListener("scroll", this.handleScroll);
  },
  unmounted() {
    window.removeEventListener("scroll", this.handleScroll);
  },
  methods: {
    handleScroll() {
      if (window.scrollY > 0) {
        this.topAxis = false;
        this.botAxis = true;
      } else if (window.scrollY === 0) {
        this.botAxis = false;
        if (
          document.documentElement.clientHeight <
          document.documentElement.scrollHeight
        )
          this.topAxis = true;
      }
    },
  },
};
</script>

<style scoped></style>
