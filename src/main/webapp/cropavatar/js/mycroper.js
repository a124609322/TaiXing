var $image;
var imgDiv;
var imgInput;
function createCanvas(){
    var canvas =  $image.cropper('getCroppedCanvas',{ width: 320, height: 180 });
    $("#"+imgDiv).html(canvas);
    $("#"+imgInput).val(canvas.toDataURL('image/jpeg'));
}

function inputFile(){
    $("#inputImage").click();
}

function setDragMode(mode){
    $image.cropper('setDragMode',mode);
}
function zoom(num){
    $image.cropper('zoom',num);
}
function move(left,top){
    $image.cropper('move',left,top);
}
function rotate(num){
    $image.cropper('rotate',num);
}

function scale(action){
    $image.cropper(action,-1);
}
function reset(){
    $image.cropper('reset');
}

function imgClick(imgDivs,imgInputs){
    imgDiv = imgDivs;
    imgInput = imgInputs
}
$(function(){
    $image = $('#image');
    var options = {
        //aspectRatio: NaN,
        aspectRatio: 16 / 10,
        preview: '.img-preview',
        crop: function (e) {
        }
    };
    // Cropper
    $image.cropper(options);

    // Import image
    var $inputImage = $('#inputImage');
    var URL = window.URL || window.webkitURL;
    var blobURL;

    if (URL) {
        $inputImage.change(function () {
            var files = this.files;
            var file;

            if (!$image.data('cropper')) {
                return;
            }

            if (files && files.length) {
                file = files[0];

                if (/^image\/\w+$/.test(file.type)) {
                    blobURL = URL.createObjectURL(file);
                    $image.one('built.cropper', function () {

                        // Revoke when load complete
                        URL.revokeObjectURL(blobURL);
                    }).cropper('reset').cropper('replace', blobURL);
                    $inputImage.val('');
                } else {
                    window.alert('Please choose an image file.');
                }
            }
            $("#createCanvasButton").removeAttr("disabled");
        });
    } else {
        $inputImage.prop('disabled', true).parent().addClass('disabled');
    }
})
