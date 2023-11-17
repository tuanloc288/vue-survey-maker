/** @type {import('tailwindcss').Config} */
export default {
  content: ["./index.html", "./src/**/*.{vue,js,ts,jsx,tsx}"],
  theme: {
    extend: {
      keyframes: {
        "fade-in-down": {
          from: {
            transform: "translateY(-0.75rem)",
            opacity: 0,
          },
          to: {
            transform: "translateY(0)",
            opacity: 1,
          },
        },
        "from-top": {
          from: {
            transform: "translateY(-100%)",
            opacity: 0,
          },
          to: {
            transform: "translateY(0)",
            opacity: 1,
          },
        },
        "from-bottom": {
          from: {
            transform: "translateY(100%)",
            opacity: 0,
          },
          to: {
            transform: "translateY(0)",
            opacity: 1,
          },
        },
        "from-left": {
          from: {
            transform: "translateX(-100%)",
            opacity: 0,
          },
          to: {
            transform: "translateY(0)",
            opacity: 1,
          },
        },
        "from-right": {
          from: {
            transform: "translateX(100%)",
            opacity: 0,
          },
          to: {
            transform: "translateY(0)",
            opacity: 1,
          },
        },
      },
      animation: {
        "fade-in-down": "fade-in-down .2s ease-in-out both",
        "from-top": "from-top .5s ease-in-out both",
        "from-bottom": "from-bottom .5s ease-in-out both",
        "from-left": "from-left .5s ease-in-out both",
        "from-right": "from-right .5s ease-in-out both",
      },
    },
  },
  plugins: [require("@tailwindcss/forms")],
};
