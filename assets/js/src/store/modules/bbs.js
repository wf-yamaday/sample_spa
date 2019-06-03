import Vue from 'vue'

export default {
    namespaced: true,
    state: {
        boards: []
    },
    getters: {
        boards: state => state.boards,
    },
    mutations: {
        setBoards(state, { boards }) {
            state.boards = boards
        }
    },
    actions: {
        async getBoards({ commit }) {
            await Vue.axios.get('/api/boards')
            .then(res => {
                commit('setBoards', {
                boards: res.data.data
                })
            })
            .catch(err => {
                throw err.response.status
            })
        }
     }
}
