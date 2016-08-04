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
<%= label_tag "first_name" %> \
<%= text_field_tag "first_name[]" %> \
<%= label_tag "last_name" %> \
<%= text_field_tag "last_name[]" %> \
<%= label_tag "mobile_number" %> \
<%= text_field_tag "mobile_number[]" %>\
</div><br />');
            x++; //text box increment
        }
    });

    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
        e.preventDefault();
        $(this).parent('div').remove(); x--;
    })
});
