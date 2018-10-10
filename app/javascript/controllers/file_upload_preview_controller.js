import { Controller } from "stimulus"

export default class extends Controller {

  static targets = ['fileField', 'filePreviewImage']

  showPreviewImage(event) {
    let preview = this.filePreviewImageTarget
    let file    = event.target.files[0]
    var reader  = new FileReader()

    reader.addEventListener("load", function () {
      preview.src = reader.result
    }, false)

    if (file) {
      reader.readAsDataURL(file)
    }
  }

  resetFileFieldValue(event) {
    let fileField = this.fileFieldTarget
    fileField.value = ''
  }

  resetPreviewImage(event) {
    let preview  = this.filePreviewImageTarget
    let original = preview.dataset.originalPhoto
    preview.src = original
  }
}
