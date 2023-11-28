<template>
  <div
    class="w-full h-full sm:w-screen sm:h-screen min-h-fit sm:min-h-fit md:w-[70%] relative overflow-y-auto overflow-x-hidden px-5 py-10 bg-white dark:bg-gray-900 animate-appear rounded-md"
    :class="[
      individual ? 'md:h-[90%]' : data.length <= 6 ? 'md:h-fit' : 'md:h-[90%]',
    ]"
  >
    <div
      class="absolute top-4 right-5 left-5 mx-3bg-white flex justify-between items-center"
      :class="[oldValue.length ? '' : 'flex-row-reverse']"
    >
      <span
        v-if="oldValue.length"
        class="text-black dark:text-white cursor-pointer"
        @click="goBack()"
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
            d="M9 15L3 9m0 0l6-6M3 9h12a6 6 0 010 12h-3"
          />
        </svg>
      </span>
      <span
        @click="closeModel"
        class="text-black dark:text-white cursor-pointer"
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
    </div>
    <div v-if="!individual" class="flex flex-col h-full space-y-3">
      <div
        class="text-black dark:text-white md:ml-10 lg:ml-16 flex flex-wrap sm:flex-row justify-center sm:justify-between items-center w-[85%] space-y-3"
      >
        <div class="flex flex-col sm:flex-row space-x-3 items-center">
          <label for="search"> {{ $t("searchByTitle") }} </label>
          <input
            class="text-black dark:text-gray-300 focus:ring-indigo-500 focus:border-indigo-500 flex-1 shadow-sm sm:text-sm border-gray-300 dark:border-gray-700 rounded-md dark:bg-gray-900"
            type="text"
            name="search"
            placeholder="Vuejs..."
            v-model="filteredOpts.title"
            @change="filtered"
            autocomplete="off"
          />
        </div>
        <div class="flex flex-col space-y-2">
          <span
            class="flex flex-col sm:flex-row items-center justify-between space-x-2"
          >
            <label for="dateFrom"> {{ $t("dateFrom") }}: </label>
            <input
              type="date"
              name="dateFrom"
              class="text-black dark:text-gray-300 focus:ring-indigo-500 focus:border-indigo-500 shadow-sm sm:text-sm border-gray-300 dark:border-gray-700 rounded-md dark:bg-gray-900"
              v-model="filteredOpts.date.from"
              @change="filtered"
            />
          </span>
          <span
            class="flex flex-col sm:flex-row items-center justify-between space-x-2"
          >
            <label for="dateTo"> {{ $t("dateTo") }}: </label>
            <input
              type="date"
              name="dateTo"
              class="text-black dark:text-gray-300 focus:ring-indigo-500 focus:border-indigo-500 shadow-sm sm:text-sm border-gray-300 dark:border-gray-700 rounded-md dark:bg-gray-900"
              v-model="filteredOpts.date.to"
              @change="filtered"
            />
          </span>
        </div>
        <div
          class="text-black dark:text-white flex flex-col sm:flex-row items-center sm:space-x-2 text-center"
        >
          <label for="finished"> {{ $t("finished") }}: </label>
          <input
            type="checkbox"
            name="finished"
            v-model="filteredOpts.finished"
            @change="filtered"
          />
        </div>
      </div>
      <div
        v-if="filtered().length"
        v-for="(answer, index) in filtered()"
        :key="answer.id"
        class="text-black dark:text-white cursor-pointer hover:bg-gray-100/90 dark:hover:bg-gray-800/30 sm:px-16 py-2 flex items-center justify-between border-b border-gray-200 dark:border-gray-800"
        @click="openModel(answer, true)"
        :title="$t('seeIndividual')"
      >
        <div
          class="flex flex-col space-y-3 animate-from-left"
          :style="{ animationDelay: `${index * 0.2}s` }"
        >
          <div class="font-bold text-xl sm:text-2xl">
            {{ answer.survey.title }}
          </div>
          <small>
            <span class="font-semibold text-sm sm:text-lg">
              {{ $t("answerMadeAt") }}:
              <i> {{ answer.end_date }} </i>
            </span>
          </small>
        </div>
        <div
          class="flex flex-col justify-around space-y-1 animate-from-right border-l-2 border-gray-300/20 dark:border-gray-700/20 px-4"
          :style="{ animationDelay: `${index * 0.2}s` }"
        >
          <div class="flex flex-col space-y-1">
            <span class="font-bold text-sm sm:text-lg">{{
              $t("totalQuestions")
            }}</span>
            <span class="text-gray-700 dark:text-gray-300">
              {{ answer.survey.questions.length }}
            </span>
          </div>
          <div class="flex flex-col space-y-1">
            <span class="font-bold text-sm sm:text-lg">{{
              $t("hadAnswered")
            }}</span>
            <span class="text-gray-700 dark:text-gray-300">
              {{ answer.answers.length }}/{{ answer.survey.questions.length }}
              {{ $t("questions") }}
            </span>
          </div>
        </div>
      </div>
      <div
        v-else
        class="text-black dark:text-white w-full text-center pt-5 text-lg font-bold"
      >
        {{ $t("noMatch") }}
      </div>
    </div>
    <div v-else>
      <div class="text-black dark:text-white mt-2">
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
              style="animation-delay: 0.5s"
              v-html="data.survey.description"
            />
          </div>
          <div
            class="flex flex-col mt-8 justify-around space-y-1 animate-from-right border-l-2 border-gray-300/20 dark:border-gray-700/20 px-4"
            style="animation-delay: 0.5s"
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
  </div>
