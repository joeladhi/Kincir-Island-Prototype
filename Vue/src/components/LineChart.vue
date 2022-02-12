<template>
<div id="chart" class="p-10">
  <VueApexCharts type="line" height="350" ref="chart1" :options="options" :series="series"></VueApexCharts>
</div>
</template>

<script>
import VueApexCharts from "vue3-apexcharts";
import axios from "axios";

export default {
  data: function() {
    return {
      interval: null,
      options: {
        title:{
              text: "Wind Speed",
            },
        xaxis: {
          categories: []
        }
      },
      series: []
    }
  },
  created(){
    this.interval = setInterval(this.getSensor, 5000)
  },
   mounted: function () {
        this.uChart()
    },
    methods: {
    uChart: function() {
        axios
            .get('http://192.168.1.5:8080/linechart')
            .then(response => {
                this.$refs.chart1.updateSeries([{
                    data: response.data.data.sensor
                }])
            });
        console.log(this.$refs.chart1);
    }
},
  components: {
    VueApexCharts
  },
}
</script>

<style scoped>

</style>
