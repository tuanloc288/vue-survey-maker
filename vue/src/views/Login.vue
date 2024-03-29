<template>
  <div class="sm:mx-auto sm:w-full sm:max-w-sm">
    <img
      class="mx-auto h-10 w-auto"
      src="https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600"
      alt="Your Company"
    />
    <h2
      class="mt-5 text-center text-2xl font-bold leading-9 tracking-tight text-gray-900 dark:text-gray-100"
    >
      {{ $t("signInTitle") }}
    </h2>
  </div>

  <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
    <form class="space-y-6" @submit="login">
      <Alert v-if="errorMsg">
        {{ errorMsg }}
        <span
          @click="errorMsg = ''"
          class="h-8 w-8 flex items-center justify-center cursor-pointer transition-colors hover:bg-[rgba(0,0,0,0.2)] rounded-full"
        >
          <svg
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
            stroke-width="1.5"
            stroke="currentColor"
            class="w-6 h-6"
          >
            <path
              stroke-linecap="round"
              stroke-linejoin="round"
              d="M9.75 9.75l4.5 4.5m0-4.5l-4.5 4.5M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
            />
          </svg>
        </span>
      </Alert>
      <div>
        <label
          for="email"
          class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-100"
        >
          Email
        </label>
        <div class="mt-2">
          <input
            id="email"
            name="email"
            type="email"
            autocomplete="email"
            required=""
            v-model="user.email"
            placeholder="vana@gmail.com..."
            class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-700 placeholder:text-gray-400 dark:placeholder:text-gray-600 focus:ring-2 focus:ring-inset focus:ring-indigo-600 dark:focus:ring-indigo-400 sm:text-sm sm:leading-6"
          />
        </div>
      </div>

      <div>
        <div class="flex items-center justify-between">
          <label
            for="password"
            class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-100"
          >
            {{ $t("password") }}
          </label>
        </div>
        <div class="mt-2">
          <input
            id="password"
            name="password"
            type="password"
            autocapitalize="current-password"
            required=""
            v-model="user.password"
            class="block w-full rounded-md border-0 py-1.5 text-gray-900shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-700 placeholder:text-gray-400 dark:placeholder:text-gray-600 focus:ring-2 focus:ring-inset focus:ring-indigo-600 dark:focus:ring-indigo-400 sm:text-sm sm:leading-6"
          />
        </div>
      </div>

      <div class="flex items-center justify-between">
        <div class="flex items-center">
          <input
            id="remember-me"
            name="remember-me"
            type="checkbox"
            v-model="user.remember"
            class="h-4 w-4 text-indigo-600 dark:text-indigo-400 focus:ring-indigo-500 border-gray-300 dark:border-gray-700 rounded"
          />
          <label
            for="remember-me"
            class="ml-2 block text-sm text-gray-900 dark:text-gray-100"
          >
            {{ $t("rememberMe") }}
          </label>
        </div>
      </div>

      <div>
        <button
          :disabled="loading"
          type="submit"
          class="flex w-full justify-center rounded-md bg-indigo-600 dark:bg-indigo-400 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 dark:focus-visible:outline-indigo-400"
          :class="{
            'cursor-not-allowed': loading,
            'hover:bg-indigo-500': loading,
          }"
        >
          <svg
            v-if="loading"
            class="animate-spin -ml-1 mr-3 h-5 w-5 text-white"
            xmlns="http://www.w3.org/2000/svg"
            fill="none"
            viewBox="0 0 24 24"
          >
            <circle
              class="opacity-25"
              cx="12"
              cy="12"
              r="10"
              stroke="currentColor"
              stroke-width="4"
            ></circle>
            <path
              class="opacity-75"
              fill="currentColor"
              d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"
            ></path>
          </svg>
          {{ $t("signIn") }}
        </button>
      </div>
    </form>
    <p class="mt-10 text-center text-sm text-gray-700 dark:text-gray-300">
      {{ $t("noAccount") }}
      <router-link
        :to="{ name: 'Register' }"
        class="font-semibold leading-6 text-indigo-600 dark:text-indigo-400 hover:text-indigo-500"
      >
        {{ $t("clickToSignUp") }}
      </router-link>
    </p>
  </div>
</template>

<script setup>
import { useRouter } from "vue-router";
import store from "../store";
import { ref } from "vue";
import Alert from "../components/Alert.vue";
import i18n from "../i18n";

const router = useRouter();
const user = {
  email: "",
  password: "",
  remember: false,
};

const loading = ref(false);
let errorMsg = ref("");

function login(e) {
  e.preventDefault();

  loading.value = true;

  store
    .dispatch("login", user)
    .then((res) => {
      loading.value = false;
      router.push({ name: "Dashboard" });
    })
    .catch((err) => {
      loading.value = false;
      if (err.response.data.error || err.response.data.errors) {
        errorMsg.value =
          i18n.global.locale == "EN"
            ? err.response.data.error
              ? err.response.data.error
              : "The provided credentials are not correct"
            : "Sai tài khoản hoặc mật khẩu";
      }
    });
}
</script>

<style scoped></style>
