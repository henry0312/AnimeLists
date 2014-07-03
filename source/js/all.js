$(function () {
  $("input.channel[type='checkbox']").click(function() {
    var channel_id = $(this).attr('value');
    if ($(this).prop('checked')) {
      $("tr.anime").each(function() {
        if ($(this).attr('channel') == channel_id) {
          $(this).removeClass('hidden');
        }
      });
    } else {
      $("tr.anime").each(function() {
        if ($(this).attr('channel') == channel_id) {
          $(this).addClass('hidden');
        }
      });
    }
  });
});
