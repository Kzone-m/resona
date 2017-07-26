$(document).ready(function(){
/* このページで使用するグローバル変数 */
  var instrument_id = 1
  var brand_id = 2

/* ページがロードされた瞬間に実行される関数 */
  $(window).load(function () {
    // ロードされた瞬間にピクチャーのラベル文字列を消去する
    $("#file-wrapper").text("");
    $(".nested-fields").each(function(i, element){
      if(i !== 0){
        element.remove();
      }else{
        return true;
      }
    })
  });


/* 投稿する写真のサイズを設定 */
  $('#post_picture').bind('change', function() {
    var size_in_megabytes = this.files[0].size/1024/1024;
    if (size_in_megabytes > 5) alert('Maximum file size is 5MB. Please choose a smaller file.');
  });

/* 画像投稿フォームを作成する関数 -> showImage関数の中で使用される */
  $("#file-wrapper").on("click", function(){
    $("#file")[0].click();
  });

/* 空の画像投稿inputを削除する関数 */
  $("#new_sell_item").submit(function(){
    $("#file-wrapper").siblings("#remove-btn")[0].click();
  });

/* ユーザーが楽器を選択した時の処理をする関数 */
  $('#sell_item_instrument_id').on('change', function(){
    // グローバル変数の楽器idの値をユーザーが選択した値で更新する
    instrument_id = $(this).val();
    brand_id = $("#sell_item_brand_id").val();

    // Categoryのオプションを一旦削除
    $('#sell_item_category_id').empty();

    // Product Modelのオプションを一旦削除
    $('#sell_item_product_model_id').empty();

    // 新しくCategoryのoptionに設定する値を取得
    var newCategoryList = gon.categories[$(this).val()];

    // 新しくProduct Modelのoptionに設定する値を取得
    var newProductModelList = gon.models[$(this).val()][brand_id];

    // Category Selectに表示される値をユーザーが選んだ値によって更新する
    $.map(newCategoryList, function(value,key){
      $('#sell_item_category_id').append($('<option>').val(key).text(value));
    });

    // Product Model Selectに表示される値をCategory Selectに基づいた値によって更新する
    $.map(newProductModelList, function(value,key){
      $('#sell_item_product_model_id').append($('<option>').val(key).text(value));
    });
  });

/* ユーザーがブランドを選択した時の処理をする関数 */
  $('#sell_item_brand_id').on('change', function(){
    // 元のoptionsを削除
    $('#sell_item_product_model_id').empty();
    // 新しくoptionに設定する値を取得
    var list = gon.models[instrument_id][$(this).val()];
    // ブランドidを設定
    brand_id = $(this).val();
    // 新しくoptionを生成する
    $.map(list,function(value,key){
      $('#sell_item_product_model_id').append($('<option>').val(key).text(value));
    });
  });

/* Drag and Dropのイベントを$wrapperに登録する */
  var $wrapper = $('#dropzoneWrapper')
    .on('dragenter', onDragEnter)
    .on('dragover', onDragOver)
    .on('dragleave', onDragLeave)
    .on('dragenter', onDragEnterDropZone)
    .on('dragleave', onDragLeaveDropZone)
    .on('drop', onDrop);

  // カーソルがdropzoneの上にあるか判定する用, エフェクトの切り替えに使用する
  var stateDropzone = false;

  /* 画面内にドラッグされたときエフェクトを追加する */
  function onDragEnter(e) {
    addEffect();
  }
  // dropzoneにカーソルが乗っているフラグを立てる
  function onDragEnterDropZone(e) {
    stateDropzone = true;
  }

  // dropzoneからカーソルが外れたフラグを立てる
  function onDragLeaveDropZone() {
    stateDropzone = false;
  }

  // ドラッグが画面外に行った場合にエフェクトを削除する
  function onDragLeave(e) {
    if(this === e.target && !stateDropzone) removeEffect();
  }

  // ドロップ可能なことを示す
  function onDragOver(e) {
    e.preventDefault();
    e.stopPropagation();
  }

  // ドロップされた際の処理
  function onDrop(e) {
    e.preventDefault();
    e.stopPropagation();
    var event = e.originalEvent;
    var file;
    var dataTransfer = event.dataTransfer;
    var fileObject = dataTransfer.files;

    // fileが存在しているときだけ処理する
    if ( dataTransfer.files.length !== 0) {
      file = dataTransfer.files[0];
      // ファイルタイプがjpegかpngの場合処理する
      if (file.type === 'image/jpeg' || file.type === 'image/png') {
        fileReader(file, fileObject);
      }
      else { alert('ドロップできるのは画像だけです。');}
    }
    else { alert('画像ファイルをドロップしてください。');}
    removeEffect();
  }

  // エフェクトを追加する
  function addEffect() {
    // $wrapper.addClass('ondragenter');
    $('#dropzoneWrapperInside').addClass('ondragenter');
  }

  // エフェクトを削除する
  function removeEffect() {
    // $('.ondragenter').removeClass('ondragenter');
    $('#dropzoneWrapperInside').removeClass('ondragenter');
  }

  /*
    画像ファイルを読み込む関数
    onDrop Functionの内部でcallされる
  */
  function fileReader(file, files) {
    var reader = new FileReader();
    // ファイルの読み込み
    reader.readAsDataURL(file);
    // ファイルの読み込み完了時の処理
    $(reader).on('load' , function(e) {
      // reader.resultにdataURIで画像のデータが入っている
      showImage(reader.result, files);
    });
  }

  /*
    アップされた画像ファイルを即時反映及び、新規画像投稿フォームの作成をする関数
    fileReader Functionの内部でcallされる
  */
  function showImage(image, files) {
    // アップされた画像ファイルを表示するためのimage要素を作成する
    var $img = $('<img>').attr({
      'src': image,
      'class': 'picture',
    });
    // 画像をDOMに追加する
    $("#file-wrapper").append($img);
    // 画像の情報をinputに格納する
    $("#file")[0].files = files;
    // いらなくなったidを削除する
    $("#file-wrapper").removeAttr("id", "file-wrapper");
    $("#file").removeAttr("id", "file");
    // 新しい画像アップローダーを追加するボタンをクリックする
    $("#add-picture-btn")[0].click();
    // labelの文字列を削除する
    $("#file-wrapper").text("");
    // console.log();
  }
})
