<!--
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-08 17:02:21
 * @LastEditTime: 2019-08-09 14:09:11
 * @LastEditors: Please set LastEditors
 -->
<template>
    <a-layout-header class="the-header">
        <img src="../image/logo-1.png" width="120rem" height="40rem" class="photo">
          <div class="pluto-menu">
          <a-menu id="menu">
                <a-menu-item v-for="item in menu" :key="item.code" @click="GOTO(item)">
                  <a-icon :type="item.icon" ></a-icon>
                  {{ item.title }}
                </a-menu-item>
        </a-menu>
        </div>
    </a-layout-header>
</template>

<script>
export default {
  name: 'TheHeader',
  data: function () {
    return {
      menu: [
        { code: 'PROJECT_MANAGEMENT', title: '进行中', icon: 'project' },
        { code: 'MEMBER_MANAGEMENT', title: '已完成', icon: 'team' }
      ]
    }
  }
}
</script>

<style lang="less" scoped>
.the-header {
  height: 5.4rem;
  line-height: 5.4rem;
  background-color: rgb(142, 142, 161)
}
.photo{
  float: left;
  margin: 1rem -5rem 0 0 ;
}
#menu{
  display: flex;
  flex-direction: row;
  margin: 2rem 0rem 0 30rem;
  background-color: rgb(142, 142, 161)
}
</style>
