// workflow similarly to redux toolkit with action, dispatch and state

import { createStore } from "vuex";
import axiosClient from "../axios";

// const tmpSurveys = [
//   {
//     id: 100,
//     title: "Test survey",
//     slug: "test-survey",
//     status: "draft",
//     image:
//       "https://images.unsplash.com/photo-1488590528505-98d2b5aba04b?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//     description:
//       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id arcu imperdiet, elementum risus at, feugiat leo. Mauris sed velit a libero porta semper. Vivamus eu sapien ex. Ut venenatis arcu nulla, a imperdiet lectus dignissim eu. Fusce sit amet purus ullamcorper ipsum porttitor posuere. Vivamus vulputate quis metus at sollicitudin. Vestibulum consequat pharetra gravida. Nulla sed orci facilisis, hendrerit ante ac, fringilla ligula. Integer vel lorem in velit fringilla finibus sed sed justo. Maecenas augue justo, rutrum a risus sit amet, fringilla luctus enim. Cras interdum venenatis tincidunt.",
//     created_at: "2023-11-08 13:00:00",
//     updated_at: "2023-11-08 13:00:00",
//     expired_at: "2023-11-22 13:00:00",
//     questions: [
//       {
//         id: 1,
//         type: "select",
//         question: "From which country are you?",
//         description: null,
//         data: {
//           options: [
//             { uuid: "1b1e692a-82ca-11ee-b962-0242ac120002", text: "Vietnam" },
//             { uuid: "2c5a0aa0-82ca-11ee-b962-0242ac120002", text: "Singapore" },
//             { uuid: "44e03acc-82ca-11ee-b962-0242ac120002", text: "India" },
//             { uuid: "49bd2adc-82ca-11ee-b962-0242ac120002", text: "Taiwan" },
//           ],
//         },
//       },
//       {
//         id: 2,
//         type: "checkbox",
//         question: "What programming language can you use?",
//         description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
//         data: {
//           options: [
//             { uuid: "a5bb5cd2-82ca-11ee-b962-0242ac120002", text: "Java" },
//             {
//               uuid: "b26df6e2-82ca-11ee-b962-0242ac120002",
//               text: "Javascript",
//             },
//             {
//               uuid: "bdbf6fc6-82ca-11ee-b962-0242ac120002",
//               text: "Typescript",
//             },
//             { uuid: "c0098d48-82ca-11ee-b962-0242ac120002", text: "PHP" },
//             { uuid: "d5b6518a-82ca-11ee-b962-0242ac120002", text: "C#" },
//           ],
//         },
//       },
//       {
//         id: 3,
//         type: "radio",
//         question: "What PHP framework you like the most?",
//         description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
//         data: {
//           options: [
//             { uuid: "30e1f69a-82cb-11ee-b962-0242ac120002", text: "Laravel" },
//             {
//               uuid: "30e1f9ec-82cb-11ee-b962-0242ac120002",
//               text: "Codeigniter",
//             },
//             { uuid: "30e1fe60-82cb-11ee-b962-0242ac120002", text: "Symfony" },
//             { uuid: "30e1ffaa-82cb-11ee-b962-0242ac120002", text: "Yii" },
//             { uuid: "30e200cc-82cb-11ee-b962-0242ac120002", text: "Zend" },
//             { uuid: "30e201ee-82cb-11ee-b962-0242ac120002", text: "Other" },
//           ],
//         },
//       },
//       {
//         id: 4,
//         type: "text",
//         question: "What's your favorite Youtube channel about tech?",
//         description: null,
//         data: {},
//       },
//       {
//         id: 5,
//         type: "textarea",
//         question: "What do you think about the development of Web3 in future?",
//         description: "Write your honest opinion...",
//         data: {},
//       },
//     ],
//   },
//   {
//     id: 101,
//     title: "Test survey 2",
//     slug: "test-survey-2",
//     status: "draft",
//     image:
//       "https://images.unsplash.com/photo-1519389950473-47ba0277781c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8dGVjaHxlbnwwfHwwfHx8MA%3D%3D",
//     description:
//       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent id arcu imperdiet, elementum risus at, feugiat leo. Mauris sed velit a libero porta semper. Vivamus eu sapien ex. Ut venenatis arcu nulla, a imperdiet lectus dignissim eu. Fusce sit amet purus ullamcorper ipsum porttitor posuere. Vivamus vulputate quis metus at sollicitudin. Vestibulum consequat pharetra gravida. Nulla sed orci facilisis, hendrerit ante ac, fringilla ligula. Integer vel lorem in velit fringilla finibus sed sed justo. Maecenas augue justo, rutrum a risus sit amet, fringilla luctus enim. Cras interdum venenatis tincidunt.",
//     created_at: "2023-11-08 13:05:00",
//     updated_at: "2023-11-08 13:05:00",
//     expired_at: "2023-11-22 13:05:00",
//     questions: [],
//   },
// ];

