// workflow similarly to redux toolkit with action, dispatch and state

import { createStore } from "vuex";
import axiosClient from "../axios";

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
    model: {
      open: false,
      data: {},
      individual: false,
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
    setModelData: (state, data) => {
      state.model.open = data.open;
      state.model.data = data.data;
      state.model.individual = data.individual;
    },
  },
  modules: {},
});

export default store;
