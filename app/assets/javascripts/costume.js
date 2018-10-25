$(window).load(function() {
  console.log("Inside Custome.js");
  submite_button = false;
  // Validate Email
  function checkEmail(email) {
    var isValid = true;
    var filter = /@inmar.com\s*$/;
    if (!filter.test(email))
      isValid = false;
    return isValid;
  }

  function button_enable(){
    if(submite_button){
      $("#sign-up-button").css({"opacity": "100" ,"pointer-events": "auto"});
    }else{
      $('#sign-up-button').css({"opacity": "0.5" ,"pointer-events": "none"});
    }
  };

  $("#user_email").bind('input', function(){
    if (checkEmail($("#user_email").val())){
      submite_button = true;
      button_enable();
    }else{
      submite_button = false;
      button_enable();
    }
  });

  var pwd         = $('#user_password');
  var conf_pwd    = $('#user_password_confirmation');
  var pwdIdSet    = $('#setPasswordMessage');

  setCheckPasswordStrength(pwd,conf_pwd,pwdIdSet);

  function setCheckPasswordStrength(pwd, conf_pwd, pwdIdSet)
  {
    submit_button_status =  false;
    upperCase = new RegExp('[A-Z]');
    lowerCase = new RegExp('[a-z]');
    numbers = new RegExp('[0-9]');
    specialSet = new RegExp('[\\x20-\\x2F\\x3A-\\x40\\x5B-\\x60\\x7B-\\x7E\\x80-\\xFF]');
    minimum = new RegExp('.{6,}');

    $('.confirmation-password').hide();

    $('#user_password').on('keyup', function(e) {
      //Password must contain at least one digit .
      if(numbers.test($(this).val())){
        $("#digit").prop("checked", true);
        number =  true;
      }else{
        $("#digit").prop("checked", false);
        number = false;
      }
      //Password must contain at least one upper case letters .
      if(upperCase.test($(this).val())){
        $("#up-case-char").prop("checked", true);
        upcase =  true;
      }else{
        $("#up-case-char").prop("checked", false);
        upcase =  false;
      }
      //Password must contain at least one lower case letters .
      if(lowerCase.test($(this).val())){
        $("#low-case-char").prop("checked", true);
        lowcase =  true;
      }else{
        $("#low-case-char").prop("checked", false);
        lowcase =  false;
      }
      //Password must contain at least one special characters.
      if(specialSet.test($(this).val())){
        $("#special-char").prop("checked", true);
        special =  true;
      }else{
        $("#special-char").prop("checked", false);
        special =  false;
      }
      //Password must contain minimum 6 letter.
      if(minimum.test($(this).val())){
        $("#6-char").prop("checked", true);
        min =  true;
      }else{
        $("#6-char").prop("checked", false);
        min =  false;
      }

      if (number && upcase && lowcase && special && min){
        $('.confirmation-password').show();
      }else{
        $('#user_password_confirmation').val('');
        $('.confirmation-password').hide();
      }

    });

    $('#user_password_confirmation, #user_password').on('keyup', function(e) {
      if (($('#user_password_confirmation').val() != '') & ($('#user_password').val() != '')){
        if(($('#user_password_confirmation').val() == $('#user_password').val()) || ($('#user_password').val() == $('#user_password_confirmation').val())){
          $("#password-matched").prop("checked", true);
        }else{
          $("#password-matched").prop("checked", false);
        }
      }else{
        $("#password-matched").prop("checked", false);
      }
    });
  }


});