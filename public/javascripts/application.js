// Place your application-specific JavaScript functions and classes here

$(document).ready(function() {

    $.datepicker.setDefaults({ dateFormat: 'dd/mm/yy' });

    var $dialog = $("#holidayFormDialog").dialog({
        autoOpen: false,
        title: 'Edit holiday'
    });

    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();

    $('#calendar').fullCalendar({
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        editable: true,
        eventClick: function() {
            $dialog.dialog('open');
        },
        events: "/vacations"
    });

    $('#vacation_date_from').datepicker();
    $("#vacation_date_to").datepicker();


    $('a.delete').live('click', function(event) {

        if (confirm("Are you sure you want to delete these days?"))
            $.ajax({
                url: this.href.replace('/destroy', ''),
                type: 'post',
                dataType: 'script',
                data: { '_method': 'destroy' },
                success: function() {
                    alert("Success");
                },
                failure: function(){
                    alert("failed");
                }
            });

        return false;
    });

});

function clearForm(myForm) {
    $(myForm).find(':input').each(function() {
        switch (this.type) {
            case 'password':
            case 'select-multiple':
            case 'select-one':
            case 'text':
            case 'textarea':
                $(this).val('');
                break;
            case 'checkbox':
            case 'radio':
                this.checked = false;
        }
    });
}


