  var optionList = [];



  function loadService(e){

    location.replace(location.origin+location.pathname+'?cat_id='+e.value);

  }


  function loadServiceBySubCat(e){

    const catId = $('#category').val();

    if(e.value=='all'){

      location.replace(location.origin+location.pathname+'?cat_id='+catId);

    }else{
      location.replace(location.origin+location.pathname+'?cat_id='+catId+'&subcat_id='+e.value);
    }
  
  }


  function populateOption(options){
      optionList = JSON.parse(options);
              console.log(optionList);

      for(let i=0;i<optionList.length;i++){

            $.post(`${baseUrl}get-option`, 

            {
              'index':i,
              'option':optionList[i]

            },

            function(response, status){
              $('#edit-service-option-container').append(response);
              loadOptionContent(i);
            });

          
      }


  }
  function showEditModal(e){
  
    optionList = [];

    const id = e.getAttribute('data-id');

    $.get(`${baseUrl}/get-service/${id}`, function(response, status){
      if(status=='success'){
        const data = JSON.parse(response);
        $('#edit-service-id').val(data['id']);
        $('#edit-service-name').val(data['name']);
        $('#edit-category').val(data['cat_id']);
        $('#edit-sub-category').val(data['sub_cat_id']);
        $('#edit-service-desc').val(data['description']);
        $('#edit-service-price').val(data['start_price']);
        
        populateOption(data['option']);

        
      }
    });
    showModal('editModal');
   

  }

  function showDeleteModal(e){
   const id = e.getAttribute('data-id');
   const serviceInput = document.getElementById('service-delete-id');
   const serviceCatId = e.getAttribute('data-cat-id');
   const serviceCatIdInput = document.getElementById('service-cat-id');
   
   serviceInput.value = id;
   serviceCatIdInput.value = serviceCatId;

   showModal('deleteModal');

  }


//load  service option
function loadOptionContent(id){
    $('#read-only-'+id).html(`Label : ${optionList[id].label}
          <br>
          Field type :  ${optionList[id].field_type}
          <br>
          Values :  ${optionList[id].value}`);
  }



  function removeOption(e,type){
    const id = $(e).data('id');
    
    optionList.splice(id, 1);
    if(type=='add'){
          $('#add-option-box-'+id).remove();

    }else{
          $('#edit-option-box-'+id).remove();
    }
  }
  function confirmEdit(e,type){
    const id = $(e).data('id');
    if(type=='add'){
      $('#add-field-'+id).hide();
      $('#add-option-'+id).show();
    }else{
      $('#edit-field-'+id).hide();
      $('#edit-option-'+id).show();
    }
      

    let values='';
    $('.values-'+id).each(function(){
        
        values+=$(this).val()+",";

      });
     values = values.slice(0, -1);
     let editedObj;
     if(type=='add'){
           editedObj = {"label":$('#label-'+id).val(),"field_type":$('#field-type-'+id).val(),"value":values};
      }else{
          editedObj = optionList[id];
          editedObj.label = $('#label-'+id).val();
          editedObj.field_type = $('#field-type-'+id).val();
          editedObj.value = values;
      }
      
      optionList[id] = editedObj;
      loadOptionContent(id);
      
  }

  
  function enableEdit(e,type){
    const id = $(e).data('id');
    if(type=='add'){
      $('#add-option-'+id).hide();
      $('#add-field-'+id).show();
    }else{
      $('#edit-option-'+id).hide();
      $('#edit-field-'+id).show();
    }
      

  }

 
  function removeField(e){
    $('#'+$(e).data('key')).remove();
  }

  function addOptionValue(e){


    const id = $(e).data('id');
    const randomId = Date.now();

    $('#edit-option-value-container-'+id).append(`<div style="margin:4px" id="${randomId}">

                <div class="row">
                  <div class="col-md-11">
                    <input type="text" class="values-${id} form-control" value="" >
                  </div>
                  <div class="col-md-1"><button data-key="${randomId}" onclick="removeField(this)" class="btn btn-danger">
                    <i class="b bi-dash"></i>
                  </button></div>
                </div>
              </div>`);
    

  }


$('#btn-show-add-service-modal').click(function(){
  optionList = [];
  showModal('addServiceModal');
});
    // edit service button
  $("#btn-edit-service").click(function(){
    
      $.post(`${baseUrl}/edit-service`, 
      {   

          service_id: $('#edit-service-id').val(),
          category: $('#edit-category').val(),
          sub_category: $('#edit-sub-category').val(),
          service_name: $('#edit-service-name').val(),
          service_price: $('#edit-service-price').val(),
          service_desc:$('#edit-service-desc').val(),
          options: JSON.stringify(optionList),


      },
        function(response){
         console.log(response);
         if(response=='success'){
            location.reload();
         }
      });
      
        
  });

  $(document).ready(function(){
    let optionCounter = 0;
    
  $("#add-category").change(function(){
    const catId = this.value;
    $.get(`${baseUrl}/get-sub-category/${catId}`, 
    
    function(data, status){
      if(status=='success'){


        const subCategories = JSON.parse(data);

        $('#add-sub-category').empty();
        $('#add-sub-category').append(`<option value="0"> Select Sub-category </option>`);

        for(let i=0; i<subCategories.length ; i++){

          const id = subCategories[i]['id'];
          const name = subCategories[i]['name'];

          
          $('#add-sub-category').append(`<option value="${id}"> ${name}</option>`);

        }
        
      }
    });
  });

   $("#edit-category").change(function(){
      const catId = this.value;
      $.get(`${baseUrl}/get-sub-category/${catId}`, 
      
      function(data, status){
        if(status=='success'){


          const subCategories = JSON.parse(data);

          $('#edit-sub-category').empty();
          $('#edit-sub-category').append(`<option value="0"> Select Sub-category </option>`);

          for(let i=0; i<subCategories.length ; i++){

            const id = subCategories[i]['id'];
            const name = subCategories[i]['name'];

            
            $('#edit-sub-category').append(`<option value="${id}"> ${name}</option>`);

          }
          
        }
      });
  });


  // option swith
  $("#add-service-option-switch").change(function(){
    if(($(this).is(':checked'))){

      $("#option-button").show();

    }else{
       $("#option-button").hide();
    }
        
  });


  // option button
  $("#option-button").click(function(){
    
    $('#add-service-option-container').append();

    $.get(`${baseUrl}service/add_option/${optionCounter}`, function(data){
      $("#add-service-option-container").append(data);
    });
    optionCounter++;
      
        
  });


  
  // add service button
  $("#btn-add-service").click(function(){
    console.log('start------------')
    
    console.log(optionList);
    console.log('end------------')
      $.post(`${baseUrl}/add-service`, 
      {   
          category: $('#add-category').val(),
          sub_category: $('#add-sub-category').val(),
          service_name: $('#add-service-name').val(),
          service_price: $('#add-service-price').val(),
          service_desc:$('#add-service-desc').val(),
          options: JSON.stringify(optionList),
      },
        function(response){
         console.log(response);
         if(response=='success'){
          location.reload();
        }
      });
      
        
  });


   



});






