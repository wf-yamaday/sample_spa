<template>
    <div class="content">
        {{ body }}
    </div>
</template>

<script>
export default {
    name: 'TheCardContent',
    props: {
        body: {
            type: String,
            default: 'コンテンツ'
        }
    }
}
</script>
