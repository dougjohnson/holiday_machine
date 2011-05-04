/**
 * Created by .
 * User: eamon
 * Date: 01-Feb-2011
 * Time: 18:59:36
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function() {

    $("#vacation_holiday_status_id").live('change', function() {
        var selected_status = $("#vacation_holiday_status_id option:selected").val();

        if (selected_status == 3) {
            $("#dialog-modal").dialog({
                height: 140,
                modal: true
            });
        }
    });

    $("#holiday_year_id").change(function() {
        $("#vacation_holiday_year_id").val($(this).val());
        $.ajax({
            type: 'GET',
            data: {holiday_year_id: $(this).val()},
            url: '/vacations/'
        });
    });

    $(".deleteButton").live('click', function() {
        $.ajax({
            type: 'DELETE',
            url: '/vacations/' + $(this).closest('tr').attr('id')
        });
    });

    $("#cancelUpdate").click(function() {
        clearUpdate();
    });
});





