'use strict'
let activitjson = {
    activityBean:
    {
        id: null,
        title: null,
        content: null,
        startTime: null,
        endTime: null,
        imgPath: null
    },
    base64FileBean:
    {
        fileName: null,
        base64: null,
        fileType: null
    }
}

$().ready(
    // 取直並將ActivityBean送出等待回應
    function () {

        let url
        let idIndexOf = window.location.href.indexOf('-');
        let id = window.location.href.substring(idIndexOf + 1);
        if (id > 1) {

            selectByID(id)
        }
    },
)
function selectByID(id) {
    $.ajax({
        url: "http://localhost:8080/HappyLearning/ActivitySelect-" + id,
        method: "GET",
        dataType: "JSON",
        success: function (activity) {
            activitjson.activityBean = activity;
            activitjson.activityBean.id = id
            changeHtmlActivity();
        },
        error: function (err) { alert("資料獲取失敗，請刷新網頁!") },
    });
}
function saveActivityBean() {
    let activityBean = activitjson.activityBean
    if (!activityBean.title > 0) {
        Swal.fire({
            icon: 'error',
            title: '上傳失敗',
            text: "標題為空"
        })
    } else if (!activityBean.content > 0) {
        Swal.fire({
            icon: 'error',
            title: '上傳失敗',
            text: "內容為空"
        })
    } else if (!activityBean.startTime > 0 || !activityBean.endTime > 0) {
        Swal.fire({
            icon: 'error',
            title: '上傳失敗',
            text: "時間為空"
        })
    } else {
        let reqMethod = "PUT";
        if (!activityBean.id > 0) {
            reqMethod = "POST"
        }

        console.log(activitjson.activityBean);
        console.log(JSON.stringify(activitjson));
        $.ajax({
            url: "Activity_OP",
            method: reqMethod,
            dataType: "JSON",
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(activitjson),
            success: function (res) {
                $("body").append($(`<form action="ActivitiesOP" method="GET" id="onlyPost"></form>`))
                $("#onlyPost").submit()
            },
            error: function (err) {
                Swal.fire({
                    icon: 'error',
                    title: '上傳失敗',
                    text: err
                })
            },
        });
    }



}

function updeBase64(file) {

    new Promise((resolve, reject) => {
        // 建立FileReader物件
        let reader = new FileReader()
        // 註冊onload事件，取得result則resolve (會是一個Base64字串)
        reader.onload = () => { resolve(reader.result) }
        // 註冊onerror事件，若發生error則reject
        reader.onerror = () => { reject(reader.error) }
        // 讀取檔案
        reader.readAsDataURL(file)
    }).then(base64 => {

        activitjson.base64FileBean.fileType = file.type.replace("image/", ""); // 把編碼後的字串return
        console.log(activitjson.base64FileBean.fileType);
        activitjson.base64FileBean.base64 = base64; // 把編碼後的字串return
        $('.u-image-1').attr('src', activitjson.base64FileBean.base64);
    }).catch(err => {
        Swal.fire({
            icon: 'error',
            title: '圖片格式錯誤錯誤',
            text: err
        })
    })
}
function changeHtmlActivity() {
    $("#title").html(activitjson.activityBean.title);
    $("#content").html(activitjson.activityBean.content);
    console.log(activitjson.activityBean.imgPath != 'null')
    console.log(activitjson.activityBean.imgPath > 0)
    if (activitjson.activityBean.imgPath != 'null' && activitjson.activityBean.imgPath != null) {
        $("#imgPath").attr('src', activitjson.activityBean.imgPath)
    }
    let activityTime = `活動時間:${activitjson.activityBean.startTime} ~ ${activitjson.activityBean.endTime}`
    $("#activityTime").html(activityTime);

}


function changeVal() {
    let inputValue = $('#content').html();
    if (!activitjson.activityBean.content > 0) {
        inputValue = null;
    }
    Swal.fire({
        input: 'textarea',
        inputLabel: '標題',
        heightAuto: false,
        customClass: {
            popup: "swal-popup-changeVal",
            input: 'swal-textarea-1'

        },
        inputValue: inputValue,
        inputPlaceholder: '請輸入內容',

        inputValidator: (value) => {
            $('#content').html(value);
            activitjson.activityBean.content = value;
        },
        showCancelButton: true
    })


    console.log(e.innerHTML)
}
function changeH1title(e) {
    let inputValue = $('#title').html();
    if (!activitjson.activityBean.title > 0) {
        inputValue = null;
    }

    Swal.fire({
        title: '標題',
        input: 'text',
        width: '800px',
        inputValue: inputValue,
        inputPlaceholder: '請輸入內容',
        showCancelButton: true,
        inputValidator: (value) => {
            if (!value) {
                return '請輸入標題!'
            } else {
                $('#title').html(value);
                activitjson.activityBean.title = value;
            }
        }
    })

}
function changeimg(e) {
    $("#avatar").click();
    $("#avatar").change(function (e) {
        updeBase64(e.target.files[0]);
    })

}
function changeTime(e) {
    let startTime;
    let endTime;
    Swal.fire({
        title: '<h2>請輸入時間<h2>',
        width: "700px",
        html: `
                <h4  id="activityTime"  class="u-text u-text-default u-text-4">
                    <div> 
                    <input type="datetime-local" id="startTime" value="${activitjson.activityBean.startTime}"> ~ <input type="datetime-local" id="endTime" value="${activitjson.activityBean.endTime}" >
                    </div>
                </h4>
                `,
        stopKeydownPropagation: false,

        preConfirm: () => {
            startTime = $(Swal.getPopup().querySelector('#startTime')).val();
            endTime = $(Swal.getPopup().querySelector('#endTime')).val();
            if (startTime < 1 || endTime < 1) {
                Swal.showValidationMessage(`請輸入時間!`)
            } else if (new Date(endTime) <= new Date(startTime)) {
                Swal.showValidationMessage(`結束時間必須大於開始時間`)
            } else if (activitjson.activityBean.id < 1 && new Date(startTime) < new Date()) {
                Swal.showValidationMessage(`開始時間必須比今天大`)
            } else {
                activitjson.activityBean.startTime = startTime.replace("T", " ");
                activitjson.activityBean.endTime = endTime.replace("T", " ");
                changeHtmlActivity();
            }

        }


    })
}