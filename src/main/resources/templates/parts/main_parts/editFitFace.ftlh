<#macro page>

    <div class="add-product-button">
        <form method="post" action="/main/avatar"  enctype="multipart/form-data">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <!-- Modal -->
            <div class="modal fade" id="FitFace" data-backdrop="static" data-keyboard="false"
                 tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">                <div class="modal-dialog" role="document">

                    <div class="modal-content">

                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Желаете изменить FitFace?</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="container" align="center">
                            <div class="row" align="center">
                                <input class="btn " type="file" id="file" name="files" />
                            </div>
                            <div class="row" align="center">
                                <span id="output"></span>
                            </div>
                        </div>
                        <button class="btn btn-success" type="submit">Сохранить изменения</button>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script>
        function handleFileSelect(evt) {
            var file = evt.target.files; // FileList object
            var f = file[0];
            // Only process image files.
            if (!f.type.match('image.*')) {
                alert("Image only please....");
            }
            var reader = new FileReader();
            // Closure to capture the file information.
            reader.onload = (function(theFile) {
                return function(e) {
                    // Render thumbnail.
                    var span = document.createElement('span');
                    span.innerHTML = ['<img class="thumb" width="500" height="500"  title="', escape(theFile.name), '" src="', e.target.result, '" />'].join('');
                    document.getElementById('output').insertBefore(span, null);
                };
            })(f);
            // Read in the image file as a data URL.
            reader.readAsDataURL(f);
        }
        document.getElementById('file').addEventListener('change', handleFileSelect, false);
    </script>
</#macro>