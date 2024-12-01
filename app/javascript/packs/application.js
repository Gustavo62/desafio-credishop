import { Tooltip, Popover } from 'bootstrap'
import Chart from 'chart.js/auto'

import './index';
import './add_jquery'
import "@nathanvda/cocoon";

import { Application } from "stimulus"
import { definitionsFromContext } from "stimulus/webpack-helpers"
import ProponentsController from "controllers/proponents_controller" // Importando o controller

const application = Application.start()
const context = require.context("controllers", true, /\.js$/)
application.load(definitionsFromContext(context))
