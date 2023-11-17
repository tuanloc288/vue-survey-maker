<template>
  <div class="px-8 py-5 relative">
    <div
      v-if="loading"
      class="flex justify-center items-center pt-[20%] w-full"
    >
      <div class="loader" />
    </div>
    <form v-else class="container mx-auto" @submit.prevent="submitSurvey">
      <div class="grid grid-cols-6 items-center">
        <div class="mr-4">
          <img v-if="survey.image_url" :src="survey.image_url" alt="survey public view image" />
          <div v-else class="flex items-center justify-center border border-dashed border-black p-10"> This survey have no image </div>
        </div>
        <div class="col-span-5">
          <h1 class="text-3xl mb-3">
            {{ survey.title }}
          </h1>
          <p class="text-gray-500 text-sm" v-html="survey.description" />
        </div>
      </div>

      <div
        v-if="surveyFinished"
        class="animate-fade-in-down left-0 top-0 absolute h-screen w-screen flex items-center justify-center bg-black/30"
      >
        <div
          class="px-6 py-10 bg-indigo-500 text-white w-[600px] animate-from-top"
        >
          <div class="text-2xl mb-3 font-semibold">
            Thank you for participating in this survey!
          </div>
          <button
            type="button"
            @click="submitAnotherResponse"
            class="mt-2 inline-flex justify-center px-4 py-3 border border-transparent text-lg rounded-md shadow-sm font-medium text-white bg-emerald-500 hover:bg-emerald-600 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-emerald-500"
          >
            Submit another response
          </button>
        </div>
      </div>
      <div v-else>
        <hr class="my-3" />
        <div v-for="(question, index) of survey.questions" :key="question.id">
          <QuestionViewer
            v-model="answers[question.id]"
            :question="question"
            :index="index"
          />
        </div>
        <button
          v-if="survey.questions.length"
          :disabled="surveyAnswerLoading"
          type="submit"
          class="inline-flex justify-center px-4 py-2 border border-transparent text-sm rounded-md shadow-sm font-medium text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
        >
          Submit
        </button>
        <div v-else class="text-xl font-semibold"> This survey have no question... </div>
      </div>
    </form>
  </div>
</template>

<script setup>
import { computed, ref } from "vue";
import { useRoute } from "vue-router";
import { useStore } from "vuex";
import QuestionViewer from "../components/viewer/QuestionViewer.vue";

const route = useRoute();
const store = useStore();

const loading = computed(() => store.state.currentSurvey.loading);
const survey = computed(() => store.state.currentSurvey.data);

const surveyFinished = ref(false);

const answers = ref({});
const surveyAnswerLoading = ref(false);

store.dispatch("getSurveyBySlug", route.params.slug);

function submitSurvey() {
  // console.log(JSON.stringify(answers.value, undefined, 2));
  surveyAnswerLoading.value = true;
  store
    .dispatch("saveSurveyAnswer", {
      surveyId: survey.value.id,
      answers: answers.value,
    })
    .then((res) => {
      if (res.status === 201) {
        surveyAnswerLoading.value = false;
        surveyFinished.value = true;
      }
    })
    .catch((err) => {
      surveyAnswerLoading.value = false;
      throw err;
    });
}

function submitAnotherResponse() {
  answers.value = {};
  surveyFinished.value = false;
}
</script>

<style scoped></style>