const store = createStore({
  state: {
    user: {
      data: {},
      token: sessionStorage.getItem("TOKEN"),
    },
    currentSurvey: {
      loading: false,
      data: {},
    },
    surveys: {
      loading: false,
      links: [],
      data: [],
    },
    questionTypes: ["text", "select", "radio", "checkbox", "textarea"],
    notification: {
      show: false,
      type: null,
      message: null,
    },
    dashboard: {
      loading: false,
      data: {},
    },
  },
  getters: {},
  actions: {
    getSurvey({ commit }, id) {
      commit("setCurrentSurveyLoading", true);
      return axiosClient
        .get(`survey/${id}`)
        .then((res) => {
          commit("setCurrentSurvey", res.data);
          console.log(res.data);
          commit("setCurrentSurveyLoading", false);
          return res;
        })
        .catch((err) => {
          commit("setCurrentSurveyLoading", false);
          throw err;
        });
    },
    saveSurvey({ commit }, survey) {
      delete survey.image_url;
      let response;
      if (survey.id) {
        response = axiosClient
          .put(`/survey/${survey.id}`, survey)
          .then((res) => {
            commit("setCurrentSurvey", res.data);
            return res;
          });
      } else {
        response = axiosClient.post("/survey", survey).then((res) => {
          commit("setCurrentSurvey", res.data);
          return res;
        });
      }

      return response;
    },
    deleteSurvey({}, id) {
      return axiosClient.delete(`/survey/${id}`);
    },
    getSurveys({ commit }, { url = null } = {}) {
      url = url || "/survey";
      commit("setSurveysLoading", true);
      return axiosClient.get(url).then((res) => {
        commit("setSurveysLoading", false);
        commit("setSurveys", res.data);
        return res;
      });
    },
    getSurveyBySlug({ commit }, slug) {
      commit("setCurrentSurveyLoading", true);
      return axiosClient
        .get(`/survey-by-slug/${slug}`)
        .then((res) => {
          commit("setCurrentSurvey", res.data);
          commit("setCurrentSurveyLoading", false);
          return res;
        })
        .catch((err) => {
          commit("setCurrentSurveyLoading", false);
          throw err;
        });
    },
    saveSurveyAnswer({ commit }, { surveyId, answers }) {
      return axiosClient.post(`/survey/${surveyId}/answer`, { answers });
    },
    getDashboardData({ commit }) {
      commit("dashboardLoading", true);
      return axiosClient
        .get("/dashboard")
        .then((res) => {
          commit("dashboardLoading", false);
          commit("setDashboardData", res.data);
          return res;
        })
        .catch((err) => {
          commit("dashboardLoading", false);
          return err;
        });
    },
    register({ commit }, user) {
      return axiosClient.post("/register", user).then(({ data }) => {
        commit("setUser", data.user);
        commit("setToken", data.token);
        return data;
      });
    },
    login({ commit }, user) {
      return axiosClient.post("/login", user).then(({ data }) => {
        commit("setUser", data.user);
        commit("setToken", data.token);
        return data;
      });
    },
    logout({ commit }) {
      return axiosClient.post("/logout").then((res) => {
        commit("logout");
        return res;
      });
    },
    getUser({ commit }) {
      return axiosClient.get("/user").then((res) => {
        commit("setUser", res.data);
      });
    },
  },
  mutations: {
    setCurrentSurvey: (state, survey) => {
      state.currentSurvey.data = survey.data;
    },
    setCurrentSurveyLoading: (state, loading) => {
      state.currentSurvey.loading = loading;
    },
    setSurveys: (state, surveys) => {
      state.surveys.data = surveys.data;
      state.surveys.links = surveys.meta.links;
    },
    setSurveysLoading: (state, loading) => {
      state.surveys.loading = loading;
    },
    logout: (state) => {
      state.user.data = {};
      state.user.token = null;
      sessionStorage.removeItem("TOKEN");
    },
    setUser: (state, user) => {
      state.user.data = user;
    },
    setToken: (state, token) => {
      state.user.token = token;
      sessionStorage.setItem("TOKEN", token);
    },
    notify: (state, { message, type }) => {
      state.notification.show = true;
      state.notification.type = type;
      state.notification.message = message;
      setTimeout(() => {
        state.notification.show = false;
      }, 5000);
    },
    closeNotification: (state) => {
      state.notification.show = false;
      state.notification.type = null;
      state.notification.message = null;
    },
    dashboardLoading: (state, loading) => {
      state.dashboard.loading = loading;
    },
    setDashboardData: (state, data) => {
      state.dashboard.data = data;
    },
  },
  modules: {},
});

export default store;
