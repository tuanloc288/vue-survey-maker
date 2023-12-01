<template>
  <PageComponent
    v-bind:title="i18n.global.locale == 'EN' ? 'Dashboard' : 'Trang chủ'"
  >
    <Loader v-if="loading" />
    <div v-else>
      <!-- First section -->
      <div
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
            <h3 class="text-xl font-bold mb-3">
              {{ data.latestSurvey.title }}
            </h3>
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
                :to="{
                  name: 'SurveyView',
                  params: { id: data.latestSurvey.id },
                }"
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
          <div
            v-else
            class="text-gray-600 dark:text-gray-400 text-center py-16"
          >
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
          <div
            v-else
            class="text-gray-600 dark:text-gray-400 text-center py-16"
          >
            {{ $t("noAnswers") }}
          </div>
        </div>
      </div>

      <!-- Second section -->
      <div
        v-if="data.latestSurvey"
        class="grid grid-cols-1 lg:grid-cols-3 my-10 space-x-5 space-y-3 bg-white dark:bg-gray-800"
      >
        <div
          class="h-full max-h-[600px] overflow-y-scroll"
          :class="[data?.allAnswers.length ? 'lg:col-span-2' : 'lg:col-span-3']"
        >
          <div class="flex justify-between items-center px-5 py-3">
            <!-- Show/close filter -->
            <div
              class="text-black dark:text-gray-300 w-fit flex items-center p-3 cursor-pointer hover:text-gray-600 dark:hover:text-gray-200 group"
              :title="$t('showFilterTitle')"
              @click="showFilter()"
            >
              <svg
                v-if="!filter.show"
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="w-6 h-6 border border-gray-700 rounded-lg dark:border-gray-300 mr-2 group-hover:border-gray-600 group-hover:dark:border-gray-200"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M12 4.5v15m7.5-7.5h-15"
                />
              </svg>
              <svg
                v-else
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="w-6 h-6 border border-gray-700 rounded-lg dark:border-gray-300 mr-2 group-hover:border-gray-600 group-hover:dark:border-gray-200"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M19.5 12h-15"
                />
              </svg>

              {{ filter.show ? $t("closeFilter") : $t("showFilter") }}
            </div>

            <button
              @click="clearFilter"
              class="flex items-center space-x-2 bg-gray-800 dark:bg-white text-white dark:text-black border border-gray-300 dark:border-gray-700 py-2 px-5 rounded-lg hover:scale-110"
            >
              {{ $t("clearFilter") }}
            </button>
          </div>

          <!-- Filter -->
          <transition
            enter-active-class="transition ease-out duration-300"
            enter-from-class="transform opacity-0 scale-0"
            enter-to-class="transform opacity-100 scale-100"
            leave-active-class="transition ease-in duration-300"
            leave-from-class="transform opacity-100 scale-100"
            leave-to-class="transform opacity-0 scale-0"
          >
            <div
              v-if="filter.show"
              class="px-5 pb-5 sm:space-x-3 space-y-4 flex flex-wrap justify-center sm:justify-between items-center text-black dark:text-gray-300"
            >
              <!-- Fill by title, description -->
              <div class="flex space-x-2 items-center">
                <label for="searchSurvey">
                  {{ $t("search") }}
                </label>
                <input
                  v-model="filter.search"
                  @change="filtered"
                  type="text"
                  name="searchSurvey"
                  id="searchInput"
                  placeholder="Search for survey..."
                  class="max-w-[200px] text-black dark:text-gray-300 focus:ring-indigo-500 focus:border-indigo-500 flex-1 shadow-sm sm:text-sm border-gray-300 dark:border-gray-700 rounded-md dark:bg-gray-900"
                />
              </div>

              <!-- Fill by created from-to -->
              <div class="flex flex-col space-y-2">
                <span
                  class="flex flex-col sm:flex-row items-center justify-between space-x-2"
                >
                  <label for="dateFrom"> {{ $t("createFrom") }} </label>
                  <input
                    v-model="filter.create.from"
                    @change="filtered"
                    type="date"
                    name="dateFrom"
                    class="text-black dark:text-gray-300 focus:ring-indigo-500 focus:border-indigo-500 shadow-sm sm:text-sm border-gray-300 dark:border-gray-700 rounded-md dark:bg-gray-900"
                  />
                </span>
                <span
                  class="flex flex-col sm:flex-row items-center justify-between space-x-2"
                >
                  <label for="dateTo"> {{ $t("dateTo") }} </label>
                  <input
                    v-model="filter.create.to"
                    @change="filtered"
                    type="date"
                    name="dateTo"
                    class="text-black dark:text-gray-300 focus:ring-indigo-500 focus:border-indigo-500 shadow-sm sm:text-sm border-gray-300 dark:border-gray-700 rounded-md dark:bg-gray-900"
                  />
                </span>
              </div>

              <!-- Fill by updated from-to -->
              <div class="flex flex-col space-y-2">
                <span
                  class="flex flex-col sm:flex-row items-center justify-between space-x-2"
                >
                  <label for="dateFrom"> {{ $t("updateFrom") }} </label>
                  <input
                    v-model="filter.update.from"
                    @change="filtered"
                    type="date"
                    name="dateFrom"
                    class="text-black dark:text-gray-300 focus:ring-indigo-500 focus:border-indigo-500 shadow-sm sm:text-sm border-gray-300 dark:border-gray-700 rounded-md dark:bg-gray-900"
                  />
                </span>
                <span
                  class="flex flex-col sm:flex-row items-center justify-between space-x-2"
                >
                  <label for="dateTo"> {{ $t("dateTo") }} </label>
                  <input
                    v-model="filter.update.to"
                    @change="filtered"
                    type="date"
                    name="dateTo"
                    class="text-black dark:text-gray-300 focus:ring-indigo-500 focus:border-indigo-500 shadow-sm sm:text-sm border-gray-300 dark:border-gray-700 rounded-md dark:bg-gray-900"
                  />
                </span>
              </div>

              <!-- Fill by Status, Expired date -->
              <div class="flex ml-4 sm:ml-0 items-center space-x-3">
                <div
                  class="text-black dark:text-white flex flex-col sm:flex-row items-center space-y-2 sm:space-x-2 text-center"
                >
                  <label for="status"> {{ $t("statusActive") }}: </label>
                  <input
                    type="checkbox"
                    name="status"
                    v-model="filter.active"
                    @change="filtered"
                  />
                </div>
                <div
                  class="text-black dark:text-white flex flex-col sm:flex-row items-center space-y-2 sm:space-x-2 text-center"
                >
                  <label for="expired"> {{ $t("showExpired") }}: </label>
                  <input
                    type="checkbox"
                    name="expired"
                    v-model="filter.expire"
                    @change="filtered"
                  />
                </div>
              </div>
            </div>
          </transition>

          <!-- Table -->
          <table class="text-black dark:text-white text-center">
            <thead>
              <tr class="sticky top-0 bg-white dark:bg-gray-800">
                <th></th>
                <th class="p-5">{{ $t("status") }}</th>
                <th class="p-5">{{ $t("surveyTitle") }}</th>
                <th class="p-5">Slug</th>
                <th class="p-5">{{ $t("createdDate") }}</th>
                <th class="p-5">{{ $t("updatedDate") }}</th>
                <th class="p-5">{{ $t("expiredDate") }}</th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-if="filtered().length"
                v-for="(survey, index) in filtered()"
                :key="survey.id"
              >
                <td>{{ index + 1 }}</td>
                <td class="p-2">
                  {{ survey.status ? $t("statusActive") : $t("statusDraft") }}
                </td>
                <td class="p-2">{{ survey.title }}</td>
                <td class="p-2">{{ survey.slug }}</td>
                <td class="p-2">
                  {{ formatDate(survey.created_at) }}
                </td>
                <td class="p-2">
                  {{ formatDate(survey.updated_at) }}
                </td>
                <td class="p-2">
                  {{
                    survey.expire_date
                      ? formatDate(survey.expire_date)
                      : $t("notSpecified")
                  }}
                </td>
              </tr>
              <tr
                v-else
                class="text-black dark:text-white pt-5 text-lg font-bold"
              >
                <td class="p-2">
                  {{ $t("noMatch") }}
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <!-- Chart -->
        <div class="flex flex-col items-center justify-between py-5">
          <!-- Chart 1 -->
          <div
            v-if="data?.allAnswers.length"
            class="w-full lg:max-w-[400px] lg:max-h-[300px]"
          >
            <div
              class="text-gray-700 dark:text-gray-300 font-bold text-lg my-5"
            >
              {{ $t("surveyPerDay") }}
              {{ `${getCurrentDate().month}/${getCurrentDate().year}` }}
            </div>
            <BarChart
              :data="barChartData()"
              :month="getCurrentDate().month"
              :year="getCurrentDate().year"
            />
          </div>

          <!-- Chart 2 -->
          <div
            v-if="data?.surveys.length"
            class="w-full lg:max-w-[400px] lg:max-h-[300px]"
          >
            <div
              class="text-gray-700 dark:text-gray-300 font-bold text-lg my-5"
            >
              {{ $t("surveyPerMonth") }}
              {{ getCurrentDate().year }}
            </div>
            <LineChart :data="lineChartData()" />
          </div>
        </div>
      </div>
    </div>
  </PageComponent>
