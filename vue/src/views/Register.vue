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
      {{ $t("registerTitle") }}
    </h2>
  </div>

  <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-sm">
    <form class="space-y-6" @submit="register">
      <Alert
        v-if="Object.keys(errors).length"
        class="flex flex-col items-stretch text-sm relative"
      >
        <div
          v-for="(field, index) of Object.keys(errors)"
          :key="index"
          class="space-y-1"
        >
          <div v-for="(error, i) of errors[field] || []" :key="i">
            * {{ error }}
          </div>
        </div>
        <span
          @click="errors = {}"
          class="absolute right-2 top-2 h-8 w-8 flex items-center justify-center cursor-pointer transition-colors hover:bg-[rgba(0,0,0,0.2)] rounded-full"
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
          for="fullname"
          class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-100"
        >
          {{ $t("fullName") }}
        </label>
        <div class="mt-2">
          <input
            id="fullname"
            name="name"
            type="text"
            autocomplete="name"
            required=""
            placeholder="Nguyen Van A..."
            v-model="user.name"
            class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 dark:ring-gray-700 placeholder:text-gray-400 dark:placeholder:text-gray-600 focus:ring-2 focus:ring-inset focus:ring-indigo-600 dark:focus:ring-indigo-400 sm:text-sm sm:leading-6"
          />
        </div>
      </div>
      <div>
        <label
          for="email"
          class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-100"
          >Email</label
        >
        <div class="mt-2">
          <input
            id="email"
            name="email"
            type="email"
            autocomplete="email"
            required=""
            v-model="user.email"
            placeholder="vana@gmail.com..."
            class="block w-full rounded-md border-0 py-1.5 text-gray-900 dark:ring-gray-700 dark:focus:ring-indigo-400 dark:placeholder:text-gray-600 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
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
            required=""
            v-model="user.password"
            :placeholder="$t('password') + '...'"
            class="block w-full rounded-md border-0 py-1.5 text-gray-900 dark:ring-gray-700 dark:focus:ring-indigo-400 dark:placeholder:text-gray-600 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
          />
        </div>
      </div>

      <div>
        <div class="flex items-center justify-between">
          <label
            for="password_confirmation"
            class="block text-sm font-medium leading-6 text-gray-900 dark:text-gray-100"
          >
            {{ $t("passwordConfirmation") }}
          </label>
        </div>
        <div class="mt-2">
          <input
            id="password_confirmation"
            name="password_confirmation"
            type="password"
            required=""
            v-model="user.password_confirmation"
            :placeholder="$t('passwordConfirmation') + `...`"
            class="block w-full rounded-md border-0 py-1.5 text-gray-900 dark:ring-gray-700 dark:focus:ring-indigo-400 dark:placeholder:text-gray-600 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6"
          />
        </div>
      </div>

      <div>
        <button
          :disabled="loading"
          type="submit"
          class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 dark:focus-visible:outline-indigo-400"
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
          {{ $t("signUp") }}
        </button>
      </div>
    </form>

    <p class="mt-10 text-center text-sm text-gray-700 dark:text-gray-300">
      {{ $t("hadAccount") }}
      <router-link
        :to="{ name: 'Login' }"
        class="font-semibold leading-6 text-indigo-600 dark:text-indigo-400 hover:text-indigo-500"
      >
        {{ $t("clickToSignIn") }}
      </router-link>
    </p>
  </div>
</template>

<script setup>
import { ref } from "vue";
import store from "../store";
import { useRouter } from "vue-router";
import Alert from "../components/Alert.vue";
import i18n from "../i18n";

const router = useRouter();
const user = {
  name: "",
  email: "",
  password: "",
  password_confirmation: "",
};

const loading = ref(false);
const errors = ref({});

function register(e) {
  e.preventDefault();
  loading.value = true;
  store
    .dispatch("register", user)
    .then(() => {
      loading.value = false;
      router.push({ name: "Dashboard" });
    })
    .catch((err) => {
      loading.value = false;
      if (err.response.status === 422) {
        errors.value =
          i18n.global.locale == "EN"
            ? err.response.data.errors
            : translateErrors(err.response.data.errors);
      }
    });
}

function translateErrors(errorsList) {
  if (errorsList["email"]) {
    errorsList["email"][0] = "Email này đã được đăng ký.";
  }
  if (errorsList["password"]) {
    errorsList["password"].map((e, index) => {
      if (e.includes("not match")) {
        errorsList["password"][index] = "Mật khẩu nhập lại không khớp.";
      } else if (e.includes("8 characters")) {
        errorsList["password"][index] = "Mật khẩu phải có ít nhất 8 ký tự.";
      } else if (e.includes("uppercase") || e.includes("lowercase")) {
        errorsList["password"][index] =
          "Mật khẩu phải có ít nhất một ký tự hoa và một ký tự tường";
      } else if (e.includes("one symbol")) {
        errorsList["password"][index] = "Mật khẩu phải có ít nhất một ký hiệu";
      } else if (e.includes("one number")) {
        errorsList["password"][index] = "Mật khẩu phải có ít nhất một chữ số";
      }
      return e;
    });
  }

  return errorsList;
}
</script>

<style scoped></style>
