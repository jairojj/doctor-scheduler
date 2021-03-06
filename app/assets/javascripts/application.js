// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .
//= require bootstrap-datepicker

$(function(){
  
  var date = new Date();
  var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());
  
  //$('[data-behaviour~=datepicker]').datepicker({ 
      //startDate: today
  //});
  
  function formatDate(value)
  {
     return value.getFullYear() + "-" + (value.getMonth()+1) + "-" + value.getDate();
  }
  
  $("#appointment_date").datepicker().on('changeDate', function (e) {
    var newDate = new Date(e.date);
    
    $.get('/time?date='+ formatDate(newDate) + '&doctor_id=' + doctorId , function(data) {
      console.log(data);
      
      $('#appointment_start').empty();
      
      if (data.time == "Nenhum horario disponível nesse dia"){
        $('#appointment_start').append($('<option>', { 
           value: data.time,
           text : data.time
        }));
      }
      else{
        $.each(data.time, function (i, item) {
          $('#appointment_start').append($('<option>', { 
             value: item,
             text : item + " hrs"
          }));
        });
      }
      
    });
    
  });
})