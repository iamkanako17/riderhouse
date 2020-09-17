if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const imageList = document.getElementById('image-list');

    const createImageHTML = (blob) => {
      // 画像を表示するためのdiv要素を生成
      const imageElement = document.createElement('div')
      imageElement.setAttribute('id', "image-element")
      let imageElementNum = document.querySelectorAll('#image-element').length

      // 表示する画像を生成(<img>要素を生成)
      const blobImage = document.createElement('img')
      blobImage.setAttribute('src', blob)
      blobImage.setAttribute('style', 'width: 200px; height: 200px;')

      // ファイル選択ボタンを設定(複数投稿の為に)
      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `lodging_image_${imageElementNum}`)
      inputHTML.setAttribute('name', 'lodging[images][]')
      inputHTML.setAttribute('type', 'file')

      // 生成したHTMLの要素をブラウザに表示させる(appendChildは指定した親要素の中に要素を追加するメソッド)
      imageElement.appendChild(blobImage)
      imageElement.appendChild(inputHTML)
      imageList.appendChild(imageElement)

      inputHTML.addEventListener('change',  (e) => {
        file = e.target.files[0];
        blob = window.URL.createObjectURL(file);

        createImageHTML(blob)
      })
    };

    document.getElementById('lodging_image').addEventListener('change', function(e) {
      
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);
      
      createImageHTML(blob);
    });
  });
}