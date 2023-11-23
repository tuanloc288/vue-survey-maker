<template>
  <PageComponent showJump>
    <template v-slot:header>
      <div class="flex justify-between items-center">
        <h1 class="text-3xl font-bold text-gray-900 dark:text-gray-100"> {{ $t('surveys') }} </h1>
        <router-link
          v-if="!surveys.loading"
          :to="{ name: 'SurveyCreation' }"
          class="py-2 px-3 text-white bg-emerald-500 hover:bg-emerald-600 flex justify-between items-center"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke-width="1.5"
            stroke="currentColor"
            class="w-8 h-8 mr-1 md:h-4 md:w-4"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M12 4.5v15m7.5-7.5h-15"
            />
          </svg>

          <span class="hidden md:block">{{
            surveys.data.length ? $t('addSurvey') : $t('createOwn')
          }}</span>
        </router-link>
      </div>
    </template>
    <Loader v-if="surveys.loading" />
    <div v-else>
      <div class="grid grid-cols-1 gap-3 sm:grid-cols-2 md:grid-cols-3">
        <SurveyListItem
          v-for="(survey, index) in surveys.data"
          :key="survey.id"
          :survey="survey"
          class="opacity-0 animate-fade-in-down"
          :style="{ animationDelay: `${index * 0.1}s` }"
          @delete="deleteSurvey(survey)"
        />
      </div>
      <!-- Pagination -->
      <div class="flex justify-center mt-8" v-if="surveys.data.length">
        <nav
          class="relative z-0 inline-flex justify-center rounded-md shadow-sm"
          aria-label="Pagination"
        >
          <a
            v-for="(link, index) of surveys.links"
            :key="index"
            :disabled="!link.url"
            v-html="link.label"
            href="#"
            @click="getForPage($event, link)"
            aria-current="page"
            class="relative inline-flex items-center px-4 py-2 border text-sm font-medium whitespace-nowrap"
            :class="[
              link.active
                ? 'z-10 bg-indigo-50 dark:bg-indigo-950 border-indigo-500 text-indigo-600 dark:text-indigo-400'
                : 'bg-white dark:bg-gray-800 border-gray-300 dark:border-gray-700 text-gray-500 hover:bg-gray-50 dark:hover:bg-gray-800/80',
              index === 0 ? 'rounded-l-md' : '',
              index === surveys.links.length - 1 ? 'rounded-r-md' : '',
            ]"
          >
          </a>
        </nav>
      </div>
      <div v-else class="flex justify-center text-2xl text-semibold text-black dark:text-gray-200">
        {{ $t('noSurveys') }}
      </div>
    </div>
  </PageComponent>
</template>

<script setup>
import store from "../store";
import { computed } from "vue";
import PageComponent from "../components/PageComponent.vue";
import SurveyListItem from "../components/SurveyListItems.vue";
import Loader from "../components/Loader.vue";
import i18n from "../i18n";

const surveys = computed(() => store.state.surveys);

store.dispatch("getSurveys");

function deleteSurvey(survey) {
  if (
    confirm(
      i18n.global.locale == 'EN' 
        ? "Are you sure you want to delete this survey? This action can not be undone!"
        : "Bạn có chắc muốn xóa khảo sát này không? Hành động này sẽ không thể hoàn lại!"
    )
  ) {
    store.dispatch("deleteSurvey", survey.id).then(() => {
      store.dispatch("getSurveys");
    });
  }
}

function getForPage(e, link) {
  e.preventDefault();
  if (!link.url || link.active) {
    return;
  }

  store.dispatch("getSurveys", { url: link.url });
}
</script>

<style scoped></style>
