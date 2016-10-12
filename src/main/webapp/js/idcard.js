/**
 * Created by a1246_000 on 2016/10/3.
 */

var idNumberReg  = new RegExp(/^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/);
var phoneReg = new RegExp(/^\d{11}$/);
var emailReg = new RegExp(/^(\w)+(\.\w+)*@(\w)+((\.\w{2,3}){1,3})$/);
function backHome(){
    window.location.href="index.jsp";
}

function submitForm(){
    $("#submitFormButton").attr("disabled","disabled");
    var flag = true;
    var cardtype = $("#cardtype").val();
    if(!cardtype){
        $("#cardTypeError").html("证件类型不能为空！");
        flag = false;
    }else{
        $("#cardTypeError").html("");
    }
    var temp = $("#idcardnum").val();
    if(!temp){
        $("#idCardNumError").html("证件号码不能为空！");
        flag = false;
    }else{
        if(cardtype == '0' && !idNumberReg.test(temp)){
            $("#idCardNumError").html("身份证格式不正确！");
            flag = false;
        }else{
            $("#idCardNumError").html("");
        }
    }
    temp = $("#name").val();
    if(!temp){
        $("#nameError").html("姓名不能为空！");
        flag = false;
    }else{
        $("#nameError").html("");
    }
    temp = $("#phone").val();
    if(!temp){
        $("#phoneError").html("手机号码不能为空！");
        flag = false;
    }else{
        if(phoneReg.test(temp)){
            $("#phoneError").html("");
        }else{
            $("#phoneError").html("手机号码格式不正确！");
            flag = false;
        }

    }
    temp = $("#email").val();
    if(!temp){
        $("#emailError").html("邮箱不能为空！");
        flag = false;
    }else{
        if(emailReg.test(temp)){
            $("#emailError").html("");
        }else{
            $("#emailError").html("邮箱格式不正确！");
            flag = false;
        }
    }
    $("#frontCardError").html("");
    $("#backCardError").html("");
    if(flag){
        $("#uploadidcard").submit();
    }else{
        $("#submitFormButton").removeAttr("disabled");
    }
}