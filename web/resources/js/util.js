function formatDate(date) {
    var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear();
    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;
    return [year, month, day].join('-');
}

function getYear(time) {
    /*yyyy-mm-dd*/
    time = time + '';
    time = time.substring(0, 4);
    return time;
}

function getMonth(time) {
    time = time + '';
    time = time.substring(5, 7);
    return time;
}

function getDay(time) {
    time = time + '';
    time = time.substring(8, 10);
    return time;
}

var runTable = function (pageNationId, layoutId) {
    var layout = '#' + layoutId;
    $('#' + pageNationId).html('');
    var trnum = 0;
    var maxRows = 5; //행 제한 횟수

    var totalRows = $(layout + ' .media-container').length;
    console.log(totalRows);
    $(layout + ' .media-container:gt(0)').each(function () {
        trnum++
        if (trnum > maxRows) {
            $(this).hide()
        }
        if (trnum <= maxRows) {
            $(this).show()
        }
    })
    if (totalRows > maxRows) {
        var pagenum = Math.ceil(totalRows / maxRows)
        for (var i = 1; i <= pagenum;) {
            $('#' + pageNationId).append('<li class="page-item" data-page="' + i + '"><a class="page-link border-0" href="#">' + i++ + '</a></li>').show()
        }
    }
    $('#' + pageNationId + ' li:first-child').addClass('active');
    $('#' + pageNationId + ' li').on('click', function () {
        var pageNum = $(this).attr('data-page')
        var rowIndex = 0;
        $('#' + pageNationId + ' li').removeClass('active')
        $(this).addClass('active');
        $(layout + ' .media-container:gt(0)').each(function () {
            rowIndex++;
            if (rowIndex > (maxRows * pageNum) || rowIndex <= ((maxRows * pageNum) - maxRows)) {
                $(this).hide();
            } else {
                $(this).show();
            }
        })
    });
}

function inputInjection(str){
    //함수를 호출하여 특수문자 검증 시작.
/*    var regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
    if(regExp.test(str)){
        var t = str.replace(regExp, "");
        //특수문자를 대체. ""
        alert("특수문자 제거. ==>" + t);
        //특수문자 제거. ==>20171031
    }else{
        alert("특수문자 없음 "+str);
    }*/

    var seExp = /[;\"\'\{\}]/gi;
    if(seExp.test(str)){
        var afterstr = str.replace(seExp, "");
        //alert("test1"+afterstr);
        return afterstr;
    } else {
        //alert("test2"+str);
        return str;
    }
}
