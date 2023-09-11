//product.js

//상품 이미지 미리보기 기능(중복된 코드)
function setupImagePreview(inputId, previewId) {
    document.getElementById(inputId).addEventListener('change', function () {
        var fileInput = this;
        var imagePreview = document.getElementById(previewId);
        
        if (fileInput.files && fileInput.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                imagePreview.src = e.target.result;
            };

            reader.readAsDataURL(fileInput.files[0]);
        }
    });
}

function ProductDelete() {
	alert("상품삭제가 완료되었습니다.");
	document.product_delete.submit();
}