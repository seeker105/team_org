$(document).ready(function() {
    var max_fields      = 25; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    // var add_button      = $(".add_field_button"); //Add button ID

    var x = 1; //initial text box count
    $(".add_field_button").click(function(e){ //on add input button click
        e.preventDefault();
        if(x < max_fields){ //max input box allowed
          $(wrapper).append('<div class="player-' + x +'">\
First Name: <input type="text" name="player[first_name][]" /> \
Last Name: <input type="text" name="player[last_name][]" /> \
Mobile Number: <input type="text" name="player[mobile_number][]" /> \
<a href="#" class="remove_field">Remove</a></div>');
            x++; //text box increment
        }
    });

    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault();
        $(this).parent('div').remove(); x--;
    })
});
