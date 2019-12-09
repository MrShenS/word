<template>
    <div class="pluto-menu">
      <a-menu>
        <a-menu-item v-for="item in menu" :key="item.code" @click="GOTO(item)">
          <a-icon :type="item.icon" ></a-icon>
          {{ item.title }}
          </a-menu-item>
      </a-menu>
    </div>
</template>

<script>
export default {
  name: 'PlutoMenu',
  data: function () {
    return {
      menu: [
        { code: 'PROJECT_MANAGEMENT', title: '项目管理', icon: 'project' },
        { code: 'MEMBER_MANAGEMENT', title: '成员管理', icon: 'team' }
      ]
    }
  },
  methods: {
    GOTO (item) {
      console.log(item.code)
      this.$router.push({
        name: item.code
      })
    }
  }
}
</script>

<style lang="less" scoped>
.pluto-menu {
  text-align: left;
}
</style>
