// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require jquery.min.js
//= require jquery.turbolinks.js
//= require jquery_ujs

require('trix')
require('@rails/actiontext')


import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
// import "../stylesheets/application"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

import * as bootstrap from 'bootstrap'
import 'bootstrap-icons/font/bootstrap-icons.css'


document.addEventListener("DOMContentLoaded", function(event) {
  var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
  var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
  })

  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })
});

$(document).on('change', '#languages-select', function (){
  var lang = $(this).val()
  $.get('/?locale=' + lang)
})
require("trix")
require("@rails/actiontext")