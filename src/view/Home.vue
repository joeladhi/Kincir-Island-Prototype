<template>
    <!-- navbar -->
    <NavVue :pos1="true" :pos2="false" :pos3="false" :pos4="false"/>

    <!-- 1st row -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-3 md:px-7 md:py-6">
       <div id="chart" class="rounded-lg shadow-md hover:shadow-lg transition duration-300">
         <LineChartVue/>
       </div>
       <div class="rounded-lg shadow-md hover:shadow-lg transition duration-300">
          <WindRoseVue/>
       </div>
    </div>

    <!-- 2nd row -->
    <div class="grid grid-cols-1 px-1 md:px-7 overflow-x-auto">
       <div class="px-5 md:px-10 md:py-5 md:mb-3 rounded-lg shadow-md hover:shadow-lg transition duration-300">
          <TableVue/>
       </div>
    </div>
</template>

<script>
import NavVue from "../components/Nav.vue";
import LineChartVue from "../components/LineChart.vue";
import WindRoseVue from "../components/WindRose.vue";
import TableVue from "../components/Table.vue";

export default({
    components: {
        WindRoseVue,
        LineChartVue,
        NavVue,
        TableVue
    }
})
</script>