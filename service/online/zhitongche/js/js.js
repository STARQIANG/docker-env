$(function() {
  // 二维码显示
  (function () {
    $('a').on('mouseover',  function(event) {
      event.preventDefault();
      $(this).find('i').show();
    });
    $('a').on('mouseout',  function(event) {
      event.preventDefault();
      $(this).find('i').hide();
    });
  })();
  // 暂无链接提醒 在dom上添加属性noLink="true"
  (function () {
    $('*[noLink="true"]').on('click',function () {
      alert("无链接,请更换环境");
    })
  })();
  // tab切换
  (function () {
     $(".tab-nav li").on('click', function() {
      var index = $(this).index();
      $(this).addClass('actived').siblings().removeClass('actived');
      $('.content-wrap div').eq(index).show().siblings().hide();
    })
  })();
})