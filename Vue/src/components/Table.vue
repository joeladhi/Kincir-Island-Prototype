<template>

    <div class="flex flex-col">
  <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
    <div class="py-2 inline-block min-w-full sm:px-6 lg:px-8">
      <div class="overflow-x-auto">
        <div class="flex justify-between pb-5">
          <h1 class="text-left font-bold text-xl">Wind Speed Table</h1>
            <button
            @click="csvExport(csvData)" 
            class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-0 px-4 rounded">
            Download as .csv
            </button>
        </div>
        <table class="min-w-full">
          <thead class="bg-first border-b">
            <tr>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4">No</th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4">Wind Direction</th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4">Wind Speed</th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4">Timestamp</th>
            </tr>
          </thead>
          <tbody>
             <tr v-for="(td, index) in sensors.slice(this.currentPage * this.pageSize, (this.currentPage * this.pageSize) + this.pageSize)"
                v-bind:key="index"  
             class="border-b">
                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900" v-text="td.id_sensor"></td>
                <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">{{ td.wind_direction_sensor }}</td>
                <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">{{ td.wind_speed_sensor }}</td>
                <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">{{ td.timestamp_sensor }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<PagingVue
v-bind:sensors="sensors"
v-on:page:update="updatePage"
:currentPage="currentPage"
:pageSize="pageSize"
/>   
</template>

<script>
import axios from "axios";
import PagingVue from "./Paging.vue";

export default {
  name: 'Table',
  data() {
    return {
      currentPage: 0,
      pageSize: 10,
      visibleSensors: [],
      sensors: [],
      interval: null,
      users: [],
    };
  },
  components: {
    PagingVue,
},
  created(){
    this.interval = setInterval(this.getSensor, 5000)
  },
   computed: {
    csvData() {
      return this.sensors.map(item => ({
        ...item
      }));
    }
  },
  methods: {
    getSensor(){
      axios.get('http://192.168.1.72:8080/dashboard')
      .then( res => { 
        this.sensors = res.data.data.sensor.reverse()})
        .catch(error=>{
            console.log(error)
        })
    },
    updatePage(pageNumber){
      this.currentPage = pageNumber,
      this.updateVisibleSensors();
    },
    updateVisibleSensors(){
      this.visibleSensors = this.sensors.slice(this.currentPage * this.pageSize, (this.currentPage * this.pageSize) + this.pageSize);
      if(this.visibleSensors.length == 0 && this.currentPage > 0){
        this.updatePage(this.currentPage - 1);
      }
    },
    csvExport(arrData) {
      let csvContent = "data:text/csv;charset=utf-8,";
      csvContent += [
        Object.keys(arrData[0]).join(";"),
        ...arrData.map(item => Object.values(item).join(";"))
      ]
        .join("\n")
        .replace(/(^\[)|(\]$)/gm, "\n");

      const data = encodeURI(csvContent);
      const link = document.createElement("a");
      link.setAttribute("href", data);
      link.setAttribute("download", "export.csv");
      link.click();
    }
  },
  mounted(){
    this.getSensor();
  }
};
</script>

<style>
.bg-first{
    background: #E2EBF3
}
.bg-second{
    background: #F8FAFC;
}
</style>