</template>

<script setup>
import { computed } from "vue";
import store from "../store";
import { ref } from "vue";
import { onMounted } from "vue";
import QuestionAnswerViewer from "./viewer/QuestionAnswerViewer.vue";
import { watch } from "vue";
import { onUnmounted } from "vue";

const data = computed(() => store.state.model.data);
const individual = computed(() => store.state.model.individual);

watch(data, (newVal, oldVal) => {
  if (oldVal.length && individual) {
    oldValue.value = oldVal;
    prepareQuestionAnswers();
  }
});

const questionAnswers = ref([]);
const oldValue = ref({});
const filteredOpts = ref({
  title: "",
  date: {
    from: "",
    to: "",
  },
  finished: false,
});

onMounted(() => {
  if (individual.value) {
    prepareQuestionAnswers();
  }
  window.addEventListener("keydown", keyListener);
});

onUnmounted(() => {
  window.removeEventListener("keydown", keyListener);
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
  store.commit("setModelData", false, {}, false);
}

function keyListener(e) {
  if (e.key === "Escape" || e.keyCode === 27 || e.which === 27) {
    closeModel();
  } else if (
    oldValue.value.length &&
    (e.key === "Backspace" || e.keyCode === 8 || e.which === 8)
  ) {
    goBack();
  }
}

function openModel(answer, individual) {
  store.commit("setModelData", { open: true, data: answer, individual });
}

function goBack() {
  store.commit("setModelData", {
    open: true,
    data: oldValue.value,
    individual: false,
  });
  oldValue.value = {};
}

function filtered() {
  let filteredData = data.value;

  if (filteredOpts.value.finished) {
    filteredData = filteredData.filter(
      (answer) => answer.answers.length === answer.survey.questions.length
    );
  }

  if (filteredOpts.value.title) {
    filteredData = filteredData.filter((answer) =>
      answer.survey.title
        .toLowerCase()
        .includes(filteredOpts.value.title.toLowerCase())
    );
  }

  if (filteredOpts.value.date.from && !filteredOpts.value.date.to) {
    let date = new Date(filteredOpts.value.date.from);
    date.setHours(0);
    filteredData = filteredData.filter(
      (answer) => new Date(answer.end_date) >= date
    );
  } else if (!filteredOpts.value.date.from && filteredOpts.value.date.to) {
    let date = new Date(filteredOpts.value.date.to);
    date.setHours(23);
    filteredData = filteredData.filter(
      (answer) => new Date(answer.end_date) <= date
    );
  } else if (filteredOpts.value.date.from && filteredOpts.value.date.to) {
    let dateFrom = new Date(filteredOpts.value.date.from);
    let dateTo = new Date(filteredOpts.value.date.to);
    dateFrom.setHours(0);
    dateTo.setHours(23);
    filteredData = filteredData.filter((answer) => {
      return (
        new Date(answer.end_date) >= dateFrom &&
        new Date(answer.end_date) <= dateTo
      );
    });
  }

  return filteredData;
}
</script>
