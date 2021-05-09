$(document).ready(function () {
    console.log("hello in edit file")
    $('#show-password-edit').click(function (e) { 
        e.preventDefault();
        $(".pass-edit-box").fadeToggle("slow");
    });
});