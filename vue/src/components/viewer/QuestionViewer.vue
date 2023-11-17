<template>
  <fieldset class="mb-4">
    <div>
      <legend class="text-base font-medium text-gray-900">
        {{ index + 1 }}. {{ question.question }}
      </legend>
      <p class="text-gray-500 text-sm">
        {{ question.description }}
      </p>
    </div>
    <div class="mt-3">
      <div v-if="question.type === 'select'">
        <select
          :value="modelValue"
          @change="emit('update:modelValue', $event.target.value)"
          class="mt-1 block w-full px-3 py-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500 focus:border-indigo-500 sm:text-sm"
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
      <div v-else-if="question.type === 'checkbox'">
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
            class="focus:ring-indigo-500 w-4 h-4 text-indigo-600 border-gray-300 rounded"
          />
          <label
            :for="option.uuid"
            class="ml-3 block text-sm font-medium text-gray-700"
          >
            {{ option.text }}
          </label>
        </div>
      </div>
      <div v-else-if="question.type === 'radio'">
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
            class="focus:ring-indigo-500 w-4 h-4 text-indigo-600 border-gray-300"
          />
          <label
            v-if="option.text"
            :for="option.uuid"
            class="ml-3 block text-sm font-medium text-gray-700"
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
          class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
        />
      </div>
      <div v-else-if="question.type === 'textarea'">
        <textarea
          :value="modelValue"
          @input="emit('update:modelValue', $event.target.value)"
          class="mt-1 focus:ring-indigo-500 focus:border-indigo-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md"
        />
      </div>
    </div>
  </fieldset>
  <hr class="mb-4" />
</template>

<script setup>
import { ref } from "vue";

const { question, index, modelValue } = defineProps({
  question: Object,
  index: Number,
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
</script>

<style scoped></style>
