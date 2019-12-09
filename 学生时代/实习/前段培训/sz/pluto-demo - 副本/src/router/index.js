/*
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-08 17:02:21
 * @LastEditTime: 2019-08-10 20:25:01
 * @LastEditors: Please set LastEditors
 */
import Vue from 'vue'
import Router from 'vue-router'
import PageView from '../layouts/PageView'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'index',
      component: PageView,
      children: [
        {
          path: '/',
          name: 'home',
          component: () => import('@/pages/Home'),
          children: [
            {
              path: '/home/projectManagement',
              name: 'PROJECT_MANAGEMENT',
              component: () => import('@/pages/project-Management/projectManagement')
            },
            {
              path: '/home/emp',
              name: 'MEMBER_MANAGEMENT',
              component: () => import('@/pages/emp/emp')
            },
            {
              path: '/home/project-index',
              name: 'project-index',
              component: () => import('@/pages/project-Management/project-index')
            },
            {
              path: '/',
              name: 'project-index',
              component: () => import('@/pages/project-Management/project-index')
            }
          ]
        }
      ]
    }
  ]
})
