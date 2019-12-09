Vue.directive('focus',{
    inserted:function (el) {
        el.focus();
    },
})
Vue.directive('onblur',{
    inserted:function (el) {
        el.onblur;
    }
})
Vue.filter("pad",function (str) {
    var s = str.toString().padStart(2, ' ');
    return s;
})
var vm = new Vue({
    el: '#todoapp',
    data: {
        re:"",
        triangle:true,
        length:0,
        number:0,
        count:1,
        id:4,
        work:'',
        lists: [

        ],// 展示数ju
        completedlist:[],// 保存状态是active或者 completed数组对象
        activelist:[],// 保存状态是active或者 completed数组对象
        lis:[],// 中转站
        lit:[
            {id:1,"work":"111","static":"active"},
            {id:2,"work":"222","static":"active"},
            {id:3,"work":"333","static":"active"},
        ],// 保存原lists数ju
    },
    mounted(){
        this.lists = this.lit;
        this.length = this.lists.length;
        this.number = this.lists.length;

    },

    methods: {
        Add(){
            if (this.work.length != 0){
                this.lists.unshift({id:this.id,work:this.work,static:"active"})
                this.lit = this.lists;
                this.id++;
                this.work="";
                this.GetListLength();
                this.GetNumberLeft();
                this.TriangleShow();
                this.number = this.lists.length;
                this.GetNumberLeft();
            }else {
                return false;
            }
        },
        Del(id){
            console.log(id)
            this.lists.splice(id,1);
            this.lit = this.lists;
            this.GetListLength();
            this.TriangleShow();
            this.GetNumberLeft();
        },
        Show(id){
            $().ready(function () {
                var li = $("ul li").eq(id)
                li.find("img").css("display","block");// 图片显示
                li.find("i").css("opacity",1); // 透明度还原
                li.find("div").addClass("on")
            })
            this.lists[id].static="completed";
            this.GetNumberLeft();
            this.ControlTriangle();
        },
        MovePic(id){
            $().ready(function () {
                var li = $("ul li").eq(id)
                li.find("img").css("display","none");// 图片不显示
                li.find("i").css("opacity",0.3);
                li.find("div").toggleClass("on")
            })
            this.lists[id].static="active";
            this.lit = this.lists;
            this.GetNumberLeft();
            this.ControlTriangle();
        },
        CheckAll(){
            this.count++;
            this.lists = this.lit;
            var count = this.count
            $().ready(function () {
                $(".header-content .toggle").toggleClass("opacity");
            })
            if (count%2 == 0){
                // 全选
                $().ready(function () {
                    var li = $("ul li")
                    li.find("img").css("display","block");// 图片显示
                    li.find("i").css("opacity",1); // 透明度还原
                    li.find("div").addClass("on")//
                });
                for(var i = 0;i<this.lists.length;i++){
                    this.lists[i].static = this.static;
                }
                this.GetListLength()
                this.number = 0;
            }else {
                // 全不选
                var li = $("ul li")
                li.find("img").css("display","none");// 图片不显示
                li.find("i").css("opacity",0.3);
                li.find("div").removeClass("on");
                for(var i = 0;i<this.lists.length;i++){
                    this.lists[i].static  = "active";
                }
                this.GetListLength();
                this.number = this.lists.length;
            }
        },
        GetListLength(){
            this.length= this.lists.length;
        },
        TriangleShow(){
            if (this.lists.length !=0 ){

                this.triangle=true;
            }else {

                this.triangle=false;
            }
        },// 动态更新 ❯ 的隐藏
        GetNumberLeft(){
            var k = 0
            for(var i = 0;i<this.lists.length;i++){
                if (this.lists[i].static=="active"){
                    k++;
                }
            }
            this.number=k;  
        },
        ControlTriangle(){// 通过按钮实现改变 <
            var j = 0
            for(var i = 0;i<this.lists.length;i++){
                if (this.lists[i].static=="completed"){
                    j++;
                }
            }
            if ((j) == this.lists.length){
                this.count++;
                $(".header-content .toggle").removeClass("opacity");
            }
            else {
                $(".header-content .toggle").addClass("opacity");
            }
        },
        ShowActive(){
            this.lists = this.lit;
            this.activelist=[];
            for(var i = 0;i<this.lists.length;i++){
                if (this.lists[i].static=="active"){
                    this.activelist.push(this.lists[i])
                }
            }

            this.lists = this.activelist;
            this.GetListLength();
        },
        ShowComplete(){
            this.lists = this.lit;
            this.completedlist=[];
            for(var i = 0;i<this.lists.length;i++){
                if (this.lists[i].static=="completed"){
                    this.activelist.push(this.lists[i])
                }
            }

            this.lists = this.completedlist;
            this.GetListLength();
            // this.length = 1
        },
        ShowAll(){

        },
        postComment(){//发表评论
            if (this.content==''||this.user==''){

            }else {
                // 从localStorage中 获取所有的评论
                var list = JSON.parse(localStorage.getItem('cmts')||'[]')
                list.unshift(this.lists)
                // 重新保存最新的 评论数ju
                localStorage.setItem("cmts",JSON.stringify(list))

                this.user = this.content = ''
                this.$emit("func") // 调用父组件的
            }

        },
        ClearCompleted(){
            var list=[]
            for(var i=0;i<this.lists.length;i++){
                if (this.lists[i].static == "active"){
                    list.push(this.lists[i]);
                }
            }
            this.lists = list;
            this.GetListLength();
            console.log(list)
        },
        ReWrite(id){
            console.log(id);
            $(".ul .edit input").eq(id).focus;
            this.re = this.lists[id].work;
            $(".ul .edit input").eq(id).css("display","block");
        },
        blur(id){
            $(".ul .edit input").css("display","none");
            this.re = $(".ul .edit input").val()
            this.lists[id].work =  this.re;
            // this.lists = this.lit

        }
    }
})