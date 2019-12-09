<!--
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-08 17:49:28
 * @LastEditTime: 2019-08-10 18:58:07
 * @LastEditors: Please set LastEditors
 -->
<template>
<div class="pluto-menu">
<a-menu>
    <a-menu-item v-for="item in menu" :key="item.code">
        <a-icon :type ="item.icon"></a-icon>
        {{ item.title }}
    </a-menu-item>
</a-menu>
<div class="all">
  <div class="left">
    <header class="header">
        <a-dropdown-button @click="handleButtonClick" class="dropdown">
            全部任务
            <a-menu slot="overlay" @click="handleMenuClick">
              <a-menu-item key="1"><a-icon type="user" />今日任务</a-menu-item>
              <a-menu-item key="2"><a-icon type="user" />过期任务</a-menu-item>
              <a-menu-item key="3"><a-icon type="user" />我的任务</a-menu-item>
            </a-menu>
          </a-dropdown-button>
    </header>
  <div class="body">
     <section class="view" v-for="list in lists" :key="list.id">
        <div class="task">
         <div class="task_top" id="list.id">
         <p v-text="list.msg" class="title"></p><img src="../../../static/clock.png" width="20rem" height="20rem" class="clock">4h
         </div>
          <div class="task_body">
              <div  v-for="task in tasks" :key="task.id" >
                <div v-text="task.msg" v-if="task.id==list.id" class="pro"></div>
              </div>
          </div>
         </div>
     </section>
     <footer class="foo"></footer>
  </div>
  </div>
  <div class="right">
    <div class="card">
       <a-card title="Card Title">
        <a href="#" slot="extra">公时排行榜</a>
        <div style="width: 130px">
          <a-progress :percent="30" size="small" />
          <a-progress :percent="50" size="small" status="active" />
          <a-progress :percent="70" size="small" status="exception" />
          <a-progress :percent="100" size="small" />
        </div>
      </a-card>
    </div>
      <div class="card">
      <a-card title="Card Title">
        <a href="#" slot="extra">七月度目标</a>
        <p>工时干满一千小时</p>
        <p>存活率达到百分之三十</p>
      </a-card>
      </div>
      <div class="card">
      <a-card title="Card Title">
        <a href="#" slot="extra">项目公告</a>
        <p>八点上班</p>
        <p>十七点下班</p>
        <p>一周五天</p>
      </a-card>
      </div>
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

.header{
  flex: 10%
}

.dropdown{
  float: left;
  margin:  3rem 0 0 10rem;
}

.body{
    display: flex;
    margin: 3rem 0 0 7rem;
    flex: 80%;
}

.foo{
  flex: 1;
}

.view{
    margin: 0 0.5rem 0 0.5rem;
    /* border: 1px solid rgba(75, 67, 67, 0.384); */
    border-radius: 8%;
    width: 18rem;
    height: 47rem;
    box-shadow: 0 2px 4px 0 rgba(0,0,0,0.2),
    0 20px 40px 0 rgba(0, 0, 0, 0.1);
}

.right{
  display: flex;
  flex-direction: column;
  margin: 1.8rem 0 0 0rem
}

.card{
  background-color: rgb(217, 228, 235);
  box-shadow: 0 2px 4px 0 rgba(0,0,0,0.2),
  0 20px 40px 0 rgba(0, 0, 0, 0.1);
  margin: 7rem 0 0 0;
  height: 8rem;
  width: 13rem;
  border: 2rem;
  border-radius: 10%
}

.task_top{
    display: flex;
    flex-direction: row
}

.item-ul li div{
border: 12px;
}

.clock{
    margin: 0 0 0 3rem;
}

.pro{
    background-color: rgba(132, 174, 223, 0.911);
    border: 3rem;
    border-radius: 10%;
    margin: 0.6rem 0 0 0;
    height: 4rem;
}

.title{
  margin: 0 0rem 0 4rem;
  font-size: 2rem,
}

.all{
  display: flex;
  flex-direction: row
}

.task_body{
  margin: 3rem 0 0 0
}
.left{
  display: flex;
  flex-direction: column
}
</style>
<script>
export default {
  data () {
    return {
      info: '',
      lists: [
        {id: 1, 'msg': '未认领'},
        {id: 2, 'msg': '以认领'},
        {id: 3, 'msg': '待验收'},
        {id: 4, 'msg': '已完成'}
      ],
      tasks: [
        {id: 1, 'msg': '子系统一'},
        {id: 2, 'msg': '任务'},
        {id: 3, 'msg': '任务'},
        {id: 4, 'msg': '任务'},
        {id: 4, 'msg': '任务'},
        {id: 3, 'msg': '任务'},
        {id: 2, 'msg': '任务'},
        {id: 2, 'msg': '任务'},
        {id: 2, 'msg': '任务'},
        {id: 3, 'msg': '任务'},
        {id: 1, 'msg': '任务'},
        {id: 1, 'msg': '任务'},
        {id: 3, 'msg': '任务'},
        {id: 4, 'msg': '任务'}
      ]
    }
  },
  methods: {
    set (id) {
    }
  }
}
</script>
