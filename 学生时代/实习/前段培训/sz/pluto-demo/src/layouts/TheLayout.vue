<!--
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-08 17:02:21
 * @LastEditTime: 2019-08-09 11:15:04
 * @LastEditors: Please set LastEditors
 -->
<template>
    <a-layout class="the-layout">
        <the-header>
        </the-header>
        <a-layout-content>
           <slot></slot>
        </a-layout-content>
    </a-layout>
</template>

<script>
import TheHeader from './TheHeader'

export default {
  components: {
    TheHeader
  },
  name: 'TheLayout'
}
</script>

<style lang="less" scoped>
.the-layout {
  display: flex;
  .ant-layout-content {
    flex: 1;
  }
}
</style>
