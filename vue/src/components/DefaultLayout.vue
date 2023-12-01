<template>
  <div
    class="relative"
    :class="[
      modalOpen || confirmDialogOpen ? 'max-h-screen sm:min-h-screen overflow-hidden' : 'min-h-full',
    ]"
  >
    <div
      v-if="modalOpen"
      class="absolute animate-from-left sm:animate-from-top left-0 top-0 h-screen w-screen min-h-full flex items-center justify-center bg-black/50 z-30"
    >
      <Modal />
    </div>
    <div
      v-if="confirmDialogOpen"
      class="absolute animate-from-left sm:animate-from-top left-0 top-0 h-screen w-screen min-h-full flex items-center justify-center bg-black/50 z-30"
    >
      <ConfirmDialog />
    </div>
    <Disclosure
      as="nav"
      class="bg-gray-800 dark:bg-black"
      :class="[
        fixedNav
          ? 'fixed top-0 left-0 right-0 w-full z-20 py-3 transition-transform'
          : '',
      ]"
      v-slot="{ open }"
    >
      <div class="mx-auto max-w-7xl px-4 sm:px-6 lg:px-8">
        <div class="flex h-16 items-center justify-between">
          <div class="flex items-center justify-center">
            <div class="flex-shrink-0">
              <img
                class="h-12 w-12 cursor-pointer"
                src="/images/logo.png"
                alt="Logo"
                @click="gotoHome()"
              />
            </div>
            <div class="hidden md:block">
              <div class="ml-10 flex items-baseline space-x-4">
                <router-link
                  v-for="item in navigation"
                  :key="item.name"
                  :to="item.to"
                  active-class="bg-gray-900 text-white"
                  :class="[
                    this.$route.name === item.to.name
                      ? ''
                      : 'text-gray-300 hover:bg-gray-700 hover:text-white',
                    'rounded-md px-3 py-2 text-sm font-medium',
                  ]"
                  >{{ item.name }}</router-link
                >
              </div>
            </div>
          </div>
          <div class="hidden md:block">
            <div class="ml-4 flex items-center md:ml-6">
              <div
                class="p-2 mr-2 flex text-gray-800 border bg-white rounded-3xl cursor-pointer"
                @click="toggle()"
              >
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  class="w-6 h-6 hover:scale-125 animate-from-top"
                  id="sun"
                  :class="[!isDark ? 'hidden' : '']"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M12 3v2.25m6.364.386l-1.591 1.591M21 12h-2.25m-.386 6.364l-1.591-1.591M12 18.75V21m-4.773-4.227l-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0z"
                  />
                </svg>
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  class="w-6 h-6 hover:scale-125 animate-from-top"
                  id="moon"
                  :class="[isDark ? 'hidden' : '']"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M21.752 15.002A9.718 9.718 0 0118 15.75c-5.385 0-9.75-4.365-9.75-9.75 0-1.33.266-2.597.748-3.752A9.753 9.753 0 003 11.25C3 16.635 7.365 21 12.75 21a9.753 9.753 0 009.002-5.998z"
                  />
                </svg>
              </div>
              <!-- Profile dropdown -->
              <Menu as="div" class="relative ml-3">
                <div class="flex">
                  <MenuButton
                    class="relative flex max-w-xs items-center rounded-full bg-gray-800 dark:bg-black text-sm focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800"
                  >
                    <span class="absolute -inset-1.5" />
                    <span class="sr-only">Open user menu</span>
                    <div class="mx-3 space-y-1">
                      <div
                        class="text-left text-base font-medium leading-none text-white"
                      >
                        {{ user.name }}
                      </div>
                      <div
                        class="text-sm font-medium leading-none text-gray-400"
                      >
                        {{ user.email }}
                      </div>
                    </div>
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke-width="1.5"
                      stroke="white"
                      class="w-8 h-8"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        d="M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z"
                      />
                    </svg>
                  </MenuButton>
                </div>

                <transition
                  enter-active-class="transition ease-out duration-100"
                  enter-from-class="transform opacity-0 scale-95"
                  enter-to-class="transform opacity-100 scale-100"
                  leave-active-class="transition ease-in duration-75"
                  leave-from-class="transform opacity-100 scale-100"
                  leave-to-class="transform opacity-0 scale-95"
                >
                  <MenuItems
                    class="absolute right-0 z-10 mt-2 w-48 origin-top-right rounded-md bg-gray-200 dark:bg-white py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none"
                  >
                    <MenuItem>
                      <a
                        @click="logout"
                        class="cursor-pointer block px-4 py-2 text-sm text-gray-700"
                        >{{ $t("signOut") }}</a
                      >
                    </MenuItem>
                    <Menu as="div" class="relative">
                      <div class="flex">
                        <MenuButton
                          class="relative flex w-full justify-between items-center"
                        >
                          <span class="absolute -inset-1.5" />
                          <span class="sr-only">Open user menu</span>
                          <div class="mx-3 space-y-1">
                            <div
                              class="cursor-pointer block px-1 text-sm text-gray-700"
                            >
                              {{ $t("language") }}
                            </div>
                          </div>
                          <svg
                            xmlns="http://www.w3.org/2000/svg"
                            fill="none"
                            viewBox="0 0 24 24"
                            stroke-width="1.5"
                            stroke="currentColor"
                            class="w-4 h-4 mr-2 animate-bounce"
                          >
                            <path
                              stroke-linecap="round"
                              stroke-linejoin="round"
                              d="M19.5 13.5L12 21m0 0l-7.5-7.5M12 21V3"
                            />
                          </svg>
                        </MenuButton>
                      </div>
                      <transition
                        enter-active-class="transition ease-out duration-100"
                        enter-from-class="transform opacity-0 scale-95"
                        enter-to-class="transform opacity-100 scale-100"
                        leave-active-class="transition ease-in duration-75"
                        leave-from-class="transform opacity-100 scale-100"
                        leave-to-class="transform opacity-0 scale-95"
                      >
                        <MenuItems
                          class="absolute right-0 z-10 mt-2 w-48 origin-top-right rounded-md bg-gray-200 dark:bg-white py-1 shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none"
                        >
                          <MenuItem>
                            <div
                              class="flex cursor-pointer px-4 py-2 text-sm text-gray-700"
                              @click="changeLanguage('EN')"
                            >
                              <img
                                src="/images/enFlag.png"
                                alt="language flag"
                                class="w-6 h-6 object-contain"
                              />
                              <span class="flex-1 text-right">
                                {{ $t("lanEng") }}
                              </span>
                            </div>
                          </MenuItem>
                          <MenuItem>
                            <div
                              class="flex cursor-pointer px-4 py-2 text-sm text-gray-700"
                              @click="changeLanguage('VN')"
                            >
                              <img
                                src="/images/vnFlag.png"
                                alt="language flag"
                                class="w-6 h-6 object-contain"
                              />
                              <span class="flex-1 text-right">
                                {{ $t("lanVN") }}
                              </span>
                            </div>
                          </MenuItem>
                        </MenuItems>
                      </transition>
                    </Menu>
                  </MenuItems>
                </transition>
              </Menu>
            </div>
          </div>
          <div class="-mr-2 flex md:hidden">
            <div
              class="p-2 mr-4 flex text-gray-800 border bg-white rounded-3xl cursor-pointer"
              @click="toggle()"
            >
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="w-6 h-6 hover:scale-125 animate-from-top"
                id="sun"
                :class="[!isDark ? 'hidden' : '']"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M12 3v2.25m6.364.386l-1.591 1.591M21 12h-2.25m-.386 6.364l-1.591-1.591M12 18.75V21m-4.773-4.227l-1.591 1.591M5.25 12H3m4.227-4.773L5.636 5.636M15.75 12a3.75 3.75 0 11-7.5 0 3.75 3.75 0 017.5 0z"
                />
              </svg>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="currentColor"
                class="w-6 h-6 hover:scale-125 animate-from-top"
                id="moon"
                :class="[isDark ? 'hidden' : '']"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M21.752 15.002A9.718 9.718 0 0118 15.75c-5.385 0-9.75-4.365-9.75-9.75 0-1.33.266-2.597.748-3.752A9.753 9.753 0 003 11.25C3 16.635 7.365 21 12.75 21a9.753 9.753 0 009.002-5.998z"
                />
              </svg>
            </div>
            <!-- Mobile menu button -->
            <DisclosureButton
              class="relative inline-flex items-center justify-center rounded-md bg-gray-800 p-2 text-gray-400 hover:bg-gray-700 hover:text-white focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800"
            >
              <span class="absolute -inset-0.5" />
              <span class="sr-only">Open main menu</span>
              <Bars3Icon
                v-if="!open"
                class="block h-6 w-6"
                aria-hidden="true"
              />
              <XMarkIcon v-else class="block h-6 w-6" aria-hidden="true" />
            </DisclosureButton>
          </div>
        </div>
      </div>

      <DisclosurePanel class="md:hidden">
        <div class="space-y-1 px-2 pb-3 pt-2 sm:px-3">
          <router-link
            v-for="item in navigation"
            :key="item.name"
            :to="item.to"
            active-class="bg-gray-900 text-white"
            :class="[
              this.$route.name === item.to.name
                ? ''
                : 'text-gray-300 hover:bg-gray-700 hover:text-white',
              'block rounded-md px-3 py-2 text-base font-medium',
            ]"
            >{{ item.name }}</router-link
          >
        </div>
        <div class="border-t border-gray-700 pb-3 pt-4">
          <div class="flex items-center px-5">
            <div class="flex-shrink-0">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                fill="none"
                viewBox="0 0 24 24"
                stroke-width="1.5"
                stroke="white"
                class="w-8 h-8"
              >
                <path
                  stroke-linecap="round"
                  stroke-linejoin="round"
                  d="M17.982 18.725A7.488 7.488 0 0012 15.75a7.488 7.488 0 00-5.982 2.975m11.963 0a9 9 0 10-11.963 0m11.963 0A8.966 8.966 0 0112 21a8.966 8.966 0 01-5.982-2.275M15 9.75a3 3 0 11-6 0 3 3 0 016 0z"
                />
              </svg>
            </div>
            <div class="ml-3">
              <div class="text-base font-medium leading-none text-white">
                {{ user?.name }}
              </div>
              <div class="text-sm font-medium leading-none text-gray-400">
                {{ user?.email }}
              </div>
            </div>
          </div>
          <div class="mt-3 space-y-1 px-2">
            <div
              class="cursor-pointer flex rounded-md px-3 py-2 text-base font-medium text-gray-400 hover:bg-gray-700 hover:text-white"
              @click="changeLanguage('EN')"
            >
              <img
                src="/images/enFlag.png"
                alt="language flag"
                class="w-6 h-6 object-contain"
              />
              <span class="flex-1 text-right">
                {{ $t("lanEng") }}
              </span>
            </div>
            <div
              class="cursor-pointer flex rounded-md px-3 py-2 text-base font-medium text-gray-400 hover:bg-gray-700 hover:text-white"
              @click="changeLanguage('VN')"
            >
              <img
                src="/images/vnFlag.png"
                alt="language flag"
                class="w-6 h-6 object-contain"
              />
              <span class="flex-1 text-right">
                {{ $t("lanVN") }}
              </span>
            </div>
            <DisclosureButton
              as="a"
              @click="logout"
              class="cursor-pointer block rounded-md px-3 py-2 text-base font-medium text-gray-400 hover:bg-gray-700 hover:text-white"
              >{{ $t("signOut") }}</DisclosureButton
            >
          </div>
        </div>
      </DisclosurePanel>
    </Disclosure>

    <router-view></router-view>
    <Notification />
  </div>
