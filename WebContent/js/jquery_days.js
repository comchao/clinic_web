
 
    var datepicked = function() {       
              var from = $('#from');
              var to = $('#to');
              var days = $('#days');                   
                    var fromDate = from.datepicker('getDate')
                    var toDate = to.datepicker('getDate')
     
              if (toDate && fromDate) {
               var difference = 0;
                            var oneDay = 86400000; //ms per day
                            var difference = Math.ceil((toDate.getTime() - fromDate.getTime()) / oneDay); 
                            days.val(difference);
                }
     }
            $(function() {             
                     $('#from, #to').datepicker({
                            onSelect: datepicked
                    });
                   
            });    
 
