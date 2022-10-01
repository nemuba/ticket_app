// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import FlashMessagesController from "./flash_messages_controller"
application.register("flash-messages", FlashMessagesController)

import FormSearchController from "./form_search_controller"
application.register("form-search", FormSearchController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import ModalController from "./modal_controller"
application.register("modal", ModalController)
