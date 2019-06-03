<template>
    <div>
      {{ text }}
      <the-board-list/>
    </div>
</template>

<script>
import TheBoardList from './components/organisms/TheBoardList'

export default {
   name: 'app',
   components: {
       TheBoardList
   },
   props: {
       text: {
           type: String,
           default: 'Hello, Vue.js!'
       }
   }
}
</script>