</template>

<script setup>
import PageComponent from "../components/PageComponent.vue";
import { computed, watch, ref, onMounted, onUnmounted } from "vue";
import store from "../store/index";
import Loader from "../components/Loader.vue";
import i18n from "../i18n";
import BarChart from "../components/BarChart.vue";
import LineChart from "../components/LineChart.vue";

const loading = computed(() => store.state.dashboard.loading);
const data = computed(() => store.state.dashboard.data);

function openModel(answer, individual) {
  store.commit("setModalData", { open: true, data: answer, individual });
}

store.dispatch("getDashboardData");

watch(data, () => {
  barChartData();
  lineChartData();
});

const filter = ref({
  show: false,
  search: "",
  create: {
    from: "",
    to: "",
  },
  update: {
    from: "",
    to: "",
  },
  active: true,
  expire: true,
});

onMounted(() => {
  window.addEventListener("keydown", listenKeyEvent);
});

onUnmounted(() => {
  window.removeEventListener("keydown", listenKeyEvent);
});

function listenKeyEvent(e) {
  if (e.ctrlKey && e.key === "k") {
    e.preventDefault();
    filter.value = {
      ...filter.value,
      show: !filter.value.show,
    };
  }
}

function barChartData() {
  if (data.value.allAnswers) {
    let bcData = createDaysInMonth();

    data.value.allAnswers.map((answer) => {
      let date = new Date(answer.end_date);
      if (
        getCurrentDate().year === date.getFullYear() &&
        getCurrentDate().month - 1 === date.getMonth()
      ) {
        bcData[date.getDate() - 1] += 1;
      }
    });

    return bcData;
  }
}