</template>

<script>
import {
  Disclosure,
  DisclosureButton,
  DisclosurePanel,
  Menu,
  MenuButton,
  MenuItem,
  MenuItems,
} from "@headlessui/vue";
import { Bars3Icon, XMarkIcon } from "@heroicons/vue/24/outline";
import Notification from "./Notification.vue";
export default {
  components: {
    Disclosure,
    DisclosureButton,
    DisclosurePanel,
    Menu,
    MenuButton,
    MenuItem,
    MenuItems,
    Bars3Icon,
    XMarkIcon,
    Notification,
  },
  data() {
    return {
      fixedNav: false,
    };
  },
  mounted() {
    window.addEventListener("scroll", this.handleScroll);
  },
  unmounted() {
    window.removeEventListener("scroll", this.handleScroll);
  },
  methods: {
    handleScroll() {
      if (window.scrollY > 65 && !this.fixedNav) {
        this.fixedNav = true;
      } else if (window.scrollY === 0) {
        this.fixedNav = false;
      }
    },
  },
};
</script>

<script setup>
import { computed } from "vue";
import { useRouter } from "vue-router";
import { useStore } from "vuex";
import { useDark, useToggle } from "@vueuse/core";
import i18n from "../i18n";
import Modal from "../components/Modal.vue";
import ConfirmDialog from "../components/ConfirmDialog.vue";

const isDark = useDark();
const toggleDark = useToggle(isDark);

let navigation = [
  {
    name: "Dashboard",
    to: { name: "Dashboard" },
  },
  {
    name: "Surveys",
    to: { name: "Surveys" },
  },
];

const store = useStore();
const router = useRouter();

store.dispatch("getUser");
let user = computed(() => store.state.user.data);
const modalOpen = computed(() => store.state.modal.open);
const confirmDialogOpen = computed(() => store.state.confirmDialog.open);

function gotoHome() {
  router.push({ name: "Dashboard" });
}

function logout() {
  store.dispatch("logout").then(() => {
    router.push({
      name: "Login",
    });
  });
}

function toggle() {
  if (isDark) {
    let sun = document.getElementById("sun");

    sun.classList.add("animate-to-bottom");
  } else {
    let moon = document.getElementById("moon");

    moon.classList.add("animate-to-bottom");
  }

  toggleDark();
}

function changeLanguage(lan) {
  i18n.global.locale = lan;
  document.cookie = `locale=${lan}; path=/`;
}
</script>
