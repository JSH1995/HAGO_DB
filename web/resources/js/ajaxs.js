function addCommentByDetail(path, user_img, user_no, user_nickname, contents_no, comment) {
    /*나의 User_No, Contents_No Comment*/
    var object = new Object();
    object.user_no = user_no;
    object.contents_no = contents_no;
    object.comment = comment;
    var jsonObject = JSON.stringify(object);
    $.ajax({
        type: "GET", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/comment.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "type": 'addComment',
            "value": jsonObject,
        },
        dataType: "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        error: function () {
            console.log('Auth Ajax Failed');
            alert('Error');
        },
        success: function (Parse_data) {
            if (Parse_data != null) {
                var string = Parse_data + '';
                if (string.indexOf("error") >= 0) {
                    alert('Error');
                    runTable('nav-ul', 'layout');
                } else if (string.indexOf("true") >= 0) {
                    alert('코멘트 등록 성공');
                    var html = '<div class="media media-container border-bottom pb-4 mb-4 tr">\n' +
                        '    <img style="border-radius: 22px;" width="44" height="44" class="mr-3"\n' +
                        '         src="' + path + user_img + '"\n' +
                        '         alt="Generic placeholder image">\n' +
                        '    <div class="media-body text-left">\n' +
                        '        <h5 class="mt-0">' + user_nickname + '</h5>\n' +
                        '        <h6 class="footer-text">' + formatDate(new Date()) + '</h6>\n' +
                        '        ' + object.comment + '\n' +
                        '    </div>\n' +
                        '</div>' + $('#layout').html();
                    $('#layout').html(html);
                    $('#comment').value = '';
                    $('#comment').val('');
                } else {
                    alert('코멘트 등록 실패');
                }
            } else {
                alert('서버에러');
            }
        }
    });
}

function duplicatedId(id) {
    $.ajax({
        type: "GET", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/auth.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "type": 'duplicatedId',
            "value": id,
        },
        dataType: "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        error: function () {
            console.log('Auth Ajax Failed');
            alert('Error');
        },
        success: function (Parse_data) {
            console.log(Parse_data + '1');
            if (Parse_data != null) {
                console.log(Parse_data + '2');
                var string = Parse_data + '';
                console.log(string);
                if (string.indexOf("error") >= 0) {
                    alert('Error');
                } else if (string.indexOf("true") >= 0) {
                    $('#duplicatedId').prop('checked', true);
                    alert('중복된 아이디가 없습니다.');
                } else {
                    alert('중복된 아이디가 있습니다.');
                }
            } else {
                alert('서버에러');
            }
        }
    });
}

function duplicatedMailprofile(id, email, profileeditMail) {
    var object = new Object();
    object.email = email;
    object.id = id;
    var json = JSON.stringify(object);
    $.ajax({
        type: "GET", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/auth.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "type": profileeditMail != null && profileeditMail == 'auth' ? 'profileeditMail' : 'profileeditMail',
            "value": json,
        },
        async: true,
        dataType: "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        beforeSend: function () {
            $('#emailProgress').removeClass('tag-hide');
        },
        error: function () {
            console.log('Auth Ajax Failed');
            alert('Error');
            $('#emailProgress').addClass('tag-hide');
            $('#emailCheck').removeClass('tag-hide');
        },
        success: function (Parse_data) {
            if (Parse_data != null) {
                var string = Parse_data + '';
                if (string.indexOf("error") >= 0) {
                    alert('Error');
                } else if (string.indexOf("true") >= 0) {
                    alert('해당 메일로 인증번호 보내드렸습니다.');
                    $('#emailProgress').addClass('tag-hide');
                    $('#emailCheck').removeClass('tag-hide');
                } else {
                    alert('중복된 이메일이 있습니다. 메일을 확인해주세요.');
                    $('#emailProgress').addClass('tag-hide');
                    $('#emailCheck').removeClass('tag-hide');
                    return false;
                }
            } else {
                alert('서버에러');
            }
        }
    });
}

