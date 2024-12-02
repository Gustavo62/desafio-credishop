import { Tooltip, Popover } from 'bootstrap'
import Chart from 'chart.js/auto'

import './add_jquery'
import "@nathanvda/cocoon";

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"

document.addEventListener("DOMContentLoaded", () => {
	const controllerName = document.body.dataset.controller

	if (controllerName) {
	  import(`controllers/${controllerName}_controller`)
		.then((module) => {
		  const Controller = module.default
		  const application = Application.start()
		  application.register(controllerName, Controller)
		  console.log(`${controllerName} carregado e registrado!`)
		})
		.catch((error) => {
		  console.error(`Erro ao carregar o controlador ${controllerName}:`, error)
		})
	}
	Array.from(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
		.forEach(tooltipTriggerEl => new Tooltip(tooltipTriggerEl));

	Array.from(document.querySelectorAll('[data-bs-toggle="popover"]'))
		.forEach(popoverTriggerEl => new Popover(popoverTriggerEl));
});