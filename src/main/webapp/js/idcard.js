/**
 * Created by a1246_000 on 2016/10/3.
 */

function backHome(){
    window.location.href="index.jsp";
}

function submitForm(){
    $("#submitFormButton").attr("disabled","disabled");
    var flag = true;
    var temp = $("#cardtype").val();
    if(!temp){
        $("#cardTypeError").html("证件类型不能为空！");
        flag = false;
    }else{
        $("#cardTypeError").html("");
    }
    temp = $("#idcardnum").val();
    if(!temp){
        $("#idCardNumError").html("证件号码不能为空！");
        flag = false;
    }else{
        $("#idCardNumError").html("");
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
        $("#phoneError").html("电话号码不能为空！");
        flag = false;
    }else{
        $("#phoneError").html("");
    }
    temp = $("#email").val();
    if(!temp){
        $("#emailError").html("邮箱不能为空！");
        flag = false;
    }else{
        $("#emailError").html("");
    }
    if(flag){
        $("#uploadidcard").submit();
    }else{
        $("#submitFormButton").removeAttr("disabled");
    }
}