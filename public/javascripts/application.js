function monthFilterPlatform(item, year, limit) {
    spinner(item.className, "Show");
    uncheckMonthFilterAll(item.className, true);
    limit = checkIfMonthShowAll(item.className, limit);
    updateMonth(item.className, year, limit);
}

function spinner(cls, type) {
    if (type == "Show") {
        Element.show('spinner'+cls);
    } else {
//Element.hide('spinner'+month);
}
}

function uncheckMonthFilterAll(month, unCheck) {
    if (unCheck == true) {
        var monthFilterAll = $('month_filter_all'+month);
        monthFilterAll.checked = false;
    }
}

function checkIfMonthShowAll(month, limit) {
    var monthShowAll = $('month_show_all'+month);
    if (monthShowAll.checked == true) {
        return 0;
    } else {
        return limit;
    }
}

function checkIfYearShowAll(year, limit) {
    var yearShowAll = $('year_show_all'+year);
    if (yearShowAll.checked == true) {
        return 0;
    } else {
        return limit;
    }
}

function updateMonth(month, year, limit) {
    new Ajax.Request('/update_month',
    {
        method: "post",
        parameters: getCheckedMonth(month, year, limit)
    });
}

function getCheckedMonth(month, year, limit) {
    var desc = $$('.'+month);
    var check = false;
    var monthShowAll = $('month_show_all'+month);
    var params = "y=" + year + "&m=" + month
    var i = 1;
    desc.each(function(item) {
        if (item.checked == true && item != monthShowAll) {
            params = params + "&" + i + "=" + item.id;
            i = i + 1;
            check = true;
        }
    })
    if (check == false) {
        params += getCheckedPlatformsYear(year)  + "&l=" + checkIfYearShowAll(year, limit);
    } else {
        params += "&l=" + limit
    }
    return params;
}

function monthFilterAll(item, year, limit) {
    if (item.checked == true) {
        monthSpinner(item.className, "Show");
        uncheckFiltersPlatforms(item.className, true);
        limit = checkIfMonthShowAll(item.className, limit);
        item.checked = true;
        updateMonth(item.className, year, limit);
    } else {
        monthSpinner(item.className, "Show");
        limit = checkIfMonthShowAll(item.className, limit);
        updateMonth(item.className, year, limit);
    }
}

function uncheckFiltersPlatforms(month) {
    var desc = $$('.'+month);
    var monthShowAll = $('month_show_all'+month);
    desc.each(function(item) {
        if (item.checked == true && item != monthShowAll) {
            item.checked = false;
        }
    });
}

function monthShowAll(item, year, limit) {
    if (item.checked == true) {
        monthSpinner(item.className, "Show");
        updateMonth(item.className, year, limit);
    } else {
        monthSpinner(item.className, "Show");
        updateMonth(item.className, year, 3);
    }
}

function yearShowAll(item, limit) {
    if (item.checked == true) {
        monthSpinner(item.className, "Show");
        updateYear(item.className, limit);
    } else {
        monthSpinner(item.className, "Show");
        updateYear(item.className, 3);
    }
}

function yearFilter(item, cls, allId) {
    spinner(item.className, "Show");
    $(allId).checked = false;
    updateYear(cls);
}

function yearFilterAll(item, cls) {
    if (item.checked == true) {
        spinner(item.className, "Show");
        uncheckYearFilters(item);
        item.checked = true;
        updateYear(cls);
    } else {
        item.checked = true;
    }
}

function uncheckYearFilters(item) {
    var filters = $$('.'+item.className);
    filters.each(function(filter) {
        if (filter.checked == true && filter != item) {
            filter.checked = false;
        }
    });
}

function uncheckYearFilterAll(year, unCheck) {
    if (unCheck == true) {
        var yearFilterAll = $('year_filter_all'+year);
        yearFilterAll.checked = false;
    }
}

function updateYear(cls) {
    new Ajax.Request('/update_year',
    {
        method: "post",
        parameters: getCheckedYear(cls)
    });
}

