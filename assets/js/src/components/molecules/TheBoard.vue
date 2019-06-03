<template>
    <the-card :title="board.title">
        <the-card-content
            slot="content"
            :body="board.description"
        />
        <the-card-footer-item
            slot="footer"
            text="Opne"
            @click="click(board.id)"
         />
    </the-card>
</template>

<script>
import TheCard from '../atoms/TheCard'
import TheCardContent from '../atoms/TheCardContent'
import TheCardFooterItem from '../atoms/TheCardFooterItem'

export default {
    name: 'TheBoard',
    components: {
        TheCard,
        TheCardContent,
        TheCardFooterItem
    },
    props: {
        board: {
            type: Object,
            default() {
                return {
                    id: 1,
                    title: '掲示板',
                    description: 'サンプルです．'
                }
            }
        }
    },
    methods: {
        click(id) {
            this.$emit('click', id)
        }
    }
}
</script>
