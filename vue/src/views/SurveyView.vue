<template>
  <PageComponent showJump>
    <template v-slot:header>
      <div class="flex items-center justify-between">
        <h1
          class="text-2xl sm:text-3xl font-bold text-gray-900 dark:text-gray-100"
        >
          {{
            route.params.id ? $t("edit") + " " + model.title : $t("createTitle")
          }}
        </h1>
        <div class="flex flex-col items-center gap-3 md:flex-row md:text-sm">
          <a
            v-if="model.slug"
            :href="`/view/survey/${model.slug}`"
            target="_blank"
            class="flex items-center p-3 cursor-pointer rounded-md text-indigo-500 hover:bg-indigo-700 hover:text-white transition-colors"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke-width="1.5"
              stroke="currentColor"
              class="w-5 h-5 mr-1"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M13.19 8.688a4.5 4.5 0 011.242 7.244l-4.5 4.5a4.5 4.5 0 01-6.364-6.364l1.757-1.757m13.35-.622l1.757-1.757a4.5 4.5 0 00-6.364-6.364l-4.5 4.5a4.5 4.5 0 001.242 7.244"
              />
            </svg>
            <span class="hidden sm:block"> {{ $t("viewPublicLink") }} </span>
          </a>
          <button
            v-if="route.params.id && !surveyLoading"
            type="button"
            @click="deleteSurvey()"
            class="px-3 py-2 text-white rounded-md bg-red-500 hover:bg-red-600 flex items-center justify-between"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke-width="1.5"
              stroke="currentColor"
              class="w-5 h-5 mr-1"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"
              />
            </svg>

            <span class="hidden sm:block"> {{ $t("deleteSurvey") }} </span>
          </button>
        </div>
      </div>
    </template>
    <Loader v-if="surveyLoading" />
    <form v-else @submit.prevent="saveSurvey" class="animate-fade-in-down">
      <div class="shadow sm:rounded-md sm:overflow-hidden">
        <!-- Survey all fields -->
        <div class="px-4 py-5 bg-white dark:bg-gray-800 space-y-6 sm:p-6">
          <!-- Image -->
          <div>
            <label
              class="block text-sm font-medium text-gray-700 dark:text-gray-300"
            >
              {{ $t("surveyImage") }}
            </label>
            <div class="mt-1 flex flex-col space-y-5 md:flex-row items-center">
              <img
                v-if="model.image_url"
                :src="model.image_url"
                :alt="model.title"
                class="w-80 md:w-64 aspect-square object-cover"
              />
              <span
                v-else
                class="flex items-center justify-center h-12 w-12 rounded-full overflow-hidden bg-gray-100 dark:bg-gray-900"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  class="w-[80%] h-[80%] text-gray-300"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M2.25 15.75l5.159-5.159a2.25 2.25 0 013.182 0l5.159 5.159m-1.5-1.5l1.409-1.409a2.25 2.25 0 013.182 0l2.909 2.909m-18 3.75h16.5a1.5 1.5 0 001.5-1.5V6a1.5 1.5 0 00-1.5-1.5H3.75A1.5 1.5 0 002.25 6v12a1.5 1.5 0 001.5 1.5zm10.5-11.25h.008v.008h-.008V8.25zm.375 0a.375.375 0 11-.75 0 .375.375 0 01.75 0z"
                  />
                </svg>
              </span>
              <button
                type="button"
                class="relative z-10 overflow-hidden ml-5 bg-white dark:bg-black px-3 py-2 border border-gray-300 dark:border-gray-700 rounded-md shadow-sm text-sm leading-4 font-medium text-gray-700 dark:text-gray-300 transition-colors duration-300 ease-in-out hover:bg-indigo-500 dark:hover:bg-indigo-500 cursor-pointer"
              >
                <input
                  type="file"
                  @change="onImageChoose"
                  class="absolute inset-0 opacity-0 cursor-pointer"
                />
                {{ $t("changeImage") }}
              </button>
            </div>
          </div>

          <!-- Title -->
          <div>
            <label
              for="title"
              class="block text-sm font-medium text-gray-700 dark:text-gray-300"
            >
              {{ $t("surveyTitle") }}
            </label>
            <input
              type="text"
              name="title"
              id="title"
              v-model="model.title"
              autocomplete="survey_title"
              class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border border-gray-300 dark:border-gray-700 dark:bg-transparent dark:text-gray-300 rounded-md"
            />
            <span v-if="error.title" class="text-sm text-red-500">
              {{ error.title }}
            </span>
          </div>

          <!-- Description -->
          <div>
            <label
              for="title"
              class="block text-sm font-medium text-gray-700 dark:text-gray-300"
            >
              {{ $t("surveyDescription") }}
            </label>
            <textarea
              name="description"
              id="description"
              v-model="model.description"
              autocomplete="survey_description"
              class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border border-gray-300 dark:border-gray-700 dark:bg-transparent dark:text-gray-300 rounded-md"
              placeholder="Describe your survey here..."
            />
          </div>

          <!-- Expire date -->
          <div>
            <label
              for="expire_date"
              class="block text-sm font-medium text-gray-700 dark:text-gray-300"
            >
              {{ $t("expiredDate") }}
            </label>
            <input
              type="date"
              name="expire_date"
              id="expire_date"
              v-model="model.expire_date"
              class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border border-gray-300 dark:border-gray-700 dark:bg-transparent dark:text-gray-300 rounded-md"
            />
            <i v-if="error.date" class="text-sm text-red-500">
              {{ error.date }}
            </i>
          </div>

          <!-- Status -->
          <div class="flex items-start">
            <div class="flex items-center h-5">
              <input
                type="checkbox"
                id="status"
                name="status"
                v-model="model.status"
                class="focus:ring-indigo-500 w-6 h-6 text-indigo-600 dark:text-indigo-400 border-gray-300 dark:border-gray-700 dark:bg-transparent rounded-md"
              />
            </div>
            <div class="ml-2 text-sm">
              <label
                for="status"
                class="font-medium text-gray-700 dark:text-gray-300"
              >
                {{ $t("statusActive") }}
              </label>
            </div>
          </div>

          <!-- End survey fields-->
        </div>

        <div class="px-4 py-5 bg-white dark:bg-gray-800 space-y-6 sm:p-6">
          <h3
            class="text-2xl font-semibold flex items-center justify-between dark:text-white"
          >
            {{ $t("questions") }}
            <button
              type="button"
              @click="addQuestion()"
              class="flex items-center text-sm px-4 py-1 rounded-sm text-white bg-indigo-600 hover:bg-indigo-700"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="w-4 h-4 mr-1"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M12 6v12m6-6H6"
                />
              </svg>

              {{ $t("addQuestion") }}
            </button>
          </h3>
          <div
            v-if="!model.questions.length"
            class="text-center text-gray-600 dark:text-gray-400"
          >
            {{ $t("noQuestions") }}
          </div>
          <div
            v-bind:title="checkEnglish() ? 'Draggable' : 'Có thể kéo thả'"
            v-for="(question, index) in model.questions"
            :key="question.id"
            draggable="true"
            @dragstart="onQuestionDrag($event, question.index)"
            @drop="onQuestionDrop($event, question)"
            @dragenter.prevent
            @dragover.prevent
            class="cursor-move"
          >
            <QuestionEditor
              :question="question"
              :index="index"
              @change="questionChange"
              @addQuestion="addQuestion"
              @deleteQuestion="deleteQuestion"
            />
          </div>
        </div>

        <div
          class="flex justify-between p-3 bg-gray-50 dark:bg-gray-800 text-right sm:px-6"
        >
          <span class="flex-1 text-sm text-red-500 text-left animate-bounce">
            {{ error.filled ? error.filled : "" }}
          </span>
          <button
            type="submit"
            class="inline-flex justify-center px-4 py-2 border border-transparent shadow-sm text-sm font-medium rounded-md text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
          >
            {{ $t("saveSurvey") }}
          </button>
        </div>
      </div>
    </form>
  </PageComponent>
