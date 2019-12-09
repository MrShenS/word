<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
import { EventBus as eventBus } from './event-bus'

export default {
  name: 'App',
  components: {
  },
  computed: {
  },
  data: function () {
    return {
    }
  },
  created: function () {
    eventBus.$on('onUploadProgress', (progress) => {
    })
    eventBus.$on('showErrorMsg', (resultObj) => {
    })
    eventBus.$on('showSuccessMsg', ({title, content}) => {
    })
  },
  methods: {
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  display: flex;
  height: 100%;
}
</style>
