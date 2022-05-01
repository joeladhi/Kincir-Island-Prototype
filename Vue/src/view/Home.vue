<template>
    <!-- navbar -->
    <NavVue :pos1="true" :pos2="false" :pos3="false" :pos4="false"/>


    <!-- 1st row - filter data-->
    <!-- <div class="grid grid-cols-1 px-1 mt-4 md:px-7">
       <div class="flex flex-row px-5 py-2 rounded-lg shadow-md hover:shadow-lg transition duration-300 bg-white">
          <div class="basis-2/12">
            <DropdownVue/>
          </div>
          <div class="mr-20">
            
          </div>
          <div class="basis-6/12 bg-black">
            <input type="date" class="bg-white rounded-md px-5 py-2 border border-slate hover:bg-slate-50 transition duration-300">
            to
            <input type="date" class="bg-white rounded-md px-5 py-2 border border-slate hover:bg-slate-50 transition duration-300">
          </div>
       </div>
    </div> -->
    <div class="grid">
      <div class="grid grid-cols-6 gap-4 px-1 py-3 md:mt-4 md:mx-7 md:px-7 rounded-lg shadow-md hover:shadow-lg transition duration-300 bg-white">
         <div class="">
            <DropdownVue/>
         </div>
         <div class="col-span-3 mx-5">
            <input type="date" class="bg-white rounded-md px-5 py-1.5 border border-slate hover:bg-slate-50 transition duration-300">
            to
            <input type="date" class="bg-white rounded-md px-5 py-1.5 border border-slate hover:bg-slate-50 transition duration-300">
         </div>
      </div>
    </div>

    <!-- 2nd row - line chart & wind rose -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-3 md:px-7 md:py-6">
       <div id="chart" class="rounded-lg shadow-md hover:shadow-lg transition duration-300 bg-white">
         <LineChartVue/>
       </div>
       <div class="rounded-lg shadow-md hover:shadow-lg transition duration-300 bg-white">
          <WindRoseVue/>
       </div>
    </div>

    <!-- 3rd row - table data -->
    <div class="grid grid-cols-1 px-1 md:px-7 overflow-x-auto">
       <div class="px-5 md:px-10 md:py-5 md:mb-3 rounded-lg shadow-md hover:shadow-lg transition duration-300 bg-white">
          <TableVue/>
       </div>
    </div>
</template>

<script>
import NavVue from "../components/Nav.vue";
import LineChartVue from "../components/LineChart.vue";
import WindRoseVue from "../components/WindRose.vue";
import TableVue from "../components/Table.vue";
import FilterVue from "../components/Filter.vue";
import DropdownVue from "../components/Dropdown.vue"

export default({
    components: {
        WindRoseVue,
        LineChartVue,
        NavVue,
        TableVue,
        FilterVue,
        DropdownVue
    }
})
</script>