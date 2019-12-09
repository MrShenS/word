<!--
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-08 17:02:21
 * @LastEditTime: 2019-08-10 11:32:14
 * @LastEditors: Please set LastEditors
 -->
<template>
    <div class="pluto-home">
      <div class="menu-block">
        <pluto-menu></pluto-menu>
      </div>
      <div class="content-block">
        <router-view></router-view>
      </div>
    </div>
</template>

<script>
import PlutoMenu from '@/components/PlutoMenu'
import { mapMutations } from 'vuex'
export default {
  name: 'Home',
  components: {
    PlutoMenu
  },
  methods: {
    ...mapMutations([
      'updateMenuItem'
    ]),
    changeNav () {
      this.updateMenuItem([{
        name: '任务2',
        key: 'Task2',
        icon: ''
      }, {
        name: '任务3',
        key: 'Task3',
        icon: ''
      }])
    }
  }
}
</script>

<style lang="less" scoped>
.pluto-home {
  height: 100%;
  display: flex;
  .menu-block {
    height: 100%;
    width: 20rem;
    background-color: #FFF;
  }
  .content-block {
    flex: 1;
    background-color: rgba(250, 252, 255);
  }
}
</style>
