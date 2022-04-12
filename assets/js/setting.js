
    $('#pf_img').click(function(){
      $('#upload_img').click();
      

    });
$('#remove_logo').click(function(){
      $('#pf_img').show();
      $(this).hide();

      $('#img_container').hide();
      $('#avatar').show();

    });


    $('#upload_img').change(function(){
      $('#avatar').hide();
      $('#pf_img').hide();
      $('#img_container').show();
      $('#remove_logo').show();

      const frame = document.getElementById('preview_img');
      frame.src = URL.createObjectURL(event.target.files[0]);
    });