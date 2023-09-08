//product.js

//상품 수정 이미지 미리보기 기능(도면)
document.getElementById('fileInputUpdate1').addEventListener('change', function () {
    var fileInputUpdate1 = this;
    var imagePreviewUpdate1 = document.getElementById('imagePreviewUpdate1');
    
    if (fileInputUpdate1.files && fileInputUpdate1.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            imagePreviewUpdate1.src = e.target.result;
        };

        reader.readAsDataURL(fileInputUpdate1.files[0]);
    }
});

//상품 수정 이미지 미리보기 기능(상품 이미지)
document.getElementById('fileInputUpdate2').addEventListener('change', function () {
    var fileInputUpdate2 = this;
    var imagePreviewUpdate2 = document.getElementById('imagePreviewUpdate2');
    
    if (fileInputUpdate2.files && fileInputUpdate2.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            imagePreviewUpdate2.src = e.target.result;
        };

        reader.readAsDataURL(fileInputUpdate2.files[0]);
    }
});
