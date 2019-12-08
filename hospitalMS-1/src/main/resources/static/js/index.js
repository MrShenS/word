// 首页相关JS
$(function(){
	// 为左侧导航栏绑定事件
	$('.menu dd').off();
	$('.menu dd').on('click',function(){
		// 获取当前导航信息
		var currentMenuText = $(this).text();
		// 获取当前要加载的局部页面的URL
		var currentUrl = $(this).attr('url');
		// 将当前导航信息显示到右侧提示栏
		$('.b_right .b_tip').text(currentMenuText);
		// 异步加载页面到右侧内容区，页面局部更新
		$('.b_main').load(currentUrl);
	});
	// 默认点击
	$('.menu dd').filter(':first').trigger('click');
});