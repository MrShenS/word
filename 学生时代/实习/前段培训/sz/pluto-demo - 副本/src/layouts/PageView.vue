<!--
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-08 17:02:21
 * @LastEditTime: 2019-08-09 11:05:51
 * @LastEditors: Please set LastEditors
 -->
<template>
    <the-layout>
      <router-view></router-view>
    </the-layout>
</template>

<script>
import TheLayout from './TheLayout'

export default {
  components: {
    TheLayout
  },
  name: 'PageView'
}
</script>

<style lang="less" scoped>

</style>