function lineChartData() {
  if (data.value.surveys) {
    let months = Array.from({ length: 12 }, () => 0);
    data.value.surveys.map((survey) => {
      let date = new Date(survey.created_at);
      months[date.getMonth()] += 1;
    });

    return months;
  }
}

function createDaysInMonth() {
  const daysInMonth = new Date(
    getCurrentDate().year,
    getCurrentDate().month,
    0
  ).getDate();

  const days = Array.from({ length: daysInMonth }, () => 0);
  return days;
}

function getCurrentDate() {
  const currentDate = new Date();
  return {
    year: currentDate.getFullYear(),
    month: currentDate.getMonth() + 1,
    day: currentDate.getDate(),
  };
}

function formatDate(date) {
  const formattedDate = new Date(date);

  const year = formattedDate.getFullYear();
  const month = String(formattedDate.getMonth() + 1).padStart(2, "0");
  const day = String(formattedDate.getDate()).padStart(2, "0");
  const hours = String(formattedDate.getHours()).padStart(2, "0");
  const minutes = String(formattedDate.getMinutes()).padStart(2, "0");
  const seconds = String(formattedDate.getSeconds()).padStart(2, "0");

  return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
}

function showFilter() {
  filter.value = {
    ...filter.value,
    show: !filter.value.show,
  };
}

function clearFilter() {
  filter.value = {
    show: filter.value.show,
    search: "",
    create: {
      from: "",
      to: "",
    },
    update: {
      from: "",
      to: "",
    },
    active: true,
    expire: true,
  };
}

function filtered() {
  let filteredData = data.value.surveys;

  if (filter.value.active) {
    filteredData = filteredData.filter((survey) => survey.status);
  }

  if (!filter.value.expire) {
    filteredData = filteredData.filter((survey) => {
      return new Date() < new Date(survey.expire_date);
    });
  }

  if (filter.value.search) {
    filteredData = filteredData.filter((survey) => {
      return (
        survey.title
          .toLowerCase()
          .includes(filter.value.search.toLowerCase()) ||
        survey.slug.toLowerCase().includes(filter.value.search.toLowerCase())
      );
    });
  }

  if (filter.value.create.from && !filter.value.create.to) {
    let date = new Date(filter.value.create.from);
    date.setHours(0);
    filteredData = filteredData.filter(
      (survey) => new Date(survey.created_at) >= date
    );
  } else if (!filter.value.create.from && filter.value.create.to) {
    let date = new Date(filter.value.create.to);
    date.setHours(23);
    filteredData = filteredData.filter(
      (survey) => new Date(survey.created_at) <= date
    );
  } else if (filter.value.create.from && filter.value.create.to) {
    let dateFrom = new Date(filter.value.create.from);
    let dateTo = new Date(filter.value.create.to);
    dateFrom.setHours(0);
    dateTo.setHours(23);
    filteredData = filteredData.filter((survey) => {
      return (
        new Date(survey.created_at) >= dateFrom &&
        new Date(survey.created_at) <= dateTo
      );
    });
  }

  if (filter.value.update.from && !filter.value.update.to) {
    let date = new Date(filter.value.update.from);
    date.setHours(0);
    filteredData = filteredData.filter(
      (survey) => new Date(survey.updated_at) >= date
    );
  } else if (!filter.value.update.from && filter.value.update.to) {
    let date = new Date(filter.value.update.to);
    date.setHours(23);
    filteredData = filteredData.filter(
      (survey) => new Date(survey.updated_at) <= date
    );
  } else if (filter.value.update.from && filter.value.update.to) {
    let dateFrom = new Date(filter.value.update.from);
    let dateTo = new Date(filter.value.update.to);
    dateFrom.setHours(0);
    dateTo.setHours(23);
    filteredData = filteredData.filter((survey) => {
      return (
        new Date(survey.updated_at) >= dateFrom &&
        new Date(survey.updated_at) <= dateTo
      );
    });
  }

  return filteredData;
}
</script>
