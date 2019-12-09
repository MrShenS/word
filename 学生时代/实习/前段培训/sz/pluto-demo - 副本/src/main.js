/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-08 17:02:21
 * @LastEditTime: 2019-08-09 17:43:56
 * @LastEditors: Please set LastEditors
 */
// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import Antd from 'ant-design-vue'
import 'ant-design-vue/dist/antd.css'
import VueI18n from 'vue-i18n'
import App from './App'
import router from './router'
import store from './store/index'
import zh from './lang/zh'
import en from './lang/en'
import { i18n, registerLanguage, initI18N, setI18nLanguage } from 'd-portal-i18n'
import { DPortalHttp as http } from 'd-portal-network-lib'
import { domain } from './config'
import { EventBus as eventBus } from './event-bus'
import { DPortalLocalStorage, DPortalSessionStorage } from 'd-portal-storage'
// 加载plugins
import('./plugins/plugin')

Vue.config.productionTip = false
Vue.use(VueI18n)
Vue.use(Antd)

registerLanguage('zh', {
  namespace: 'app',
  value: zh
})
registerLanguage('en', {
  namespace: 'app',
  value: en
})
// 调用语言包修改函数修改语言
const defaultLang = DPortalSessionStorage.getItem('locale') || 'zh'
setI18nLanguage(defaultLang)

http.setHttpConfig({
  domain: domain,
  platform: 'WEB',
  version: 'v1',
  locale: defaultLang,
  token: DPortalLocalStorage.getItem('token')
})
http.setGlobalEventBus(eventBus)
http.initInterceptors()

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  i18n,
  store,
  components: { App },
  template: '<App/>',
  created () {
    initI18N(this.$i18n)
    eventBus.$on('changeLanguage', (locale) => {
      DPortalSessionStorage.setItem('locale', locale)
      window.location.reload()
    })
  }
})