</template>

<script setup>
import store from "../store";
import { useRoute, useRouter } from "vue-router";
import { computed, ref, watch } from "vue";
import PageComponent from "../components/PageComponent.vue";
import QuestionEditor from "../components/editor/QuestionEditor.vue";
import { v4 as uuidv4 } from "uuid";
import Loader from "../components/Loader.vue";
import i18n from "../i18n";

const route = useRoute();
const router = useRouter();

const surveyLoading = computed(() => store.state.currentSurvey.loading);

let model = ref({
  title: "",
  slug: "",
  status: false,
  description: null,
  image_url: null,
  expire_date: null,
  questions: [],
});

let error = ref({
  title: "",
  date: "",
  filled: "",
});

// watch the current survey data, if it change we update the local model, work like react hook form
watch(
  () => store.state.currentSurvey.data,
  (newVal, oldVal) => {
    model.value = {
      ...parseJson(newVal),
      questions: newVal.questions.sort((a, b) => a.index - b.index),
      // expire_date: newVal.expire_date ? formatDate(newVal.expire_date) : null,
    };
  }
);

if (route.params.id) {
  store.dispatch("getSurvey", route.params.id);
}

function parseJson(question) {
  return JSON.parse(JSON.stringify(question));
}

function formatDate(dateString) {
  let date = new Date(dateString);

  const year = date.getFullYear();
  const month = String(date.getMonth() + 1).padStart(2, "0");
  const day = String(date.getDate()).padStart(2, "0");

  return `${year}-${month}-${day}`;
}

