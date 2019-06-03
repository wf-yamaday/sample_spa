<template>
    <a @click="click" class="card-footer-item">
        {{ text }}
    </a>
</template>

<script>
export default {
    name: 'TheCardFooterItem',
    props: {
        text: {
            type: String,
            default: 'リンク'
        }
    },
    methods: {
        click() {
            this.$emit('click')
        }
    }
}
</script>
