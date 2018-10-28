/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

console.log('Hello World from Webpacker')

import Rails from "rails-ujs"
Rails.start()

import Turbolinks from "turbolinks"
Turbolinks.start()

import * as ActiveStorage from "activestorage"
import "../src/direct_uploads"
ActiveStorage.start()

import "trix/dist/trix.css"
const Trix = require("trix")
Trix.config.blockAttributes.heading1.tagName = "h2"

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

const application = Application.start()
const context = require.context("controllers", true, /.js$/)
application.load(definitionsFromContext(context))

import "../src/map"