function addQuestion(index) {
  const newQuestion = {
    id: uuidv4(),
    type: "text",
    question: "",
    description: null,
    data: {},
    index: index ? index : 0,
  };
  model.value.questions = model.value.questions.map((q) => {
    if (!index) {
      return parseJson({ ...q, index: 0 });
    } else if (index && q.index >= index) {
      return parseJson({ ...q, index: q.index + 1 });
    } else return parseJson(q);
  });
  model.value.questions.splice(index, 0, newQuestion);
}

function deleteQuestion(question) {
  model.value.questions = model.value.questions.map((q) => {
    if (q.id !== question.id) {
      if (q.index > question.index)
        return parseJson({ ...q, index: q.index - 1 });
      else return parseJson(q);
    } else return parseJson(question);
  });
  model.value.questions = model.value.questions.filter(
    (q) => q.id !== question.id
  );
}

function questionChange(question) {
  model.value.questions = model.value.questions.map((q) => {
    if (q.id === question.id) {
      return question;
    }

    return q;
  });
}

function saveSurvey() {
  let tmr = new Date();
  tmr.setDate(tmr.getDate() + 1);
  let expire = new Date(model.value.expire_date);
  if (model.value.expire_date && expire < tmr) {
    error.value.date = checkEnglish() ? "The expire date must be a date after tomorrow!" : "Ngày hết hạn phải là một ngày sau ngày mai!";
  } else {
    if (!checkErrors()) {
      addIndexForQuestion();
      // console.log(model.value.questions[model.value.questions.length -1].data.options);
      store.dispatch("saveSurvey", model.value).then(({ data }) => {
        store.commit("notify", {
          type: "success",
          message: checkEnglish() ? "Save survey successfully!" : "Lưu khảo sát thành công",
        });
        router.push({
          name: "SurveyView",
          params: { id: data.data.id },
        });
      });
    }
  }
}

function checkErrors() {
  let flag = false;
  error.value = {
    ...error.value,
    date: "",
  };
  if (model.value.title) {
    error.value = {
      ...error.value,
      title: "",
    };
  } else {
    error.value = {
      ...error.value,
      title: checkEnglish() ? "The title field is required!" : "Mục tiêu đề không được để trống!",
    };
  }
  if (
    !flag &&
    (error.value.date || error.value.title || checkEmptyQuestion())
  ) {
    flag = true;
  }

  return flag;
}

function addIndexForQuestion() {
  model.value.questions = model.value.questions.map((q, ind) => {
    return parseJson({ ...q, index: ind });
  });
}

function checkEmptyQuestion() {
  let flag = false;
  model.value.questions.forEach((q) => {
    if (!q.question && !flag) {
      flag = true;
      error.value = {
        ...error.value,
        filled: checkEnglish() ? "You need to fill the question title before save survey!" : "Điền đầy đủ tiêu đề của các câu hỏi trước khi lưu!",
      };
    }
  });
  if (!flag) {
    error.value = {
      ...error.value,
      filled: "",
    };
  }

  return flag;
}

function onImageChoose(e) {
  const file = e.target.files[0];

  const reader = new FileReader();
  reader.onload = () => {
    // .image will be send to backend and apply validation
    model.value.image = reader.result;
    // .image_url for display here at f/e
    model.value.image_url = reader.result;
  };

  reader.readAsDataURL(file);
}

function deleteSurvey() {
  if (
    confirm(
      checkEnglish()
        ? "Are you sure you want to delete this survey? This action cannot be undone"
        : "Bạn có chắc muốn xóa khảo sát này không? Hành động này không thể hoàn tác!"
    )
  ) {
    store.dispatch("deleteSurvey", model.value.id).then(() => {
      router.push({
        name: "Surveys",
      });
    });
  }
}

function onQuestionDrag(e, index) {
  e.dataTransfer.dropEffect = "move";
  e.dataTransfer.effectAllowed = "move";
  e.dataTransfer.setData("itemIndex", index);
}

function onQuestionDrop(e, question) {
  let draggedIndex = parseInt(e.dataTransfer.getData("itemIndex"));
  let tmpList = model.value.questions.map((q) => {
    if (q.index === question.index) {
      return { ...q, index: draggedIndex };
    } else if (q.index === draggedIndex) {
      return { ...q, index: question.index };
    }
    return q;
  });

  setQuestions(tmpList);
}

function setQuestions(questions) {
  model.value.questions = questions.sort((a, b) => a.index - b.index);
}

function checkEnglish() {
  return i18n.global.locale == "EN";
}
</script>

<style scoped></style>
