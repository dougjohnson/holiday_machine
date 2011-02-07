/**
 * Created by .
 * User: eamon
 * Date: 05-Feb-2011
 * Time: 17:22:23
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function() {
    $("#admin_grid").jqGrid({
        url:'/administer/get_team_data/',
        height: "250px",
        datatype: "json",
        mtype: 'GET',
        colNames:['','id', 'Email', 'Date From','Date To', 'Description', 'Working Days Used','Holiday Status', 'Holiday Status ID'],
        colModel:[
            {name:'act', index:'act', width:75,sortable:false},
            {name:'id',index:'id', hidden:true},
            {name:'email',index:'email', width:100},
            {name:'vacation_date_from',index:'vacation_date_from', width:100},
            {name:'vacation_date_to',index:'vacation_date_to', width:100},
            {name:'vacation_description',index:'vacation_description', width:300},
            {name:'vacation_working_days_used',index:'vacation_working_days_used', width:120},
            {name:'vacation_holiday_status_name',index:'vacation_holiday_status_name', width:200,
                    editable:true, edittype:'select',
                    editoptions:{value:{1:'Pending',2:'Authorised', 3: 'Cancelled'}}
            },
            {name:'vacation_holiday_status_id',index:'vacation_holiday_status_id', hidden:true}
        ],
        jsonReader : {
            repeatitems:false
        },
        loadComplete: function(){
                var ids = jQuery("#admin_grid").getDataIDs();
                for(var i=0;i<ids.length;i++){
                    var cl = ids[i];
//                    be = "<input style='height:22px;width:20px;' type='button' value='E' onclick=jQuery('#admin_grid').editRow("+cl+"); ></ids>";
                    se = "<input style='height:22px;width:20px;' type='button' value='S' onclick=jQuery('#admin_grid').saveRow("+cl+"); />";
//                    ce = "<input style='height:22px;width:20px;' type='button' value='C' onclick=jQuery('#admin_grid').restoreRow("+cl+"); />";
//                    jQuery("#admin_grid").setRowData(ids[i],{act:be+se+ce})
                    jQuery("#admin_grid").setRowData(ids[i],{act:se})
                }
            },
        rowNum:10,
        pager: jQuery('#admin_pager'),
        editurl: "/administer",
        grouping:true,
        groupingView : {
            groupField : ['email']
        },
        viewrecords: true,
        sortorder: "asc",
        caption:"Your team's holidays",
        onSelectRow: function(rowid) {
            jQuery("#admin_grid").jqGrid('editRow', rowid, true);
        }
    });
});

