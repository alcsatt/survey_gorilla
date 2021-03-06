$(document).ready(function() {
  $('.add-question').on('click', function(event){
    event.preventDefault();
    $.ajax( $(this).attr('href') )
      .done(function(data) {
        $('.add-question').hide();
        $('.question').append(data);
        $('form').on('submit', function(e){
          e.preventDefault();
          $.ajax($(this).attr('action'), {
            method: 'post',
            data: $('form').serialize(),
            dataType: 'json'
          })
          .done(function(formData){
            var surveyId = $('.survey').attr('id')
            var link = "/surveys/" + surveyId + "/questions/" + formData.id
            var answerLink = "/surveys/" + surveyId + "/questions/" + formData.id + "/choices/new"
            $('form').hide();
            $('.question').append('<div class = "new-choice"><a href = ' + link + '>' + formData.body + '</a></div>');
            $('.new-choice').append('<div><a href = ' + answerLink + '>Add new answer</a></div><br>')
            $('.add-question').show();
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
 $('#edit-survey').on('click', function(event){
    event.preventDefault();
    $.ajax($(this).attr('href'))
    .done(function(editForm){
      $('#edit-survey').hide();
      $('#add-edit-survey').append(editForm);
      $('#edit-this-survey').on('submit', function(e){
        e.preventDefault();
        $.ajax($(this).attr('action'), {
          method: 'post',
          data: $('#edit-this-survey').serialize(),
          dataType: 'json'
        })
        .done(function(title){
          $('h1').text(title.title);
          $('#edit-survey').show();
          $('#edit-this-survey').remove();
        })
        .fail(function(error) {
        console.log(error);
        })
      })
    })
    .fail(function(error) {
        console.log(error);
      })
  });
 $('.add-new-choice').on('click', function(event){
    event.preventDefault();
    $(this).parent().attr('id', 'temp');
    $.ajax( $(this).attr('href') )
    .done(function(choiceForm){
      $('#temp').append(choiceForm);
      $('#temp').children('a').hide();
      $('.add-new-choice').removeAttr('id');
      $('.choice').removeAttr('id');
    })
    .fail(function(error){
      console.log(error);
    })
  });
});

