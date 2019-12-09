/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-08 17:02:22
 * @LastEditTime: 2019-08-10 11:28:37
 * @LastEditors: Please set LastEditors
 */
import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    project: {
      name: '前端大作业项目',
      icon: 'icon'
    },
    headerNav: [{
      name: '任务1',
      key: 'Task1',
      icon: ''
    }]
  },
  mutations: {
    updateMenuItem (state, nav) {
      state.headerNav = nav
    }
  },
  modules: {
  }
})