function getCheckedYear(cls) {
    var filters = $$('.'+cls).concat($$('.p'+cls)).concat($$('.d'+cls));
    var params = "y=" + cls + "&l=3";
    var i = 1;
    filters.each(function(filter) {
        if (filter.checked == true) {
            params = params + "&" + i + "=" + filter.id;
            i = i + 1;
        }
    })
    params += getCheckedMonths();
    return params;
}

function getCheckedPlatformsYear(year) {
    var filters = $$('.'+year);
    params = "";
    var i = 1;
    filters.each(function(filter) {
        if (filter.checked == true) {
            params += "&" + i + "=" + filter.id;
            i = i + 1;
        }
    })
    return params;
}

function getCheckedMonths() {
    var m = 0;
    var params = "";
    var check = false;
    var months = ["01","02","03","04","05","06","07","08","09","10","11","12"];
    while (m < 12) {
        var filters = $$('.'+months[m]);
        var monthShowAll = $('month_show_all'+months[m]);
        if (filters != "") {
            filters.each(function(filter) {
                if (filter.checked == true && filter != monthShowAll) {
                    check = true;
                    throw $break;
                }
            })
            if (check == true) {
                params += "&ig"+m+"="+months[m];
            }
            check = false;
        }
        m++;
    }
    return params;
}

function updateDay(sh, type, year, month, day) {
    if (month < 10) {
        month = "0"+month;
    }
    var params = getCheckedMonth(month, year, "3");
    params += "&type="+type+"&sh="+sh+"&date="+year+"-"+month+"-"+day;
    new Ajax.Request('/update_day',
    {
        method: "post",
        parameters: params
    });
}

function xCoord(event, gameId) {
    var x = event.clientX - 600;
    new Ajax.Request('/show_game_info',
    {
        method: "post",
        parameters: "id="+gameId+"&xcoord="+x
    });
}

function tooltipAjax(e, element, id) {
    var middle = screen.availWidth / 2;
    var x = e.screenX;
    var pos = 'left';
    var toolTip = 'topRight';
    var toolXOff = 11;
    var width = 'auto';
    if (element.name.length > 40)
        width = 335;
    if (x < middle) {
        pos = 'right';
        toolTip = 'topLeft';
        toolXOff = -11;
    }
    new Tip(element, {
        title: element.name,
        style: 'custom',
        fixed: true,
        showOn: 'click',
        closeButton: true,
        width: width,
        hideOn: {
            element: element,
            event: 'click'
        },
        hideOthers: true,
        hideAfter: false,
        hook: {
            target: toolTip,
            tip: toolTip
        },
        offset: {
            x: toolXOff,
            y: -37
        },
        ajax: {
            url: '/show_game_tooltip',
            options: {
                method: 'get',
                parameters: "id="+id+"&pos="+pos
            }
        }
    });
}

function tabselect1(tab) {
    var tablist = $('tabcontrol1').getElementsByTagName('li');
    var nodes = $A(tablist);

    nodes.each(function(node){
        if (node.id == tab.id) {
            tab.className='current_show_filter';
        } else {
            node.className='nc_show_filter';
        }
    });
}

function paneselect1(div) {
    var hidden_div;
    var nh_div1;
    var nh_div2;
    if(div == 'platforms_general_filters') {
        nh_div1 = document.getElementById('developers_general_filters');
        nh_div2 = document.getElementById('publishers_general_filters');
    } else if(div == 'publishers_general_filters') {
        nh_div1 = document.getElementById('developers_general_filters');
        nh_div2 = document.getElementById('platforms_general_filters');
    } else if(div == 'developers_general_filters') {
        nh_div1 = document.getElementById('publishers_general_filters');
        nh_div2 = document.getElementById('platforms_general_filters');
    } else {

    }
    hidden_div = document.getElementById(div);
    nh_div1.style.display = "none";
    nh_div2.style.display = "none";
    hidden_div.style.display = "block";
}

function showHide(element) {
    if(element.innerHTML=='More') {
        element.update('Hide')
    } else {
        element.update('More')
    }
}

function showMorePlatforms(elem, content) {
    new Tip(elem, content, {
        style: 'custom',
        fixed: true,
        showOn: 'click',
        hideOn: 'click',
        hook: {
            tip: 'bottomRight'
        }, stem: 'bottomRight',
        offset: {x: 20, y: 0}
    });
    elem.onmouseover=null;
}
