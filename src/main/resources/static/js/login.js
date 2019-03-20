$(document).ready(function() {

    $("#pwdToggle").prop('checked', false);
    $("#pwdInputField").type = "password";
    $("#pwdToggle").change(function() {
        if(this.checked) {
            $("#pwdInputField")[0].type = "text";
        } else {
            $("#pwdInputField")[0].type = "password";
        }
    });
});
