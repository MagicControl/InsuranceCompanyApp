$(document).ready(function(){
    
    var inputField = $('#uploadFile');
    var clientsLoaded = $('.clients-loaded');
    var errorField = $('.error');
    inputField.change(function() {
        clientsLoaded.text('');
        errorField.text('');
        if(!inputField.prop('files')[0]){
            return;
        }
        var fd = new FormData();

        fd.append('csvFile', inputField.prop('files')[0]);

        $.ajax({
            url: "/client/loadCsvUserData/",
            data:  fd,
            processData: false,
            contentType: false,
            type: 'POST',
            success: function (data) {
                clientsLoaded.text(data + ' new clients uploaded');
            },
            error: function (res) {
                errorField.text('Processing error. Please, use *.csv file only');
            }
        });
    });
});

