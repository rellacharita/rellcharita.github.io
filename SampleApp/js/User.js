$(document).ready(function () {
    //console.log('hi');
    $.ajax({
        type: 'GET',
        url: "/UserDetails.aspx/getUserData",
        success: function (result) {
            console.log(result);
            var parsed = $.parseJSON(result);
            $.each(parsed, function (i, jsondata) {
                $("#GridView1").append("Name: " + jsondata.Name +  "Email: " + jsondata.Email);
            });
        }
    });
    
}


)