function duplicatedMail(id, email, auth) {
    var object = new Object();
    object.email = email;
    object.id = id;
    var json = JSON.stringify(object);
    $.ajax({
        type: "GET", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/auth.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "type": auth != null && auth == 'auth' ? 'duplicatedMailAuth' : 'duplicatedMail',
            "value": json,
        },
        async: true,
        dataType: "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        beforeSend: function () {
            $('#emailProgress').removeClass('tag-hide');
        },
        error: function () {
            console.log('Auth Ajax Failed');
            alert('Error');
            $('#emailProgress').addClass('tag-hide');
            $('#emailCheck').removeClass('tag-hide');
        },
        success: function (Parse_data) {
            if (Parse_data != null) {
                var string = Parse_data + '';
                if (string.indexOf("error") >= 0) {
                    alert('Error');
                } else if (string.indexOf("true") >= 0) {
                    alert('해당 메일로 인증번호 보내드렸습니다.');
                    $('#emailProgress').addClass('tag-hide');
                    $('#emailCheck').removeClass('tag-hide');
                } else {
                    alert('중복된 이메일이 있습니다. 메일을 확인해주세요.');
                    $('#emailProgress').addClass('tag-hide');
                    $('#emailCheck').removeClass('tag-hide');
                    return false;
                }
            } else {
                alert('서버에러');
                $('#emailProgress').addClass('tag-hide');
                $('#emailCheck').removeClass('tag-hide');
            }
        }
    });
}

function logout() {
    $.ajax({
        type: "GET", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/auth.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "type": 'logout',
            "value": null,
        },
        dataType: "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        error: function () {
            console.log('Auth Ajax Failed');
            alert('Error');
        },
        success: function (Parse_data) {
            if (Parse_data != null) {
                var string = Parse_data + '';
                if (string.indexOf("error") >= 0) {
                    alert('Error');
                } else if (string.indexOf("true") >= 0) {
                    alert('로그아웃이 완료되었습니다.');
                    getLocation("login.do");
                } else {
                    alert('로그아웃이 미완료 되었습니다.');
                }
            } else {
                alert('서버에러');
            }
        }
    });
}

function changeContentState(type, content_no) {
    $.ajax({
        type: "GET", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/content.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "type": type,
            "value": content_no,
        },
        dataType: "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        error: function () {
            console.log('Auth Ajax Failed');
            alert('Error');
        },
        success: function (Parse_data) {
            if (Parse_data != null) {
                var string = Parse_data + '';
                if (string.indexOf("error") >= 0) {
                    alert('Error');
                } else if (string.indexOf("true") >= 0) {
                    alert('State 변환 성공');
                } else {
                    alert('State 변환 에러');
                }
            } else {
                alert('서버에러');
            }
        }
    });
}

