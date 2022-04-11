// eslint-disable-next-line
import { UserLayout, BasicLayout, RouteView, BlankLayout, PageView } from '../layouts'
import { examList } from '../core/icons'

/*
  动态路由
    在侧边栏中显示
*/
export const asyncRouterMap = [

  {
    path: '/',
    name: 'index',
    component: BasicLayout,
    meta: { title: '在线考试系统' },
    redirect: '/list/exam-record-list',
    children: [ // 侧边栏子选项
      { // 考试卡片
        path: '/exam-card',
        name: 'exam-card',
        redirect: '/list/exam-card',
        component: PageView,
        hideChildrenInMenu: true,
        meta: { title: '考试卡片', keepAlive: true, icon: examList, permission: ['exam-card'] },
        children: [
          {
            path: '/list/exam-card',
            name: 'ExamCardList',
            component: () => import('../views/list/ExamCardList'),
            meta: { title: '考试卡片列表', keepAlive: true, permission: ['exam-card'] }
          }
        ]
      },
      // list
      { // 我的考试
        path: '/exam-record-list',
        name: 'exam-record-list',
        redirect: '/list/exam-record-list',
        component: PageView,
        hideChildrenInMenu: true,
        meta: { title: '我的考试', keepAlive: true, icon: 'user', permission: ['exam-record-list'] },
        children: [
          {
            path: '/list/exam-record-list',
            name: 'ExamRecordList',
            component: () => import('../views/list/ExamRecordList'),
            meta: { title: '我参与过的考试列表', keepAlive: true, permission: ['exam-record-list'] }
          }
        ]
      },
      /* { // 笔记本
        path: '/notebook',
        name: 'notebook',
        redirect: '/list/notebook',
        component: PageView,
        hideChildrenInMenu: true,
        meta: { title: '笔记本', keepAlive: true, icon: 'user', permission: ['notebook'] },
        children: [
          {
            path: '/list/notebook',
            name: 'ExamRecordList',
            component: () => import('../views/list/ExamRecordList'),
            meta: { title: '笔记本', keepAlive: true, permission: ['notebook'] }
          }
        ]
      }, */
      // account
      {
        path: '/account',
        component: RouteView,
        redirect: '/account/center',
        name: 'account',
        // 隐藏当前菜单，但是因为是需要的，所以不能删掉
        hidden: true,
        meta: { title: '个人页', icon: 'user', keepAlive: true, permission: ['user'] },
        children: [
          {
            path: '/account/settings',
            name: 'settings',
            component: () => import('../views/account/settings/Index'),
            meta: { title: '个人设置', hideHeader: true, permission: ['user'] },
            redirect: '/account/settings/base',
            hideChildrenInMenu: true,
            children: [
              {
                path: '/account/settings/base',
                name: 'BaseSettings',
                component: () => import('../views/account/settings/BaseSetting'),
                meta: { title: '基本设置', hidden: true, permission: ['user'] }
              }
              // {
              //   path: '/account/settings/custom',
              //   name: 'CustomSettings',
              //   component: () => import('../views/account/settings/Custom'),
              //   meta: { title: '个性化设置', hidden: true, keepAlive: true, permission: ['user'] }
              // }
            ]
          }
        ]
      }
    ]
  },
  {
    // 所有访问不到的路径最终都会落到404里
    path: '*', redirect: '/404', hidden: true
  }
]

/**
 * 基础路由，不在主菜单上展示，独立的路由
 * @type { *[] }
 */
export const constantRouterMap = [
  {
    path: '/user',
    component: UserLayout,
    redirect: '/user/login',
    hidden: true,
    children: [
      {
        path: 'login',
        name: 'login',
        component: () => import(/* webpackChunkName: "user" */ '../views/user/Login')
      },
      {
        path: 'register',
        name: 'register',
        component: () => import(/* webpackChunkName: "user" */ '../views/user/Register')
      },
      {
        path: 'register-result',
        name: 'registerResult',
        component: () => import(/* webpackChunkName: "user" */ '../views/user/RegisterResult')
      }
    ]
  },

  {
    path: '/test',
    component: BlankLayout,
    redirect: '/test/home',
    children: [
      {
        path: 'home',
        name: 'TestHome',
        component: () => import('../views/Home')
      },
      {
        path: 'note',
        name: 'NoteTest',
        component: () => import('@views/test/SummerNoteDemo')
      },
      {
        path: 'table',
        name: 'TableTest',
        component: () => import('@views/test/BootStrapTableDemo')
      }
    ]
  },

  {
    path: '/404',
    component: () => import(/* webpackChunkName: "fail" */ '../views/exception/404')
  },
  {
    path: '/exam/:id',
    component: () => import(/* webpackChunkName: "fail" */ '../views/list/ExamDetail')
  },
  {
    path: '/exam/record/:exam_id/:record_id',
    component: () => import(/* webpackChunkName: "fail" */ '../views/list/ExamRecordDetail')
  }
]
