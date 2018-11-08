var date1 = new Date("2018-11-08");
var date2 = new Date("2018-11-09");
var date3 = new Date("2018-11-10");

var unavailableDates = [date1, date2, date3];

function available(date) {
  dmy = date.getDate() + "-" + (date.getMonth() + 1) + "-" + date.getFullYear();
  if($.inArray(dmy, unavailableDates) == -1) {
    return [true, "", "Available"];
  } else {
    return [true, "", "Unavailable"];
  };
};

$(document).ready(function() {
  $('#datepicker').datepicker({
    beforeShowDay: available
  });
});
