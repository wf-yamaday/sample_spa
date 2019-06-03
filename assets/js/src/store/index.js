import Vue from 'vue'
import Vuex from 'vuex'
// modules
import bbs from './modules/bbs'

Vue.use(Vuex)

const store = new Vuex.Store({
    modules: {
        bbs
    }
})

export default store
