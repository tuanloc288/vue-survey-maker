<template>
  <Bar :options="chartOptions" :data="chartData" />
</template>

<script setup>
import { Bar } from "vue-chartjs";
import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale,
} from "chart.js";

const props = defineProps({
  data: Array,
  month: Number,
  year: Number,
});

ChartJS.register(
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale
);

function daysGenerator() {
  const daysInMonth = [];
  const numDays = new Date(props.year, props.month, 0).getDate();

  for (let day = 1; day <= numDays; day++) {
    daysInMonth.push(day);
  }
  return daysInMonth;
}

function colorsGenerator() {
  const daysInMonth = new Date(props.year, props.month, 0).getDate();

  const colors = [];
  while (colors.length < parseInt(daysInMonth)) {
    const color = "#" + Math.floor(Math.random() * 16777215).toString(16); // generates a random hexadecimal color
    if (!colors.includes(color)) {
      colors.push(color);
    }
  }
  return colors;
}

const chartData = {
  labels: daysGenerator(),
  datasets: [
    {
      label: "# of Surveys",
      backgroundColor: colorsGenerator(),
      data: props.data,
    },
  ],
};

const chartOptions = {
  responsive: true,
  plugins: {
    legend: {
      display: false,
    },
  },
  scales: {
    x: {
      ticks: {
        font: {
          size: 13,
        },
        color: "#7579e7",
      },
    },
    y: {
      ticks: {
        font: {
          size: 13,
        },
        color: "#7579e7",
        stepSize: 1,
      },
      beginAtZero: true,
    },
  },
};
</script>
