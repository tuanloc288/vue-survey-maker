<template>
  <div
    class="w-full h-full sm:w-screen sm:h-screen min-h-fit sm:min-h-fit md:w-[70%] md:h-[90%] relative px-5 py-10 bg-white dark:bg-gray-900 animate-appear"
  >
    <span
      @click="closeModel"
      class="text-black dark:text-white cursor-pointer absolute right-5 top-5"
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
    <div class="text-black dark:text-white">
      <div class="flex justify-around">
        <img
          :src="
            data.survey.image_url
              ? data.survey.image_url
              : '/images/no-image.png'
          "
          alt="survey image on model"
          class="hidden object-contain lg:block lg:w-48"
        />
        <div class="flex flex-col space-y-3 w-fit max-w-[70%] lg:max-w-[50%]">
          <span class="text-2xl font-bold text-black dark:text-white">{{
            data.survey.title
          }}</span>
          <span
            class="text-gray-700 dark:text-gray-300 max-h-[200px] overflow-y-auto px-2"
            v-html="data.survey.description"
          />
        </div>
        <div class="flex flex-col mt-8 justify-around border-l-2 border-gray-300/20 dark:border-gray-700/20 px-4">
          <div class="flex flex-col space-y-1">
            <span class="font-bold">{{ $t("answerMadeAt") }}</span>
            <span class="text-gray-700 dark:text-gray-300">
              {{ data.end_date }}
            </span>
          </div>
          <div class="flex flex-col space-y-1">
            <span class="font-bold">{{ $t("totalQuestions")}}</span>
            <span class="text-gray-700 dark:text-gray-300">
              {{ data.survey.questions.length }}
            </span>
          </div>
          <div class="flex flex-col space-y-1">
            <span class="font-bold">{{ $t("hadAnswered") }}</span>
            <span class="text-gray-700 dark:text-gray-300">
              {{ data.answers.length }}/{{ data.survey.questions.length }} {{ $t('questions') }}
            </span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed } from "vue";
import store from "../store";

const data = computed(() => store.state.model.data);

if (data) {
  console.log(data);
}

function closeModel() {
  store.commit("setModelData", false, {});
}
</script>
