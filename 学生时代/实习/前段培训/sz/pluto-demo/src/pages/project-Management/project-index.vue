<!--
 * @Description: In User Settings Edit
 * @Author: your name
 * @Date: 2019-08-08 21:07:36
 * @LastEditTime: 2019-08-10 10:56:28
 * @LastEditors: Please set LastEditors
 -->
<template>
<div class="pluto-menu">
<a-menu>
<a-menu-item v-for="item in menu" :key="item.code">
<a-icon :type="item.icon"></a-icon>
{{ item.title }}
</a-menu-item>
</a-menu>

<div id="container">
<div>
        <svg t="1565405463531" class="icon" id="addLogo" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="1129" width="32" height="32"><path d="M514 912c-219.9 0-398.8-178.9-398.8-398.8S294.1 114.4 514 114.4s398.8 178.9 398.8 398.8S733.9 912 514 912z m0-701.5c-166.9 0-302.7 135.8-302.7 302.7 0 166.9 135.8 302.7 302.7 302.7s302.7-135.8 302.7-302.7c0-166.9-135.8-302.7-302.7-302.7z" fill="#BDD2EF" p-id="1130"></path><path d="M570.1 569.3h126.3c30.9 0 56.1-25.2 56.1-56.1 0-30.9-25.2-56.1-56.1-56.1H570.1V330.8c0-30.9-25.2-56.1-56.1-56.1-30.9 0-56.1 25.2-56.1 56.1v126.3H331.6c-30.9 0-56.1 25.2-56.1 56.1 0 30.9 25.2 56.1 56.1 56.1h126.3v126.3c0 30.9 25.2 56.1 56.1 56.1s56.1-25.2 56.1-56.1V569.3z" fill="#2867CE" p-id="1131"></path></svg>
        <p class="addProject"> 添加项目</p>
</div>
<div class="containerTop">
<section class="top" v-for="(list) in lists" :key="list.id">
     <header class="t_header">
         <h3><a href="/#/home/projectManagement">{{list.id}}:上海三菱智梯项目</a> </h3>
              <p> <svg t="1565357922208" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2185" width="32" height="32"><path d="M478.4128 857.088l-48.5376-108.9536-31.1296-12.6976-104.0384 46.6944-71.2704-70.8608 40.96-109.1584-13.312-31.5392-104.448-43.008-0.2048-100.5568 104.0384-45.6704 13.1072-31.744-41.3696-106.7008L292.864 171.8272l104.2432 43.8272 31.3344-13.1072 47.9232-106.9056 100.7616-0.2048 40.7552 107.1104 30.9248 12.6976 111.616-44.032 71.4752 71.2704-48.7424 106.9056 12.6976 30.5152 112.0256 45.056 0.2048 101.376-111.616 43.008-12.4928 30.3104 49.3568 108.9536-71.2704 71.68-111.8208-45.8752-30.72 12.6976-40.1408 109.568-100.9664 0.4096z m-80.4864-170.8032l65.536 27.0336 44.032 98.7136 40.3456-0.2048 36.0448-98.5088 65.9456-27.4432 101.1712 41.3696 28.2624-28.2624-44.4416-98.304 27.2384-66.3552 101.1712-39.3216-0.2048-39.936-101.376-40.96-27.4432-65.9456 43.8272-96.256-28.4672-28.2624-100.9664 39.936-65.7408-27.0336-36.6592-96.0512-40.5504 0.2048-43.4176 96.6656-65.3312 27.4432-93.5936-39.3216-28.672 28.8768 37.2736 96.0512-26.624 65.3312-93.7984 41.1648 0.2048 40.7552 93.7984 38.5024 27.2384 65.1264-36.864 98.5088 28.672 28.672 93.3888-42.1888z" fill="#1296db" p-id="2186"></path><path d="M527.36 402.432c40.7552 0 73.728 32.9728 73.728 73.728s-32.9728 73.728-73.728 73.728-73.728-32.9728-73.728-73.728 32.9728-73.728 73.728-73.728m0-45.056c-65.536 0-118.784 53.248-118.784 118.784s53.248 118.784 118.784 118.784 118.784-53.248 118.784-118.784-53.248-118.784-118.784-118.784z" fill="#1296db" p-id="2187"></path></svg>      </p>
    </header>
     <section class="t_sec">
         <div id="ts1"  class="one"><p>本周任务数</p><p class="proInfo" v-text="list.msg1">   </p> </div>
         <div id="ts2"  class="one"><p>本周工时</p> <p class="proInfo" v-text="list.msg2"> </p></div>
         <div id="ts3"  class="one"><p>工时完成情况</p> <p class="proInfo" v-text="list.msg3"> </p> </div>
     </section>
     <footer class="t_foo">
         <div class="one"><p>总任务数</p><p class="proInfo" v-text="list.msg4">  </p></div>
         <div class="one"><p>总工时</p> <p class="proInfo" v-text="list.msg5">   </p></div>
         <div class="one"><p>项目人天费用 </p> <p class="proInfo" v-text="list.msg6">  </p></div>
    </footer>
