/**
 * Created by .
 * User: eamon
 * Date: 01-Feb-2011
 * Time: 18:59:36
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function() {
    /*
     $("#vacations_list").jqGrid({
     url:'/vacations/holiday_json',
     height: "250px",
     datatype: "json",
     mtype: 'GET',
     colNames:['id', 'Date From','Date To', 'Description', 'Working Days Used','Holiday Status', 'Holiday Status ID', 'Notes'],
     colModel:[
     {name:'id',index:'id', width:55, sortable:false},
     {name:'vacation_date_from',index:'vacation_date_from', width:100},
     {name:'vacation_date_to',index:'vacation_date_to', width:100},
     {name:'vacation_description',index:'vacation_description', width:300},
     {name:'vacation_working_days_used',index:'vacation_working_days_used', width:120},
     {name:'vacation_holiday_status_name',index:'vacation_holiday_status_name', width:200},
     {name:'vacation_holiday_status_id',index:'vacation_holiday_status_id', hidden:true},
     {name:'vacation_notes', index: 'vacation_notes', hidden:true}
     ],
     jsonReader : {
     repeatitems:false
     },
     rowNum:10,
     pager: jQuery('#vacations_pager'),
     sortname: 'name',
     viewrecords: true,
     sortorder: "asc",
     caption:"Your holidays",
     onSelectRow: function(rowid) {
     var holdata = $("#vacations_list").jqGrid('getRowData', rowid);
     updateForm(holdata);
     }
     }); */

    $('#holidaysTable tr').click(function() {

        alert('you clicked a row!!');
        alert($(this).html);
    });

});


function updateForm(holdata) {
    clearForm($("#new_vacation"));
    $("#vacation_description").val(holdata.vacation_description);
    $("#vacation_holiday_status_id").val(holdata.vacation_holiday_status_id);
    $("#vacation_date_from").val(holdata.vacation_date_from);
    $("#vacation_date_to").val(holdata.vacation_date_to);
    $("#vacation_notes").val(holdata.vacation_notes);

    $("form.vacation").attr("action", "/vacations");
    $("form.vacation").attr("method", "POST");
    $("#vacation_submit").val("Create Holiday");

    var holId = $(this).attr("id");
    $("fieldset.vacation, legend.vacation").removeClass("create").addClass("update");
    $("legend.vacation").html("Change Holiday");
    var action = $(this).val() == "people" ? "user" : "content";
    $("form.vacation").attr("action", "/vacations/" + holdata.id);
    $("form.vacation").attr("method", "PUT");

    $("#cancelUpdate").show();
    $("#vacation_submit").val("Update Holiday");
}