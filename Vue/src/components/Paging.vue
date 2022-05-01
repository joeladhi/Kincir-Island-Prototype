<template>
  
    <div class="hidden sm:flex-1 sm:flex sm:items-center sm:justify-between">
      <div>
        <p class="text-sm text-gray-700">
          Showing
          {{ ' ' }}
          <span class="font-medium">1</span>
          {{ ' ' }}
          to
          {{ ' ' }}
          <span class="font-medium">{{sizePage()}}</span>
          {{ ' ' }}
          of
          {{ ' ' }}
          <span class="font-medium">{{sensorLength()}}</span>
          {{ ' ' }}
          results
        </p>
      </div>
      <div>
        <nav class="relative z-0 inline-flex rounded-md shadow-sm -space-x-px" aria-label="Pagination">
          <div v-if="totalPages() > 0" v-on:click="updatePage(currentPage - 1)">
            <a href="#" class="relative inline-flex items-center px-2 py-2 rounded-l-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
            <span class="sr-only">Previous</span>
            <ChevronLeftIcon class="h-5 w-5" aria-hidden="true" />
          </a>
          </div>
          
          <!-- Current: "z-10 bg-indigo-50 border-indigo-500 text-indigo-600", Default: "bg-white border-gray-300 text-gray-500 hover:bg-gray-50" -->
            <input v-if="showNext()" v-on:keyup.enter="updatePage(currentPage)" v-model="currentPage" type="text" class="z-10 bg-indigo-50  text-indigo-600 relative inline-flex items-center  px-1 py-0 border text-sm font-medium text-center" size="1" >
            <span class="z-10 text-indigo-600 relative inline-flex items-center px-4 py-2 border text-sm font-medium">{{ totalPages()}}</span>
          <div v-if="showNext()" v-on:click="updatePage(currentPage + 1)">
            <a href="#" class="relative inline-flex items-center px-2 py-2 rounded-r-md border border-gray-300 bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
              <span class="sr-only">Next</span>
              <ChevronRightIcon class="h-5 w-5" aria-hidden="true" />
            </a>
          </div>
        </nav>
      </div>
    </div>
</template>

<script>
import { ChevronLeftIcon, ChevronRightIcon } from '@heroicons/vue/solid'

export default {
  components: {
    ChevronLeftIcon,
    ChevronRightIcon,
  },
  props: ['sensors', 'currentPage', 'pageSize'],
  methods: {
    sensorLength(){
      return this.sensors.length
    },
    sizePage(){
      return this.pageSize
    },
    updatePage(pageNumber){
      return this.$emit('page:update', pageNumber)
    },
    totalPages(){
      return Math.ceil(this.sensors.length / this.pageSize)
    },
    showPrevious(){
      return this.currentPage == 0 ? false : true
    },
    showNext(){
      return this.currentPage == (this.totalPages() - 1) ? false : true
    }
  }
}
</script>