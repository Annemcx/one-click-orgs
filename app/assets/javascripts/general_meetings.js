OneClickOrgs.renumberChildFields = function(containers)
{
  // Look for inputs with a name containing a Rails array parameter
  // (e.g. '[34]') and renumber sequentially.
  //
  // TODO: Expand to deal with 'select' and 'textarea' elements.

  var regexp = /\[(\d+)\]/;

  $(containers).each(function(index, container)
  {
    container = $(container);
    container.find('input').each(function(inputIndex, inputElement)
    {
      if ( regexp.test($(inputElement).attr('name')) ) {
        var existingId = $(inputElement).attr('name').match(regexp)[1];
        $(inputElement).attr('name', $(inputElement).attr('name').replace('[' + existingId + ']', '[' + index.toString() + ']'));
        $(inputElement).attr('id', $(inputElement).attr('id').replace('_' + existingId + '_', '_' + index.toString() + '_'));
      }
    });
  });
};

$(document).ready(function () {
  $('#general_meeting_annual_general_meeting').change(function () {
    if ($('#general_meeting_annual_general_meeting:checked').val() == '1') {
      $('#annual_general_meeting_fields').show();
    } else {
      $('#annual_general_meeting_fields').hide();
    }
  });

  $(document).on('click', 'ol.agenda_items a.delete', function(event)
  {
    var parent = $(this).closest('ol');
    $(this).closest('li').remove();
    OneClickOrgs.renumberChildFields(parent.children('li'));
    event.preventDefault();
  });

  $(document).on('click', 'ol.agenda_items a.up', function(event)
  {
    var thisLi = $(this).closest('li');
    var prevLi = thisLi.prev('li');
    if (prevLi.length) {
      thisLi.detach();
      prevLi.before(thisLi);
    }
    OneClickOrgs.renumberChildFields($(this).closest('ol').children('li'));
    event.preventDefault();
  });

  $(document).on('click', 'ol.agenda_items a.down', function(event)
  {
    var thisLi = $(this).closest('li');
    var nextLi = thisLi.next('li');
    if (nextLi.length) {
      thisLi.detach();
      nextLi.after(thisLi);
    }
    OneClickOrgs.renumberChildFields($(this).closest('ol').children('li'));
    event.preventDefault();
  });

  $('#add_agenda_item').click(function(event)
  {
    var association = $(this).data('association');
    var container = $('#' + $(this).data('container'));
    var content = $('.' + association + '_fields_template').html();
    var regexp = new RegExp('new_' + association, 'g');
    var newId = new Date().getTime();

    container.append(content.replace(regexp, newId));

    OneClickOrgs.renumberChildFields(container.children('li'));

    event.preventDefault();
  });
});


  // $('.new_survey #new_question_button').click(function (event)
  // {
  //   var association, content, regexp, newId;

  //   association = $(this).attr('data-association');
  //   content = $(this).closest('.fields').find('.' + association + '_fields_template').html();
  //   regexp = new RegExp('new_' + association, 'g');
  //   newId = new Date().getTime();

  //   $(this).parent().before(content.replace(regexp, newId));

  //   $('div.' + association + '_fields').each(function (index)
  //   {
  //     $(this).attr('id', association + '_fields_' + (index + 1));
  //     $(this).find('span.index').text(index + 1);
  //   });

  //   event.preventDefault();
  // });
