$(document).ready(function() {
    var max_fields      = 25; //maximum input boxes allowed
    var wrapper         = $(".input_fields_wrap"); //Fields wrapper
    // var add_button      = $(".add_field_button"); //Add button ID

    var x = 1; //initial text box count
    $(".add_field_button").click(function(e){ //on add input button click
        e.preventDefault();
        $("#save_roster").removeClass('hidden');
        if(x < max_fields){ //max input box allowed
          $(wrapper).append('<div class="player-'+ x +'">\
<label for="first_name">First name</label> <input type="text" name="first_name[]" id="first_name_"> \
<label for="last_name">Last name</label> <input type="text" name="last_name[]" id="last_name_"> \
<label for="mobile_number">Mobile number</label> <input type="text" name="mobile_number[]" id="mobile_number_">\
</div>');
            x++; //text box increment
        }
    });
});
