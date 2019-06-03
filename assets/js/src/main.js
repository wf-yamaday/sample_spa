import Vue from 'vue'
import App from './App'

import Buefy from 'buefy'
import 'buefy/dist/buefy.css'

import store from './store'
import axios from 'axios'

Vue.axios = axios

Vue.use(Buefy)

new Vue({
  el: '#app',
  store,
  template: '<App/>',
  components: { App }
})
