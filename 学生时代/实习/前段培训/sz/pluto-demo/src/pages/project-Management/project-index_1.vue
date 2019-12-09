<template>
<div class="pluto-menu">
    <a-menu>
<a-menu-item v-for="item in menu" :key="item.code">
<a-icon :type="item.icon"></a-icon>
{{ item.title }}
</a-menu-item>
</a-menu>
<div id="container">

<div class="containerTop">
<section class="top" v-for="(list, i) in lists" :key="list.id">
     <header class="t_header">
         <h3>{{list.id}}:上海三菱智梯项目</h3><p @click="set(i)"></p>
    </header>
     <section class="t_sec">
         <div id="ts1">本周任务数</div><p v-text="list.msg1">   </p>
         <div id="ts2">本周工时</div><p v-text="list.msg2"> </p>
         <div id="ts3">工时完成情况</div><p v-text="list.msg3"> </p>
     </section>
     <footer class="t_foo">
         <div>总任务数</div><p v-text="list.msg4">  </p>
         <div>总工时</div><p  v-text="list.msg5">   </p>
         <div>项目人天费用</div><p v-text="list.msg6">  </p>
    </footer>
</section>
</div>
<div class="containerBottom">
<section class="top" v-for="(list, i) in lists" :key="list.id">
     <header class="t_header">
         <h3>{{list.id}}:上海三菱智梯项目</h3><p @click="set(i)"></p>
    </header>
     <footer class="t_foo">
         <div>总任务数</div><p v-text="list.msg4">  </p>
         <div>总工时</div><p  v-text="list.msg5">   </p>
         <div>项目人天费用</div><p v-text="list.msg6">  </p>
    </footer>
</section>

</div>
</div>
</div>
</template>

<style>
.item-ul{
display: flex;
}

.item-ul li{
margin-left: 12px;
margin-right: 221px;
}

.item-ul li div{
border: 12px;
}

#container{
    display: flex;
    flex-direction: column
}
.containerTop{
    display: flex;
    flex-direction: row;
}
.containerBottom{
    display: flex;
    flex-direction: row;
    margin: 10rem  0 0 0;
}
.top{
    display: flex;
    flex-direction: column;
    margin: 5rem 3rem 0 3rem;
    }
.t_header{
    display: flex;
    flex-direction: row
}
.t_sec{
    display: flex;
    flex-direction: row
}
.t_foo{
    display: flex;
    flex-direction: row
}

</style>

<script>
export default {
  data () {
    return {
      info: '',
      lists: [
        {id: 1, 'msg1': '1000', 'msg2': '111', 'msg3': '30%', 'msg4': '2000', 'msg5': '123', 'msg6': '1100'},
        {id: 2, 'msg1': '1000', 'msg2': '111', 'msg3': '30%', 'msg4': '2000', 'msg5': '123', 'msg6': '1100'},
        {id: 3, 'msg1': '1000', 'msg2': '111', 'msg3': '30%', 'msg4': '2000', 'msg5': '123', 'msg6': '1100'}
      ]
    }
  },
  methods: {
    set (id) {
    }
  }
}
</script>
