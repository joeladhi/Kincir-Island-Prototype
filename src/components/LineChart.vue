<template>
<div class="p-10">
  <VueApexCharts width="500" type="line" :options="options" :series="series"></VueApexCharts>
</div>
</template>

<script>
import VueApexCharts from "vue3-apexcharts";

export default {
  data: function() {
    return {
      options: {
        chart: {
          id: 'vuechart'
        },
        xaxis: {
          categories: [1991, 1992, 1993, 1994, 1995, 1996, 1997, 1998]
        }
      },
      series: [{
        name: 'series-1',
        data: [30, 40, 45, 50, 49, 60, 70, 91]
      }]
    }
  },
  components: {
    VueApexCharts
  },
}
</script>

<style scoped>

</style>
