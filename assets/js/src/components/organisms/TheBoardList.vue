<template>
    <div >
        <the-board
            v-for="board in boards"
            :key="board.id"
            :board="board"
        />
    </div>
</template>

<script>
import { mapGetters, mapActions } from 'vuex'

import TheBoard from '../molecules/TheBoard'

export default {
    name: 'TheBoardlist',
    components: {
        TheBoard
    },
    computed: {
        ...mapGetters({
            boards: 'bbs/boards'
        })
    },
    methods: {
        ...mapActions({
            getBoards: 'bbs/getBoards'
        })
    },
    created() {
        this.getBoards().catch(() => {
            console.error('Vuex Error')
        })
    }
}
</script>
