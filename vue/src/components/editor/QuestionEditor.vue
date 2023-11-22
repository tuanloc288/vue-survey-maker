<template>
  <!-- Question index -->
  <div class="flex items-center justify-between space-x-2">
    <h3 class="text-sm sm:text-lg font-bold text-black dark:text-white">
      {{ index + 1 }}. {{ model.question }}
    </h3>

    <div class="flex items-center">
      <!-- Add new question -->
      <button
        type="button"
        @click="addQuestion()"
        class="flex items-center text-xs py-1 px-3 mr-2 rounded-sm text-white bg-indigo-600 hover:bg-indigo-700"
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

        Add
      </button>
      <!--/ Add new question -->

      <!-- Delete question -->
      <button
        type="button"
        @click="deleteQuestion()"
        class="flex items-center text-xs py-1 px-3 rounded-sm border border-transparent text-white border-red-400 bg-red-500 hover:bg-red-600 transition-colors"
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
            d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"
          />
        </svg>

        Delete
      </button>
      <!--/ Delete question -->
    </div>
  </div>
  <!--/ Question index -->
  <div class="grid gap-3 grid-cols-12">
    <!-- Question -->
    <div class="mt-3 col-span-9">
      <label
        :for="'question_text_' + model.data"
        class="block text-sm font-medium text-gray-700 dark:text-gray-300"
      >
        Question
      </label>
      <input
        type="text"
        autocomplete="question_title"
        :name="'question_text_' + model.data"
        v-model="model.question"
        @change="dataChange"
        :id="'question_text_' + model.data"
        class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 dark:border-gray-700 dark:bg-transparent dark:text-gray-200 rounded-md"
      />
    </div>
    <!--/ Question -->

    <!-- Question Type -->
    <div class="mt-3 col-span-3">
      <label
        for="question_type"
        class="block text-sm font-medium text-gray-700 dark:text-gray-300"
      >
        Type
      </label>
      <select
        id="question_type"
        name="question_type"
        v-model="model.type"
        @change="typeChange"
        class="mt-1 block w-full py-2 px-3 border border-gray-300 dark:border-gray-700 bg-white dark:bg-transparent text-black dark:text-gray-200 rounded-md shadow-sm focus:outline-none focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
      >
        <option
          v-for="(type, index) in questionTypes"
          :key="index"
          :value="type"
          class="dark:bg-gray-900"
        >
          {{ upperCaseFirst(type) }}
        </option>
      </select>
    </div>
    <!--/ Question Type -->
  </div>

  <!-- Question Description -->
  <div class="mt-3 col-span-9">
    <label
      :for="'question_description_' + model.id"
      class="block text-sm font-medium text-gray-700 dark:text-gray-300"
      >Description</label
    >
    <textarea
      :name="'question_description_' + model.id"
      v-model="model.description"
      @change="dataChange"
      :id="'question_description_' + model.id"
      class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 dark:border-gray-700 dark:bg-transparent dark:text-gray-200 rounded-md"
    ></textarea>
  </div>
  <!--/ Question Description -->

  <!-- Data -->
  <div>
    <div v-if="shouldHaveOptions()" class="mt-2">
      <h4
        class="text-sm font-semibold mb-1 flex justify-between items-center text-black dark:text-gray-300"
      >
        Options

        <!-- Add new option -->
        <button
          type="button"
          @click="addOption"
          class="flex items-center text-xs py-1 px-2 rounded-sm text-white bg-indigo-600 hover:bg-indigo-700"
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
          Add option
        </button>
        <!--/ Add new option -->
      </h4>

      <div
        v-if="!model.data.options?.length"
        class="text-xs text-gray-600 dark:text-gray-400 text-center py-3"
      >
        You don't have any options defined
      </div>
      <!-- Option list -->
      <div
        v-else
        v-for="(option, ind) in model.data.options"
        :key="option.uuid"
        class="flex items-center mb-1 space-x-2"
      >
        <span class="w-6 text-sm text-black dark:text-gray-300">
          {{ ind + 1 }}.
        </span>
        <input
          type="text"
          tabindex="1"
          v-model="option.text"
          @change="dataChange"
          class="w-full max-w-[70%] sm:max-w-[80%] md:max-w-[85%] lg:max-w-[90%] rounded-sm py-1 px-2 text-xs border border-gray-300 dark:border-gray-700 dark:bg-transparent dark:text-gray-200 focus:border-indigo-500"
        />
        <div class="flex justify-between items-center">
          <!-- Delete Option -->
          <button
            type="button"
            @click="removeOption(option)"
            class="h-6 w-6 rounded-full flex items-center justify-center border border-transparent transition-colors hover:border-red-100 dark:hover:border-red-900"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke-width="1.5"
              stroke="currentColor"
              class="w-4 h-4 text-red-500"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0"
              />
            </svg>
          </button>
          <!--/ Delete Option -->
          <span
            v-if="ind !== 0"
            class="hover:cursor-pointer text-black dark:text-gray-200"
            @click="changeOptPos(1, ind)"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke-width="1.5"
              stroke="currentColor"
              class="w-4 h-4 hover:animate-bounce hover:text-green-400"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M8.25 6.75L12 3m0 0l3.75 3.75M12 3v18"
              />
            </svg>
          </span>
          <span
            v-if="model.data.options?.length !== ind + 1"
            class="hover:cursor-pointer text-black dark:text-gray-200"
            @click="changeOptPos(0, ind)"
          >
            <svg
              xmlns="http://www.w3.org/2000/svg"
              fill="none"
              viewBox="0 0 24 24"
              stroke-width="1.5"
              stroke="currentColor"
              class="w-4 h-4 hover:animate-bounce hover:text-red-300"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                d="M15.75 17.25L12 21m0 0l-3.75-3.75M12 21V3"
              />
            </svg>
          </span>
        </div>
      </div>
      <!--/ Option list -->
    </div>
  </div>
  <!--/ Data -->

  <hr class="my-1" />
