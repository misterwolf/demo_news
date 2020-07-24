(function ($) { //an IIFE so safely alias jQuery to $
  // Opting for a Jquery Class
  $.Sorter = function () { //renamed arg for readability
  };

  // assigning an object literal to the prototype is a shorter syntax
  //than assigning one property at a time
  $.Sorter.prototype = {
    // Could be good in future parametize a bit this Class.
    // also building totaly and pure JS.
    initEvents: function () {
      var _this = this;

      // run for the first time
      $('.news-item').sort(_this.sortDescending.bind(_this)).appendTo('.news-list');

      $( ".sort-select" ).change(function() {
        // passing context
        $('.news-item').sort(_this.sortDescending.bind(_this)).appendTo('.news-list');
      });
    },

    splitValueSelect: function(){
      var selectValue = $( ".sort-select option:selected" ).attr("value");
      return selectValue.split('-');
    },

    sortDescending: function(a, b, sort) {
      var sorting = this.splitValueSelect();
      var what = "." + sorting[0];
      var criteria = sorting[1];

      var date1 = $(a).find(what).text();
      date1 = date1.split('-');
      date1 = new Date(date1[2], date1[1] -1, date1[0]);

      var date2 = $(b).find(what).text();
      date2= date2.split('-');
      date2= new Date(date2[2], date2[1] -1, date2[0]);

      if (criteria === 'asc'){
        return date1 < date2 ? 1 : -1;
      } else {
        return date1 > date2 ? 1 : -1;
      }
    }
  };
}(jQuery));
