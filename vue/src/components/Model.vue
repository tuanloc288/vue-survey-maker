<template>
  <div
    class="w-full h-full sm:w-screen sm:h-screen min-h-fit sm:min-h-fit md:w-[70%] md:h-[90%] relative overflow-y-auto overflow-x-hidden px-5 py-10 bg-white dark:bg-gray-900 animate-appear"
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
          class="hidden object-contain lg:block lg:w-48 animate-from-left"
          style="animation-delay: 0.5s"
        />
        <div
          class="flex flex-col space-y-3 w-fit max-w-[70%] lg:max-w-[50%] mt-3"
        >
          <span
            class="text-2xl font-bold animate-from-top"
            style="animation-delay: 0.5s"
          >
            {{ data.survey.title }}
          </span>
          <span
            class="text-gray-700 dark:text-gray-300 max-h-[200px] overflow-y-auto px-2 animate-from-bottom"
            style="animation-delay: .5s;"
            v-html="data.survey.description"
          />
        </div>
        <div
          class="flex flex-col mt-8 justify-around space-y-1 animate-from-right border-l-2 border-gray-300/20 dark:border-gray-700/20 px-4"
          style="animation-delay: .5s;"
        >
          <div class="flex flex-col space-y-1">
            <span class="font-bold">{{ $t("answerMadeAt") }}</span>
            <span class="text-gray-700 dark:text-gray-300">
              {{ data.end_date }}
            </span>
          </div>
          <div class="flex flex-col space-y-1">
            <span class="font-bold">{{ $t("totalQuestions") }}</span>
            <span class="text-gray-700 dark:text-gray-300">
              {{ data.survey.questions.length }}
            </span>
          </div>
          <div class="flex flex-col space-y-1">
            <span class="font-bold">{{ $t("hadAnswered") }}</span>
            <span class="text-gray-700 dark:text-gray-300">
              {{ data.answers.length }}/{{ data.survey.questions.length }}
              {{ $t("questions") }}
            </span>
          </div>
        </div>
      </div>
    </div>
    <div
      class="flex flex-col"
      v-for="question of questionAnswers"
      :key="question.id"
    >
      <QuestionAnswerViewer :question="question" />
    </div>
  </div>
</template>

<script setup>
import { computed } from "vue";
import store from "../store";
import { ref } from "vue";
import { onMounted } from "vue";
import QuestionAnswerViewer from "./viewer/QuestionAnswerViewer.vue";

const data = computed(() => store.state.model.data);
const questionAnswers = ref([]);

onMounted(() => {
  prepareQuestionAnswers();
});

function prepareQuestionAnswers() {
  questionAnswers.value = data.value.survey.questions;
  data.value.answers.forEach((answer) => {
    let question = questionAnswers.value.filter(
      (q) => q.id === answer.question_id
    );
    checkedOptions(question[0], answer);
  });
}

function checkedOptions(question, answer) {
  if (question.type !== "text" && question.type !== "textarea") {
    if (question.id === answer.question_id) {
      if (question.type !== "checkbox") {
        let tmpOpts = questionAnswers.value[question.index].data.options.map(
          (opt) => {
            if (opt.text === answer.answer) {
              return { ...opt, checked: true };
            }
            return { ...opt, checked: false };
          }
        );
        questionAnswers.value[question.index].data.options = tmpOpts;
      } else {
        let answerArray = JSON.parse(answer.answer);
        if (Array.isArray(answerArray)) {
          answerArray.forEach((a) => {
            let tmpOpts = questionAnswers.value[
              question.index
            ].data.options.map((opt) => {
              if (opt.text === a) return { ...opt, checked: true };
              else if (opt.checked) return { ...opt };
              else return { ...opt, checked: false };
            });
            questionAnswers.value[question.index].data.options = tmpOpts;
          });
        }
      }
    } else {
      if (question.data.options) {
        let tmpOpts = questionAnswers.value[question.index].data.options.map(
          (opt) => {
            return { ...opt, checked: false };
          }
        );
        questionAnswers.value[index].data.options = tmpOpts;
      }
    }
  } else {
    questionAnswers.value[question.index] = {
      ...questionAnswers.value[question.index],
      answer: answer.answer,
    };
  }
}

function closeModel() {
  store.commit("setModelData", false, {});
}
</script>
