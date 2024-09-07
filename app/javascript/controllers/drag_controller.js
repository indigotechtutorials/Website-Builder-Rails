import { Controller } from "@hotwired/stimulus"
import { put } from "@rails/request.js"

// Connects to data-controller="drag"
export default class extends Controller {
  static values = { url: String, paramName: "data" }

  connect() {
    this.makingRequest = false
  }

  start(e) {
    let data = e.target.dataset.dragData
    e.dataTransfer.setData("text", data);
  }

  allowDrop(e) {
    e.preventDefault()
  }

  drop(e) {
    e.preventDefault()
    let data = e.dataTransfer.getData("text")
    console.log("Recieved data", data)
    if (this.hasUrlValue && data && !this.makingRequest) {
      this.makingRequest = true
      this.makeRequest(data)
    }
  }

  async makeRequest(data) {
    const body = {}
    body[this.paramNameValue] = data
    await put(this.urlValue, {
      body: body,
      responseKind: 'turbo-stream',
    })
    this.makingRequest = false
  }
}
