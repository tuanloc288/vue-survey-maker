<template>
  <Line :options="chartOptions" :data="chartData" />
</template>

<script setup>
import { Line } from "vue-chartjs";
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
} from "chart.js";

const props = defineProps({
  data: Array,
});

ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend
);

const months = [
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
];

const chartData = {
  labels: months,
  datasets: [
    {
      label: "# of Surveys",
      borderColor: "#7579e7",
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
        beginAtZero: true,
      },
    },
  },
};
</script>