</template>

<script setup>
import { ref, computed } from "vue";
import store from "../../store";
import { v4 as uuidv4 } from "uuid";

const props = defineProps({
  question: Object,
  index: Number,
});

const emit = defineEmits(["change", "addQuestion", "deleteQuestion"]);

const model = ref(parseJson(props.question));
const questionTypes = computed(() => store.state.questionTypes);

function upperCaseFirst(str) {
  return str.charAt(0).toUpperCase() + str.slice(1);
}

function shouldHaveOptions() {
  return ["select", "radio", "checkbox"].includes(model.value.type);
}

function getOptions() {
  return model.value.data.options;
}

function setOptions(options) {
  options = options.sort((a, b) => a.index - b.index);
  model.value.data.options = options;
}

function parseJson(option) {
  return JSON.parse(JSON.stringify(option));
}

function addOption() {
  setOptions([
    ...(getOptions() ? getOptions() : []),
    {
      uuid: uuidv4(),
      text: "",
      index:
        getOptions() && getOptions().length !== 0 ? getOptions().length : 0,
    },
  ]);
  dataChange();
}

function removeOption(option) {
  let newOpts = getOptions().map((opt, ind) => {
    if (opt.uuid !== option.uuid) {
      if (opt.index > option.index)
        return parseJson({ ...opt, index: opt.index - 1 });
      else return parseJson({ ...opt, index: ind });
    }
    return parseJson({ ...option });
  });
  setOptions(newOpts.filter((opt) => opt.uuid !== option.uuid));
  dataChange();
}

// when switching from type that should have options to something that does't
// setOptions here just in case if these is any options left
function typeChange() {
  if (shouldHaveOptions()) {
    setOptions(getOptions() || []);
  }
  dataChange();
}

function dataChange() {
  let data = model.value;
  if (!shouldHaveOptions()) {
    delete data.data.options;
  }
  emit("change", data);
}

function addQuestion() {
  emit("addQuestion", props.index + 1);
}

function deleteQuestion() {
  emit("deleteQuestion", props.question);
}

function changeOptPos(type, ind) {
  // go up
  let newOpts;
  if (!!type) {
    newOpts = getOptions().map((opt) => {
      if (opt.index === ind - 1) {
        return parseJson({ ...opt, index: ind });
      } else if (opt.index === ind) {
        return parseJson({ ...opt, index: ind - 1 });
      }

      return parseJson({ ...opt });
    });
  }
  // go down
  else {
    newOpts = getOptions().map((opt) => {
      if (opt.index === ind + 1) {
        return parseJson({ ...opt, index: ind });
      } else if (opt.index === ind) {
        return parseJson({ ...opt, index: ind + 1 });
      }

      return parseJson({ ...opt });
    });
  }
  setOptions(newOpts);
  emit('change', model.value)
}
</script>

<style scoped></style>