function notice_reload(id, element) {
    $.ajax({
        type: "GET", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/notice.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "id": id
        },
        dataType: "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        error: function () {
            console.log('Notice Ajax Failed');
            alert('Error');
        },
        success: function (Parse_data) {
            console.log(Parse_data);
            console.log(Parse_data['notice_TotalPage']);
            if (Parse_data == "error") {
                // TO DO
                // 모든 게시글과 번호쪽 바이바이
                alert("error");
            } else {
                var totalpage = Parse_data['notice_TotalPage'];
                var start = Parse_data['startPage'];
                var cur = Parse_data['curPage'];
                var end = Parse_data['endPage'];
                var first = Parse_data['first'];
                var last = Parse_data['last'];
                if (totalpage < 4) {
                    console.log("before");
                    if (!element.parent().hasClass("active")) {
                        element.parent().addClass("active");
                    }
                    element.parent().siblings('.active').removeClass('active');
                    if (first && last) {
                        $('#prev').addClass('disabled');
                        $('#next').addClass('disabled');
                    }
                    if (first) {
                        $('#prev').addClass('disabled');
                    }
                    if (last) {
                        $('#next').addClass('disabled');
                    }
                    if (first == 0 && last == 0) {
                        $('#prev').removeClass('disabled');
                        $('#next').removeClass('disabled');
                    }
                    if (first == 0) $('#prev').removeClass('disabled');
                    if (last == 0) $('#next').removeClass('disabled');

                    if (start != -1) {
                        $('#nav_1').text(start);
                        if (cur != -1) {
                            $('#nav_2').text(cur);
                            if (end != -1) {
                                $('#nav_3').text(end);
                            }
                        }
                    }
                } else { // total page > 4
                    console.log("after");
                    if (start == 1 || cur == 2) {
                        // active disabled

                    }

                    element.parent().siblings('.active').removeClass('active');
                    if (first) {
                        if (!element.parent().hasClass("active")) {
                            element.parent().addClass("active");
                        }
                        $('#prev').addClass("disabled");
                    } else if (last) {
                        if (!element.parent().hasClass("active")) {
                            element.parent().addClass("active");
                        }
                        $('#next').addClass("disabled");
                    } else {
                        $('#nav_2').parent().addClass("active");
                        $('#prev').removeClass("disabled");
                        $('#next').removeClass("disabled");
                    }

                    $('#nav_1').text(start).attr('nw', start - 1);
                    $('#nav_2').text(cur).attr('nw', cur - 1);
                    $('#nav_3').text(end).attr('nw', end - 1);
                }
                if (Parse_data['my_Notice'].length >= 1) {
                    $('#div_1').show();
                    $('#title1').text(Parse_data['my_Notice'][0]['Title']);
                    $('#date1').text(Parse_data['my_Notice'][0]['Notice_Date']);
                    $('#detail1').text(Parse_data['my_Notice'][0]['Detail']);
                    if (Parse_data['my_Notice'].length >= 2) {
                        $('#div_2').show();
                        $('#title2').text(Parse_data['my_Notice'][1]['Title']);
                        $('#date2').text(Parse_data['my_Notice'][1]['Notice_Date']);
                        $('#detail2').text(Parse_data['my_Notice'][1]['Detail']);
                        if (Parse_data['my_Notice'].length >= 3) {
                            $('#div_3').show();
                            $('#title3').text(Parse_data['my_Notice'][2]['Title']);
                            $('#date3').text(Parse_data['my_Notice'][2]['Notice_Date']);
                            $('#detail3').text(Parse_data['my_Notice'][2]['Detail']);
                            if (Parse_data['my_Notice'].length >= 4) {
                                $('#div_4').show();
                                $('#title4').text(Parse_data['my_Notice'][3]['Title']);
                                $('#date4').text(Parse_data['my_Notice'][3]['Notice_Date']);
                                $('#detail4').text(Parse_data['my_Notice'][3]['Detail']);
                                if (Parse_data['my_Notice'].length === 5) {
                                    $('#div_5').show();
                                    $('#title5').text(Parse_data['my_Notice'][4]['Title']);
                                    $('#date5').text(Parse_data['my_Notice'][4]['Notice_Date']);
                                    $('#detail5').text(Parse_data['my_Notice'][4]['Detail']);
                                } else {
                                    $('#div_5').hide();
                                }
                            } else {
                                $('#div_4').hide();
                                $('#div_5').hide();
                            }
                        } else {
                            $('#div_3').hide();
                            $('#div_4').hide();
                            $('#div_5').hide();
                        }
                    } else {
                        $('#div_2').hide();
                        $('#div_3').hide();
                        $('#div_4').hide();
                        $('#div_5').hide();
                    }
                } else {
                    $('#div_1').hide();
                    $('#div_2').hide();
                    $('#div_3').hide();
                    $('#div_4').hide();
                    $('#div_5').hide();
                }
            }
        }
    });
}

