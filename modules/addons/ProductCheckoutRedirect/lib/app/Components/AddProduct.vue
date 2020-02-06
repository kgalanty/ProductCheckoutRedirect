<script>
Vue.component('AddProduct',
{
     
  data: function () {
    return {
        products: [],
        isLoading: false,
        pidToAdd: '',
        redirURL: '',
        isLoading: false
        }
  },
  mounted () {

     // this.isLoading = true;
      this.$store.dispatch('refreshProducts');
    // axios
      //.get('addonmodules.php?module=ProductCheckoutRedirect&c=API&action=getProducts&json=1')
      //.then(response => {
          //this.products = response.data;
          
         // this.isLoading = false;
          //}) 

  },
  methods: {
      addRedirection()
      {
          if(this.pidToAdd == "")
          {
              this.$buefy.toast.open({
                    duration: 5000,
                    message: `Product selection cannot be empty`,
                    position: 'is-bottom',
                    type: 'is-danger'
                })
              return;
          }
          if(this.redirURL.length == 0)
          {
              this.$buefy.toast.open({
                    duration: 5000,
                    message: `URL cannot be empty`,
                    position: 'is-bottom',
                    type: 'is-danger'
                })
              return;
          }

          this.isLoading = true;
          axios
                    .post('addonmodules.php?module=ProductCheckoutRedirect&c=API&action=add&json=1',
                    {
                        pid: this.pidToAdd,
                        redirurl: this.redirURL
                    })
                    .then(response => {
                       this.isLoading = false;
                      this.$buefy.toast.open({
                            message: 'Added successfuly!',
                            type: 'is-success'
                        });
                        this.pidToAdd = '';
                        this.redirURL = '';
                        this.$store.dispatch('refreshRedirs');
                        this.$store.dispatch('refreshProducts');
                        //this.$store.commit('addEntries', this.pidToAdd, this.redirurl);
                    })
      }
  },
template: `<nav class="level">

  <!-- Left side -->
  <div class="has-text-centered">
      <div class="field has-addons">
        <div class="select  is-medium" style="width:40%">
          <select v-model="pidToAdd" class="input" name="productSelect">
          <option disabled value="">Select a product</option>
          <option v-for="prod in $store.state.allProducts" :value="prod.id">{{prod.name}} (PID:{{prod.id}})</option>
          </select>
          <b-loading :is-full-page="false" :active.sync="isLoading" :can-cancel="false"></b-loading>
        </div>
        
        <div class="field"  style="width:40%">
          <div class="control">
            <input type="text" v-model="redirURL" class="input is-medium" placeholder="Redirect URL">
        </div>
        </div>
        <b-button :loading="isLoading" type="is-primary" outlined size="is-medium" @click="addRedirection">Add</b-button>
      </div>
  </div>
</nav>`
});
</script>