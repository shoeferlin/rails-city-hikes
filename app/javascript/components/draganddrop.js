import Sortable from '@shopify/draggable/lib/sortable';
import buildMap from '../packs/map.js';

function draganddrop() {
  $(document).ready(function(){
    const sortable = new Sortable(document.querySelectorAll('#movable'), {
      draggable: 'li',
      handle: 'i',
      // plugins: [],
    });
    sortable.on('sortable:stop', (event) => updateListNr(event));
    // sortable.on('sortable:out', (event) => deleteListNr(event));
  });
}

function updateListNr(event) {
  const item_id = event.data.dragEvent.data.originalSource.dataset.id
  const itemNewIndex = event.data.newIndex

  console.log("id:", item_id)
  console.log("new index:", itemNewIndex)

  Rails.ajax({
    url: `/waypoints/${item_id}`,
    type: "PATCH",
    // data: `list_nr:${itemNewIndex}`,
    data: String(`list_nr=${itemNewIndex}`),
    success: function(data) {
      document.getElementById("map").dataset.waypoints = JSON.stringify(data);
      buildMap();
    }
  });

  // fetch('/waypoints/${item_id}', {
  //   method: 'patch',
  //   body: JSON.stringify({list_nr: itemNewIndex}),
  //   headers: {
  //     'Content-Type': 'application/json',
  //     'X-CSRF-Token': Rails.csrfToken()
  //   },
  //   credentials: 'same-origin'
  // }).then(function(response) {
  //   return response.json();
  // }).then(function(data) {
  //   console.log(data);
  // });

}

// function deleteListNr(event) {
//   const item_id = event.data.dragEvent.data.originalSource.dataset.id
//   console.log('Thiiiiiis')
//   console.log(this)
//   item_id.draggable('destroy');

//   Rails.ajax({
//     url: `/waypoints/${item_id}`,
//     type: "DELETE",
//     // data: `list_nr:${itemNewIndex}`,
//     // data: String(`list_nr=${itemNewIndex}`),
//     success: function(data) {
//     }
//   });
// }


export { draganddrop };

draganddrop();

  // const elements = document.querySelectorAll('#movable > li')
  // elements.forEach((element, index) => {
  //   console.log(index, element.dataset.id, element.value)
  // })
  // event.data.newContainer.children.forEach((e, index) => {
  //   console.log(index, e.dataset.id, e.value)
  // })
