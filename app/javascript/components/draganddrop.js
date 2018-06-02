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
    console.log('Test1')
    const sortable = new Sortable(document.querySelectorAll('#movable'), {
      draggable: 'li',
      classes: 'li-item',
      // handle: 'move'
    });
    console.log('b')
    // console.log(sortable)
    console.log('a')
    console.log(sortable.containers)
    // sortable.on('sortable:start', () => console.log('sortable:start'));
    // sortable.on('sortable:sort', () => console.log('sortable:sort'));
    // sortable.on('sortable:sorted', () => console.log('sortable:sorted'));
    // sortable.on('sortable:stop', () => console.log('sortable:stop'));
  });
}


function save_order() {
     $("#movable").sortable({
         update: function () {
             var order1 = $('#movable').sortable('toArray').toString();

             alert("Order 1:" + order1); //Just showing update
             $.ajax({
                 type: "POST",
                 url: "/echo/json/",
                 data: "order1=" + order1,
                 dataType: "json",
                 success: function (data) {
                 }
             });
         }
     }).disableSelection();
 };


export { draganddrop };

draganddrop();
