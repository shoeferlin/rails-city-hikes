// import { Sortable } from '@shopify/draggable';
import Sortable from '@shopify/draggable/lib/sortable';
// import Sortable from '@shopify/draggable/lib/sortable';


// $(document).ready(function(){
//     console.log('Test2')
//     new Draggable.Draggable(document.querySelectorAll('.edit-card ul'), {
//       draggable: 'li'
//     })
//     .on('drag:start', () => console.log('drag:start'))
//     .on('drag:move',  () => console.log('drag:move'))
//     .on('drag:stop',  () => console.log('drag:stop'));

// });

// import { Sortable } from '@shopify/draggable';

function draganddrop() {
  $(document).ready(function(){
    const sortable = new Sortable(document.querySelectorAll('#movable'), {
      draggable: 'li',
      // classes: 'li-item',
      // handle: 'move'
    });

    let elements = sortable.getDraggableElementsForContainer(document.querySelector('#movable'))

    // sortable.on('sortable:start', () => updateListNr());
    // sortable.on('sortable:sort', () => console.log('sortable:sort'));
    // sortable.on('sortable:sorted', () => console.log('sortable:sorted'));
    // sortable.on('sortable:stop', () => initListNrUpdater());
    sortable.on('sortable:stop', (event) => updateListNr(event));
  });
}


// function initListNrUpdater(elements) {
//   setTimeout(updateListNr(), 1000)
// }

function updateListNr(event) {
  console.log(event);
  // Get us a NodeElement
  const listNodeElements = event.data.newContainer.children;

  // forEach
  var i;
  for (i = 1; i < listNodeElements.length - 1; i++) {
    console.log(listNodeElements[i].dataset.id);
  }

  // const array = [...listNodeElements];
  // console.log(array);
  // // Convert listElements into Array
  // const listElems = Array.prototype.slice.call(listNodeElements);
  // console.log(listElems);
  // const listIds = listElems.map((li) => li.dataset.id);
  // console.log(listIds);
    // console.log(Rails.csrfToken())
    // console.log("feueugieguiekj")

    // const waypointsList = document.querySelectorAll('#movable li[class="waypoint"]')
    // waypointsList.forEach( function (waypoint) {
    //   console.log(waypoint)
    // });

    // Rails.ajax({
    //   url: "/waypoints/sort_waypoints",
    //   type: "POST",
    //   data: "data=[{id: 19, list_nr: 1}, {id: 1, list_nr: 2}, {id: 3, list_nr: 3}]",
    //   success: function(data) {
    //     console.log(data);
    //   }
    // });
}


export { draganddrop };

draganddrop();
