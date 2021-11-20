var display = true

$(function(){
    $('body').draggable()

    window.addEventListener('message', function(event){
        if(event.data.action == 'display'){
            if(display){
                $('body').fadeOut(500);
            }else{
                $('body').fadeIn(500);
            }
        }

        if(event.data.inCar == true){
            $('body').fadeIn(500);
        }

        if(event.data.inCar == false){
            $('body').fadeOut(500);
        }

        $('.text').html(event.data.street)
    })

    document.onkeyup = function(event) {
        if (event.key == 'Escape') {
            $.post('https://fs_compassandstreet/close', JSON.stringify({}));
        }
    }
})