function qna_reload(id, element) {
    $.ajax({
        type: "GET", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/qna.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "id": id
        },
        dataType: "json",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        error: function () {
            console.log('Auth Ajax Failed');
            alert('Error');
        },
        success: function (Parse_data) {
            console.log(Parse_data['qna_TotalPage']);
            if (Parse_data != null) {
                if (Parse_data == "error") {
                    // TO DO
                    // 모든 게시글과 번호쪽 바이바이
                    alert("error");
                } else {
                    var totalpage = Parse_data['qna_TotalPage'];
                    var start = Parse_data['startPage'];
                    var cur = Parse_data['curPage'];
                    var end = Parse_data['endPage'];
                    var first = Parse_data['first'];
                    var last = Parse_data['last'];
                    if (totalpage < 4) {
                        console.log("before");
                        if (!element.parent().hasClass("active")) {
                            element.parent().addClass("active");
                        }
                        element.parent().siblings('.active').removeClass('active');
                        if (first && last) {
                            $('#prev').addClass('disabled');
                            $('#next').addClass('disabled');
                        }
                        if (first) {
                            $('#prev').addClass('disabled');
                        }
                        if (last) {
                            $('#next').addClass('disabled');
                        }
                        if (first == 0 && last == 0) {
                            $('#prev').removeClass('disabled');
                            $('#next').removeClass('disabled');
                        }
                        if (first == 0) $('#prev').removeClass('disabled');
                        if (last == 0) $('#next').removeClass('disabled');
                        if (start != -1) {
                            $('#nav_1').text(start);
                            if (cur != -1) {
                                $('#nav_2').text(cur);
                                if (end != -1) {
                                    $('#nav_3').text(end);
                                }
                            }
                        }
                    } else { // total page > 4
                        console.log("after");
                        if (start == 1 || cur == 2) {
                            // active disabled

                        }

                        element.parent().siblings('.active').removeClass('active');
                        if (first) {
                            if (!element.parent().hasClass("active")) {
                                element.parent().addClass("active");
                            }
                            $('#prev').addClass("disabled");
                        } else if (last) {
                            if (!element.parent().hasClass("active")) {
                                element.parent().addClass("active");
                            }
                            $('#next').addClass("disabled");
                        } else {
                            $('#nav_2').parent().addClass("active");
                            $('#prev').removeClass("disabled");
                            $('#next').removeClass("disabled");
                        }

                        $('#nav_1').text(start).attr('nw', start - 1);
                        $('#nav_2').text(cur).attr('nw', cur - 1);
                        $('#nav_3').text(end).attr('nw', end - 1);
                    }
                    if (Parse_data['my_Qna'].length >= 1) {
                        $('#div_1').show();
                        $('#question1').text(Parse_data['my_Qna'][0]['Question']);
                        $('#date1').text(Parse_data['my_Qna'][0]['Qna_Date']);
                        $('#answer1').text(Parse_data['my_Qna'][0]['Answer']);
                        if (Parse_data['my_Qna'].length >= 2) {
                            $('#div_2').show();
                            $('#question2').text(Parse_data['my_Qna'][1]['Question']);
                            $('#date2').text(Parse_data['my_Qna'][1]['Qna_Date']);
                            $('#answer2').text(Parse_data['my_Qna'][1]['Answer']);
                            if (Parse_data['my_Qna'].length >= 3) {
                                $('#div_3').show();
                                $('#question3').text(Parse_data['my_Qna'][2]['Question']);
                                $('#date3').text(Parse_data['my_Qna'][2]['Qna_Date']);
                                $('#answer3').text(Parse_data['my_Qna'][2]['Answer']);
                                if (Parse_data['my_Qna'].length >= 4) {
                                    $('#div_4').show();
                                    $('#question4').text(Parse_data['my_Qna'][3]['Question']);
                                    $('#date4').text(Parse_data['my_Qna'][3]['Qna_Date']);
                                    $('#answer4').text(Parse_data['my_Qna'][3]['Answer']);
                                    if (Parse_data['my_Qna'].length === 5) {
                                        $('#div_5').show();
                                        $('#question5').text(Parse_data['my_Qna'][4]['Question']);
                                        $('#date5').text(Parse_data['my_Qna'][4]['Qna_Date']);
                                        $('#answer5').text(Parse_data['my_Qna'][4]['Answer']);
                                    } else {
                                        $('#div_5').hide();
                                    }
                                } else {
                                    $('#div_4').hide();
                                    $('#div_5').hide();
                                }
                            } else {
                                $('#div_3').hide();
                                $('#div_4').hide();
                                $('#div_5').hide();
                            }
                        } else {
                            $('#div_2').hide();
                            $('#div_3').hide();
                            $('#div_4').hide();
                            $('#div_5').hide();
                        }
                    } else {
                        $('#div_1').hide();
                        $('#div_2').hide();
                        $('#div_3').hide();
                        $('#div_4').hide();
                        $('#div_5').hide();
                    }
                }
            }
        }
    });
}

