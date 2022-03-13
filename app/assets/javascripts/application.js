// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery3
//= require popper
//= require bootstrap-sprockets
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// スタート
jQuery(document).on('turbolinks:load', function(){
$.getJSON('/pref_city.json', function(data) {

    for(var i=1; i<48; i++) {
      var code = ('00'+code).slice(-2); // ゼロパディング

      var num;
      if (i.toString().length == 1) {
        num = "0" + i.toString();
      }else{
        num =  i.toString();
      }

      $('#start-pref').append('<option value="'+num+'">'+data[i-1][num].pref+'</option>');
    }
  });

$('#start-pref').on('change', function() {
  $('#start-city option:nth-child(n+2)').remove(); // ※1 市区町村フォームクリア
    var start_pref = ('00'+$('#start-pref option:selected').val()).slice(-2);

    var key = Number(start_pref)-1;
    $.getJSON('/pref_city.json', function(data) {
      for(var i=0; i<data[key][start_pref].city.length; i++){

        $('#start-city').append('<option value="'+data[key][start_pref].city[i].name+'">'+data[key][start_pref].city[i].name+'</option>');
      }
  });
});

});

// ゴール
jQuery(document).on('turbolinks:load', function(){
$.getJSON('/pref_city.json', function(data) {

    for(var i=1; i<48; i++) {
      var code = ('00'+code).slice(-2); // ゼロパディング

      var num;
      if (i.toString().length == 1) {
        num = "0" + i.toString();
      }else{
        num =  i.toString();
      }

      $('#goal-pref').append('<option value="'+num+'">'+data[i-1][num].pref+'</option>');
    }
  });

$('#goal-pref').on('change', function() {
  $('#goal-city option:nth-child(n+2)').remove(); // ※1 市区町村フォームクリア
    var goal_pref = ('00'+$('#goal-pref option:selected').val()).slice(-2);

    var key = Number(goal_pref)-1;
    $.getJSON('/pref_city.json', function(data) {
      for(var i=0; i<data[key][goal_pref].city.length; i++){

        $('#goal-city').append('<option value="'+data[key][goal_pref].city[i].name+'">'+data[key][goal_pref].city[i].name+'</option>');
      }
  });
});

});