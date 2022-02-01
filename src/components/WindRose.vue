<template>
<div class="p-10">
  <VueApexCharts width="500" type="polarArea" :options="chartOptions" :series="series"></VueApexCharts>
</div>
</template>

<script>
import VueApexCharts from "vue3-apexcharts";

export default {
  data: function() {
    return {
     series: [14, 23, 21, 17, 15, 10, 12, 17, 21],
          chartOptions: {
            chart: {
              type: 'polarArea',
            },
            stroke: {
              colors: ['#fff']
            },
            fill: {
              opacity: 0.8
            },
            responsive: [{
              breakpoint: 480,
              options: {
                chart: {
                  width: 200
                },
                legend: {
                  position: 'bottom'
                }
              }
            }]
          }
          }
  },
  components: {
    VueApexCharts
  },
}
</script>



<style scoped>

</style>
