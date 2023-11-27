<template>
  <PageComponent
    v-bind:title="i18n.global.locale == 'EN' ? 'Dashboard' : 'Trang chủ'"
  >
    <Loader v-if="loading" />
    <div
      v-else
      class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-5 text-gray-700 dark:text-gray-300"
    >
      <div
        class="bg-white dark:bg-gray-800 animate-from-top shadow-md p-3 text-center flex flex-col order-1 lg:order-2"
      >
        <h3 class="text-2xl font-semibold">{{ $t("totalSurveys") }}</h3>
        <div
          class="text-8xl font-semibold flex flex-1 items-center justify-center"
        >
          {{ data.totalSurveys }}
        </div>
      </div>
      <div
        class="bg-white dark:bg-gray-800 animate-from-bottom shadow-md p-3 text-center flex flex-col order-2 lg:order-4"
      >
        <h3 class="text-2xl font-semibold">{{ $t("totalAnswers") }}</h3>
        <div
          class="text-8xl font-semibold flex flex-1 items-center justify-center"
        >
          {{ data.totalAnswers }}
        </div>
      </div>
      <div
        class="row-span-2 animate-from-left order-3 bg-white dark:bg-gray-800 shadow-md p-4 lg:order-1"
        :class="{ 'h-fit': !data.latestSurvey }"
      >
        <h3 class="text-2xl font-semibold">{{ $t("latestSurvey") }}</h3>
        <div v-if="data.latestSurvey">
          <img
            :src="
              data.latestSurvey.image_url
                ? data.latestSurvey.image_url
                : 'images/no-image.png'
            "
            class="w-[240px] mx-auto my-3 hover:scale-110 transition-transform"
            alt="dashboard survey image"
          />
          <h3 class="text-xl font-bold mb-3">{{ data.latestSurvey.title }}</h3>
          <div class="flex justify-between text-sm mb-1">
            <div>{{ $t("createdDate") }}</div>
            <div>{{ data.latestSurvey.created_at }}</div>
          </div>
          <div class="flex justify-between text-sm mb-1">
            <div>{{ $t("expiredDate") }}</div>
            <div>
              {{
                data.latestSurvey.expire_date
                  ? data.latestSurvey.expire_date
                  : $t("notSpecified")
              }}
            </div>
          </div>
          <div class="flex justify-between text-sm mb-1">
            <div>Status</div>
            <div>
              {{
                data.latestSurvey.status
                  ? $t("statusActive")
                  : $t("statusDraft")
              }}
            </div>
          </div>
          <div class="flex justify-between text-sm mb-1">
            <div>{{ $t("questions") }}</div>
            <div>{{ data.latestSurvey.questions }}</div>
          </div>
          <div class="flex justify-between text-sm">
            <div>{{ $t("answers") }}</div>
            <div>{{ data.latestSurvey.answers }}</div>
          </div>
          <div class="flex justify-between mt-2">
            <router-link
              :to="{ name: 'SurveyView', params: { id: data.latestSurvey.id } }"
              class="flex px-4 py-2 border border-transparent text-sm rounded-md text-indigo-500 hover:bg-indigo-700 hover:text-white transition-colors focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="w-5 h-5 mr-2"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L10.582 16.07a4.5 4.5 0 01-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 011.13-1.897l8.932-8.931zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0115.75 21H5.25A2.25 2.25 0 013 18.75V8.25A2.25 2.25 0 015.25 6H10"
                />
              </svg>

              {{ $t("editSurvey") }}
            </router-link>
            <a
              :href="`/view/survey/${data.latestSurvey?.slug}`"
              target="_blank"
              class="flex px-4 py-2 border border-transparent text-sm rounded-md text-indigo-500 hover:bg-indigo-700 hover:text-white transition-colors focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="w-5 h-5 mr-2"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z"
                />
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
                />
              </svg>

              {{ $t("publicLink") }}
            </a>
          </div>
        </div>
        <div v-else class="text-gray-600 dark:text-gray-400 text-center py-16">
          {{ $t("noSurveys") }}
        </div>
      </div>
      <div
        class="bg-white dark:bg-gray-800 animate-from-right shadow-md p-3 row-span-2 order-4 lg:order-3 h-fit"
      >
        <div class="flex justify-between items-center mb-2 px-2">
          <h3 class="text-2xl font-semibold">{{ $t("latestAnswers") }}</h3>
          <span
            v-if="data.allAnswers.length"
            @click="openModel(data.allAnswers, false)"
            class="text-sm text-blue-500 hover:decoration-blue-500 cursor-pointer"
          >
            {{ $t("viewAll") }}
          </span>
        </div>
        <div v-if="data.allAnswers.length">
          <span
            v-for="answer of data?.allAnswers.slice(0, 6)"
            :key="answer.id"
            class="block p-2 hover:bg-gray-100/90 dark:hover:bg-gray-900/30"
          >
            <div
              @click="openModel(answer, true)"
              class="cursor-pointer"
              :title="$t('seeIndividual')"
            >
              <div class="font-semibold">{{ answer.survey.title }}</div>
              <small>
                {{ $t("answerMadeAt") }}:
                <i class="font-semibold"> {{ answer.end_date }} </i>
              </small>
            </div>
          </span>
        </div>
        <div v-else class="text-gray-600 dark:text-gray-400 text-center py-16">
          {{ $t("noAnswers") }}
        </div>
      </div>
    </div>
  </PageComponent>
</template>

<script setup>
import PageComponent from "../components/PageComponent.vue";
import { computed } from "vue";
import store from "../store/index";
import Loader from "../components/Loader.vue";
import i18n from "../i18n";

const loading = computed(() => store.state.dashboard.loading);
const data = computed(() => store.state.dashboard.data);

store.dispatch("getDashboardData");

function openModel(answer, individual) {
  store.commit("setModelData", { open: true, data: answer, individual });
}
</script>

<style scoped></style>
