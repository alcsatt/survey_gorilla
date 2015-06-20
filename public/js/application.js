$(document).ready(function() {
  $('.add-question').on('click', function(event){
    event.preventDefault();
    $.ajax( $(this).attr('href') )
      .done(function(data) {
        $('.question').append(data);
        $('form').on('submit', function(e){
          e.preventDefault();
          var surveyId = $(this).closest('.single-survey').attr('id');
          $.ajax($(this).attr('action'), {
            method: 'post',
            data: $('form').serialize(),
            dataType: 'json'
          })
          .done(function(question){
            $('form').hide();
            var link = "/surveys/" + surveyId + "/questions/" + question.id
            $('.question').append(question);
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