function addLikeByDetail(user_no, contents_no) {
    /*나의 User_No, Contents_No Comment*/
    var object = new Object();
    object.user_no = user_no;
    object.contents_no = contents_no;
    var jsonObject = JSON.stringify(object);

    $.ajax({
        type: "GET", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/like.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "type": 'addLike',
            "value": jsonObject,
        },
        dataType: "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        error: function () {
            console.log('Like Ajax Failed');
            alert('Error');
        },
        success: function (Parse_data) {
            if (Parse_data != null) {
                console.log(Parse_data);
                var string = Parse_data + '';
                if (string.indexOf("error") >= 0) {
                    alert('Error');
                } else if (string.indexOf("true add") >= 0) {
                    alert('Like 등록 성공');
                } else if (string.indexOf('true del') >= 0) {
                    alert('이미 좋아요를 누른 상태입니다.')
                } else {
                    alert('Like 등록 실패');
                }
            } else {
                alert('서버에러');
            }
        }
    });
}

function deleteLikeByDetail(user_no, contents_no) {
    /*나의 User_No, Contents_No Comment*/
    var object = new Object();
    object.user_no = user_no;
    object.contents_no = contents_no;
    var jsonObject = JSON.stringify(object);

    $.ajax({
        type: "GET", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/like.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "type": 'delLike',
            "value": jsonObject,
        },
        dataType: "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        error: function () {
            console.log('Like Ajax Failed');
            alert('Error');
        },
        success: function (Parse_data) {
            if (Parse_data != null) {
                var string = Parse_data + '';
                if (string.indexOf("error") >= 0) {
                    alert('Error');
                } else if (string.indexOf("true add") >= 0) {
                    alert('Error');
                } else if (string.indexOf('true del') >= 0) {
                    alert('좋아하는 게임에서 삭제되었습니다.')
                } else {
                    alert('Like 등록 실패');
                }
            } else {
                alert('서버에러');
            }
        }
    });
}

function checkDuplicatedMail(id, email, auth) {
    var object = new Object();
    object.email = email;
    object.id = id;
    var json = JSON.stringify(object);
    $.ajax({
        type: "GET", //전송방식을 지정한다 (POST,GET)
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        url: "/auth.ajax",//호출 URL을 설정한다. GET방식일경우 뒤에 파라티터를 붙여서 사용해도된다.
        data: {
            "type": (auth != null && auth == 'auth') ? 'CheckMailAuth' : 'CheckMail',
            "value": json,
        },
        async: true,
        dataType: "text",//호출한 페이지의 형식이다. xml,json,html,text등의 여러 방식을 사용할 수 있다.
        beforeSend: function () {
            $('#emailProgress').removeClass('tag-hide');
            $('#emailCheck').addClass('tag-hide');
        },
        error: function () {
            console.log('Auth Ajax Failed');
            alert('Error');
            $('#emailProgress').addClass('tag-hide');
            $('#emailCheck').removeClass('tag-hide')
            return false;
        },
        success: function (Parse_data) {
            if (Parse_data != null) {
                var string = Parse_data + '';
                if (string.indexOf("error") >= 0) {
                    alert('Error');
                    if (!$('#emailProgress').hasClass('tag-hide')) {
                        $('#emailProgress').addClass('tag-hide')
                    }
                    if (!$('#emailCheck').hasClass('tag-hide')) {
                        $('#emailCheck').removeClass('tag-hide')
                    }
                    return false;
                } else if (string.indexOf("true") >= 0) {
                    if (!$('#emailProgress').hasClass('tag-hide')) {
                        $('#emailProgress').addClass('tag-hide');
                    }
                    if (!$('#emailCheck').hasClass('tag-hide')) {
                        $('#emailCheck').removeClass('tag-hide')
                    }
                    return true;
                } else {
                    alert('중복된 이메일이 있습니다. 메일을 확인해주세요.');
                    if (!$('#emailProgress').hasClass('tag-hide')) {
                        $('#emailProgress').addClass('tag-hide');
                    }
                    if (!$('#emailCheck').hasClass('tag-hide')) {
                        $('#emailCheck').removeClass('tag-hide')
                    }
                    return false;
                }
            } else {
                alert('서버에러');
                if (!$('#emailProgress').hasClass('tag-hide')) {
                    $('#emailProgress').addClass('tag-hide');
                }
                if (!$('#emailCheck').hasClass('tag-hide')) {
                    $('#emailCheck').removeClass('tag-hide')
                }
                return false;
            }
        }
    });
}

