$(document).ready(function() {
  $('.add-question').on('click', function(event){
    event.preventDefault();
    $.ajax( $(this).attr('href') )
      .done(function(data) {
        $('.question').append(data);
        $('form').on('submit', function(e){
          e.preventDefault();
          $.ajax($(this).attr('action'), {
            method: 'post',
            data: $('form').serialize()
          })
          .done(function(formData){
            $('form').hide();
            $('.question').append(formData);
          })
          .fail(function(error){
            console.log(error);
          })
        })
      })
      .fail(function(error) {
        console.log(error);
      })
    });
  });

