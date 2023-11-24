<template>
  <fieldset class="mb-4">
    <div
      v-if="
        !checkQuestionType(question.type) ||
        (checkQuestionType(question.type) && question.data.options.length)
      "
    >
      <legend class="text-base font-medium text-gray-900 dark:text-gray-100">
        {{ question.index + 1 }}. {{ question.question }}
      </legend>
      <p class="text-gray-800 dark:text-gray-200 text-sm">
        {{ question.description }}
      </p>
    </div>
    <div class="mt-3">
      <div v-if="question.type === 'select' && question.data.options.length">
        <select
          :value="modelValue"
          @change="emit('update:modelValue', $event.target.value)"
          class="text-black dark:text-gray-300 mt-1 block w-full px-3 py-3 border border-gray-300 dark:border-gray-700 bg-white dark:bg-gray-900 rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
        >
          <option value="">Select an option...</option>
          <option
            v-for="option in question.data.options"
            :value="option.text"
            :key="option.uuid"
          >
            {{ option.text }}
          </option>
        </select>
      </div>
      <div
        v-else-if="question.type === 'checkbox' && question.data.options.length"
      >
        <div
          v-for="(option, index) of question.data.options"
          :key="option.uuid"
          class="flex items-center"
        >
          <input
            :id="option.uuid"
            type="checkbox"
            v-model="model[option.text]"
            @change="onCheckboxChange"
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
        v-else-if="question.type === 'radio' && question.data.options.length"
      >
        <div
          v-for="(option, index) of question.data.options"
          :key="option.uuid"
          class="flex items-center"
        >
          <input
            v-if="option.text"
            :id="option.uuid"
            :name="'question' + question.id"
            :value="option.text"
            type="radio"
            @change="emit('update:modelValue', $event.target.value)"
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
          type="text"
          :value="modelValue"
          @input="emit('update:modelValue', $event.target.value)"
          class="text-black dark:text-gray-300 mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 dark:border-gray-700 rounded-md dark:bg-gray-900"
        />
      </div>
      <div v-else-if="question.type === 'textarea'">
        <textarea
          :value="modelValue"
          @input="emit('update:modelValue', $event.target.value)"
          class="text-black dark:text-gray-300 mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 dark:border-gray-700 rounded-md dark:bg-gray-900"
        />
      </div>
    </div>
  </fieldset>
  <hr class="mb-4" />
</template>

<script setup>
import { ref } from "vue";

const { question, modelValue } = defineProps({
  question: Object,
  modelValue: [String, Array],
});

const emit = defineEmits(["update:modelValue"]); // for 2-way binding with SurveyPublicView

let model;
if (question.type === "checkbox") {
  model = ref({});
}

function onCheckboxChange($e) {
  const selectedOptions = [];
  for (let text in model.value) {
    if (model.value[text]) {
      selectedOptions.push(text);
    }
  }
  emit("update:modelValue", selectedOptions);
}

function checkQuestionType(type) {
  if (type === "select" || type === "radio" || type === "checkbox") return true;
  return false;
}
</script>

<style scoped></style>
