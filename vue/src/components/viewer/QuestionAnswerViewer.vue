<template>
  <fieldset
    class="mt-5"
    :class="[
      question.index % 2 == 0 ? 'animate-from-left' : 'animate-from-right',
    ]"
    :style="{ animationDelay: `${question.index * 0.2}s` }"
  >
    <div
      v-if="
        !checkQuestionType(question.type) ||
        (checkQuestionType(question.type) &&
          question.data.options.length &&
          removeEmptyOptions(question.data.options).length)
      "
    >
      <legend class="text-base font-bold text-gray-900 dark:text-gray-100">
        {{ question.index + 1 }}. {{ question.question }}
      </legend>
      <p
        class="text-gray-700 dark:text-gray-300 text-sm"
        v-html="question.description"
      />
    </div>
    <div class="mt-3">
      <div
        v-if="
          question.type === 'select' &&
          question.data.options.length &&
          removeEmptyOptions(question.data.options).length
        "
      >
        <select
          class="text-black dark:text-gray-300 mt-1 block w-full px-3 py-3 border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-900 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
        >
          <option disabled value="">Select an option...</option>
          <option
            :disabled="!option.checked"
            v-for="option in removeEmptyOptions(question.data.options)"
            :value="option.text"
            :key="option.uuid"
            :selected="option.checked"
          >
            {{ option.text }}
          </option>
        </select>
      </div>
      <div
        v-else-if="
          question.type === 'checkbox' &&
          question.data.options.length &&
          removeEmptyOptions(question.data.options).length
        "
      >
        <div
          v-for="(option, index) of removeEmptyOptions(question.data.options)"
          :key="option.uuid"
          class="flex items-center"
        >
          <input
            disabled
            :checked="option.checked"
            :id="option.uuid"
            type="checkbox"
            class="focus:ring-indigo-500 w-4 h-4 text-indigo-600 dark:text-indigo-400 border-gray-300 dark:border-gray-700 rounded"
          />
          <label
            :for="option.uuid"
            class="ml-3 block text-sm font-medium text-gray-700 dark:text-gray-300"
          >
            {{ option.text }}
          </label>
        </div>
      </div>
      <div
        v-else-if="
          question.type === 'radio' &&
          question.data.options.length &&
          removeEmptyOptions(question.data.options).length
        "
      >
        <div
          v-for="(option, index) of removeEmptyOptions(question.data.options)"
          :key="option.uuid"
          class="flex items-center"
        >
          <input
            v-if="option.text"
            disabled
            :checked="option.checked"
            :id="option.uuid"
            :value="option.text"
            type="radio"
            class="focus:ring-indigo-500 w-4 h-4 text-indigo-600 dark:text-indigo-400 border-gray-300 dark:border-gray-700"
          />
          <label
            v-if="option.text"
            :for="option.uuid"
            class="ml-3 block text-sm font-medium text-gray-700 dark:text-gray-300"
          >
            {{ option.text }}
          </label>
        </div>
      </div>
      <div v-else-if="question.type === 'text'">
        <input
          disabled
          :value="question.answer"
          type="text"
          class="text-black dark:text-gray-300 mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 dark:border-gray-700 rounded-md dark:bg-gray-900"
        />
      </div>
      <div v-else-if="question.type === 'textarea'">
        <textarea
          disabled
          :value="question.answer"
          class="text-black dark:text-gray-300 mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 dark:border-gray-700 rounded-md dark:bg-gray-900"
        />
      </div>
    </div>
  </fieldset>
</template>

<script setup>
const { question } = defineProps({
  question: Object,
});

function checkQuestionType(type) {
  if (type === "select" || type === "radio" || type === "checkbox") return true;
  return false;
}

function removeEmptyOptions(opts) {
  return opts.filter((opt) => opt.text);
}
</script>