</section>
</div>
<div class="containerBottom">
<section class="bottom" v-for="(list, i) in lists" :key="list.id">
     <header class="t_header">
         <h3>{{list.id}}:上海三菱智梯项目</h3><p @click="GOTO(i)">
             <svg t="1565357922208" class="icon" viewBox="0 0 1024 1024" version="1.1" xmlns="http://www.w3.org/2000/svg" p-id="2185" width="32" height="32"><path d="M478.4128 857.088l-48.5376-108.9536-31.1296-12.6976-104.0384 46.6944-71.2704-70.8608 40.96-109.1584-13.312-31.5392-104.448-43.008-0.2048-100.5568 104.0384-45.6704 13.1072-31.744-41.3696-106.7008L292.864 171.8272l104.2432 43.8272 31.3344-13.1072 47.9232-106.9056 100.7616-0.2048 40.7552 107.1104 30.9248 12.6976 111.616-44.032 71.4752 71.2704-48.7424 106.9056 12.6976 30.5152 112.0256 45.056 0.2048 101.376-111.616 43.008-12.4928 30.3104 49.3568 108.9536-71.2704 71.68-111.8208-45.8752-30.72 12.6976-40.1408 109.568-100.9664 0.4096z m-80.4864-170.8032l65.536 27.0336 44.032 98.7136 40.3456-0.2048 36.0448-98.5088 65.9456-27.4432 101.1712 41.3696 28.2624-28.2624-44.4416-98.304 27.2384-66.3552 101.1712-39.3216-0.2048-39.936-101.376-40.96-27.4432-65.9456 43.8272-96.256-28.4672-28.2624-100.9664 39.936-65.7408-27.0336-36.6592-96.0512-40.5504 0.2048-43.4176 96.6656-65.3312 27.4432-93.5936-39.3216-28.672 28.8768 37.2736 96.0512-26.624 65.3312-93.7984 41.1648 0.2048 40.7552 93.7984 38.5024 27.2384 65.1264-36.864 98.5088 28.672 28.672 93.3888-42.1888z" fill="#1296db" p-id="2186"></path><path d="M527.36 402.432c40.7552 0 73.728 32.9728 73.728 73.728s-32.9728 73.728-73.728 73.728-73.728-32.9728-73.728-73.728 32.9728-73.728 73.728-73.728m0-45.056c-65.536 0-118.784 53.248-118.784 118.784s53.248 118.784 118.784 118.784 118.784-53.248 118.784-118.784-53.248-118.784-118.784-118.784z" fill="#1296db" p-id="2187"></path></svg>
         </p>
    </header>
     <footer class="t_foo">
          <div class="one"><p> 总任务数 </p><p class="proInfo" v-text="list.msg4">  </p></div>
         <div class="one"> <p>总工时</p> <p class="proInfo" v-text="list.msg5">   </p></div>
         <div class="one"><p>项目人天费用 </p> <p class="proInfo" v-text="list.msg6">  </p></div>
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

.top a{
    color: black;
    font-weight: 600;
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
    margin: 5rem  0 0 0;
}

.top{
    display: flex;
    flex-direction: column;
    margin: 3rem 3rem 0 3rem;
    border-radius: 10%
    }

.top .t_foo{
    margin: -2rem 0 0 0;
}

.bottom{
    display: flex;
    flex-direction: column;
    margin: 5rem 3rem 0 3rem;
    border-radius: 10%;
    height: 15rem;
    width: 30rem;
    box-shadow: 0 2px 4px 0 rgba(0,0,0,0.2),
    0 20px 40px 0 rgba(0, 0, 0, 0.1);
}

.bottom h3{
    color: black;
    font-weight: 600;
}
.t_header{
    display: flex;
    flex-direction: row
}
.one{
    margin: 2rem 0 0 2rem;
}
.t_sec{
    display: flex;
    flex-direction: row
}
.t_foo{
    display: flex;
    flex-direction: row
}
.top{
        height: 22rem;
        width: 30rem;
         box-shadow: 0 2px 4px 0 rgba(0,0,0,0.2),
        0 20px 40px 0 rgba(0, 0, 0, 0.1);
}

.icon{
 margin: 0 0 0 8rem
}

h3{
    font-size: 2rem;
    color: rgb(228, 18, 18);
}

.proInfo{
    font-weight: 900;
    font-size: 2rem;
}

.addProject{
    float: left;
    margin: 2rem 0 0 0rem
}

#addLogo{
    margin: 1.5rem 0 0 3rem ;
    float: left;
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
    GOTO (item) {
      this.$router.push({
        name: 'PROJECT_MANAGEMENT'
      })
    }
  }
}
</script>
