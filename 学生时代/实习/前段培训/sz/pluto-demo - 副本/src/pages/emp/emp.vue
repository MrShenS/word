<!--
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-10 19:56:02
 * @LastEditTime: 2019-08-10 21:07:37
 * @LastEditors: Please set LastEditors
 -->
<template>
<div class="container">
<ul>
    <li class="empInfoHeader">
      <div class="account">账号</div>
      <div class="name">姓名</div>
      <div class="e-mail">邮箱</div>
      <div class="role">角色</div>
      <div class="worktime">工时系数</div>
      <div class="startdate">加入项目时间</div>
      <div class="enddate">撤出时间</div>
      <div class="operation">操作</div>
    </li>
    <li  class="empInfoBody"  v-for="list in lists" :key="list.id">
      <div v-text="list.msg1"></div>
      <div v-text="list.msg2"></div>
      <div v-text="list.msg3"></div>
      <div v-text="list.msg4"></div>
      <div v-text="list.msg5"></div>
      <div v-text="list.msg6"></div>
      <div v-text="list.msg7"></div>
      <div>编辑|删除</div>
    </li>
</ul>
</div>
</template>
<script>
export default {
  data () {
    return {
      info: '',
      lists: [
        {id: 1, 'msg1': '10023', 'msg2': '申震', 'msg3': 'xxxx.definesys.com', 'msg4': '小白实习生', 'msg5': '1.9', 'msg6': '2019-7-22', 'msg7': '2020-02-22'},
        {id: 2, 'msg1': '10023', 'msg2': '申震', 'msg3': 'xxxx.definesys.com', 'msg4': '小白实习生', 'msg5': '1.9', 'msg6': '2019-7-22', 'msg7': '2020-02-22'},
        {id: 3, 'msg1': '10023', 'msg2': '申震', 'msg3': 'xxxx.definesys.com', 'msg4': '小白实习生', 'msg5': '1.9', 'msg6': '2019-7-22', 'msg7': '2020-02-22'},
        {id: 4, 'msg1': '10023', 'msg2': '申震', 'msg3': 'xxxx.definesys.com', 'msg4': '小白实习生', 'msg5': '1.9', 'msg6': '2019-7-22', 'msg7': '2020-02-22'}
      ]
    }
  }
}
</script>
<style>

.empInfoBody{
  display: inline-flex;
  border: 2px solid rgba(75, 67, 67, 0.384);
}

.empInfoHeader{
  display: inline-flex;
   background-color:  rgb(213, 213, 228);
   border: 2px solid rgba(75, 67, 67, 0.384);
   height: 4rem;
}

.empInfoHeader div{
   font-size: 20px;
   border: 1px;
}

.empInfoBody div{
   margin: 0 3rem 0 3rem;
   font-size: 20px;
}

.name{
     margin: 0 0 0 6rem
}

.account{
     margin: 0 0rem 0 4rem
}

.e-mail{
     margin: 0 0rem 0 10rem
}

.role{
     margin: 0 0rem 0 15rem
}

.worktime{
    margin: 0 0rem 0 8rem
}

.startdate{
    margin: 0 0rem 0 3rem
}

.enddate{
    margin: 0 6rem 0 5rem
}


.container{
   margin: 4rem 0 0 0;
   width: 90%;
}

ul{
    display: flex;
    flex-direction: column
}

</style>
