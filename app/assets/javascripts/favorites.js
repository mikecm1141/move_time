const ids = {
  "add": "remove",
  "remove": "add"
}

$(document).ready(function() {
  $('#favorites').on('click', function(event) {
    data = {
      geo_id: $('#geoId').val(),
      user_id: $('#userId').val()
    }

    if (event.target.id === 'add') {
      fetch('/api/v0/favorites', {
        method: 'POST',
        headers: { 'Content-Type':'application/json' },
        body: JSON.stringify(data)
      })
        .catch(error => console.error({ error }))
        .then(data => changeLink(data.status));
    } else if (event.target.id === 'remove') {
      fetch('/api/v0/favorites', {
        method: 'DELETE',
        headers: { 'Content-Type':'application/json' },
        body: JSON.stringify(data)
      })
        .catch(error => console.error({ error }))
        .then(data => changeLink(data.status));
    }
  });

  function changeLink(status) {
    var spanTag = $('#favorites')[0].children[0];

    if (status === 201) {
      spanTag.id = 'remove';
      spanTag.text = 'Remove from Favorites';
    } else if (status === 204) {
      spanTag.id = 'add';
      spanTag.text = 'Add to Favorites';
    }
  }
});
