/**
 * Created by .
 * User: eamon
 * Date: 01-Feb-2011
 * Time: 18:59:36
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function() {

    $('#holidaysTable tr').click(function() {
        $('table .row_highlight:first').removeClass('row_highlight');
        $(this).toggleClass("row_highlight");
        var holidayHash = new Object();
        holidayHash["description"] = this.cells[0].innerHTML;
        holidayHash["dateFrom"] = this.cells[1].innerHTML;
        holidayHash["dateTo"] = this.cells[2].innerHTML;
        holidayHash["workingDays"] = this.cells[3].innerHTML;
        holidayHash["status"] = this.cells[4].innerHTML;
        updateForm(holidayHash);
    });


    $("#holidaysTable tr").hover(
            function() {  // mouseover
                $(this).addClass('highlight');
            },
            function() {  // mouseout
                $(this).removeClass('highlight');
            }
            );

    $("#cancelUpdate").click(function() {
        $('table .row_highlight:first').removeClass('row_highlight');
        $("fieldset.vacation, legend.vacation").removeClass("update").addClass("create");
        $("legend.vacation").html("Create Holiday");
        $(this).hide();
        clearForm($("#new_vacation"));
        $("#vacation_date_from").val($.formatDate(new Date(), "dd/MM/yyyy"));
        $("#vacation_date_to").val($.formatDate(new Date(), "dd/MM/yyyy"));
        $("form.vacation").attr("action", "/vacations");
        $("form.vacation").attr("method", "POST");
        $("#vacation_submit").val("Create Holiday");
    });

});

function updateForm(holdata) {
    clearForm($("#new_vacation"));
    $("#vacation_description").val(holdata["description"]);
    $("#vacation_date_from").val(holdata["dateFrom"]);
    $("#vacation_date_to").val(holdata["dateTo"]);

    $("form.vacation").attr("action", "/vacations");
    $("form.vacation").attr("method", "POST");
    $("#vacation_submit").val("Create Holiday");

    var holId = $(this).attr("id");
    $("fieldset.vacation, legend.vacation").removeClass("create").addClass("update");
    $("legend.vacation").html("Change Holiday");
    var action = $(this).val() == "people" ? "user" : "content";
    $("form.vacation").attr("action", "/vacations/" + holdata["id"]);
    $("form.vacation").attr("method", "PUT");

    var status_id = $("#vacation_holiday_status_id option:contains(" + holdata["status"] + ")").val();
    $("#vacation_holiday_status_id").val(status_id);

    $("#cancelUpdate").show();
    $("#vacation_submit").val("Update Holiday");
}

