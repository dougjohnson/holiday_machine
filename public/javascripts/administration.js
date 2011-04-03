/**
 * Created by .
 * User: eamon
 * Date: 05-Feb-2011
 * Time: 17:22:23
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function() {
    var lastSel = -1;
    $("#admin_grid").jqGrid({
        url:'/administer/get_team_data/',
        height: "250px",
        datatype: "json",
        mtype: 'GET',
        colNames:['','id', 'Name', 'Date From','Date To', 'Description', 'Working Days Used','Holiday Status', 'Notes', 'Holiday Status ID'],
        colModel:[
            {name:'act', index:'act', width:50,sortable:false},
            {name:'id', index:'id', hidden:true},
            {name:'vacation_name',index:'vacation_name', hidden:true},
            {name:'vacation_date_from',index:'vacation_date_from', width:100},
            {name:'vacation_date_to',index:'vacation_date_to', width:100},
            {name:'vacation_description',index:'vacation_description', width:200},
            {name:'vacation_working_days_used',index:'vacation_working_days_used', width:120},
            {name:'vacation_holiday_status_name',index:'vacation_holiday_status_name', width:200,
                editable:true, edittype:'select',
                editoptions:{value:{1:'Pending',2:'Authorised', 3: 'Cancelled'}}
            },
            {name:'vacation_notes',index:'vacation_notes', width:200,
                editable:true, edittype:'textarea',
                editrules:{required:true}
            },
            {name:'vacation_holiday_status_id',index:'vacation_holiday_status_id', hidden:true}
        ],
        jsonReader : {
            repeatitems:false
        },
        loadComplete: function() {
            var ids = $("#admin_grid").getDataIDs();
            for (var i = 0; i < ids.length; i++) {
                var cl = ids[i];
                se = "<input style='height:22px;width:40px;' type='button' value='Save' onclick=jQuery('#admin_grid').saveRow(" + cl + "); />";
                $("#admin_grid").setRowData(ids[i], {act:se})
            }
        },
        rowNum:10,
        pager: jQuery('#admin_pager'),
        editurl: "/administer/create",
        grouping:true,
        groupingView : {
            groupField : ['vacation_name'],
            groupColumnShow : [false]
        },
        viewrecords: true,
        sortorder: "asc",
        caption:"Your team's holidays",
        onSelectRow: function(rowid) {
            if (rowid && rowid !== lastSel) {
                        // cancel editing of the previous selected row if it was in editing state.
                        // jqGrid hold intern savedRow array inside of jqGrid object,
                        // so it is safe to call restoreRow method with any id parameter
                        // if jqGrid not in editing state
                        $("#admin_grid").jqGrid('restoreRow',lastSel);
                        lastSel = rowid;
                    }
            $("#admin_grid").jqGrid('editRow', rowid, true);
            lastSel = rowid;
        }
    });
});

