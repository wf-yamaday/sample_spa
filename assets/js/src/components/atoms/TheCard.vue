<template>
    <div class="card">
        <header class="card-header">
             <p class="card-header-title">
                {{ title }}
             </p>
        </header>
        

        <div class="card-content">
            <slot name="content" />
        </div>

         <footer class="card-footer">
            <slot name="footer"/>
         </footer>
    </div>
</template>

<script>
export default {
    name: 'TheCard',
    props: {
        title: {
            type: String,
            default: 'タイトル'
        }
    }
}
</script>
