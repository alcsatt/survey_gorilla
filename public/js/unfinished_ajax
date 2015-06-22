 $('#edit-survey').on('click', function(event){
    event.preventDefault;
    $.ajax($(this).attr('href'))
    .done(function(editForm){
      $('#edit-survey').hide();
      $('#add-edit-survey').append(editForm);
    })
    .fail(function(error) {
        console.log(error);
      })
  });

  $('.add-choice').on('click', function(e){
    e.preventDefault();
    $.ajax( $(this).attr('href') )
    .done(function(choiceForm){
      $('.choice').append(choiceForm);
      $('add-choice').hide();
    })
    .fail(function(error){
      console.log(error);
    })
  });
