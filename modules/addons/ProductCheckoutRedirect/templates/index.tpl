<div id="app" class="appcontainer">
 <h2>
        Add New Product Redirection:
</h2>
    <Add-Product></Add-Product>
    <hr>
    
    <Products-table></Products-table>
</div>

{literal}
<script>
const store = new Vuex.Store({
state: {
        allProducts: [],
        entries: []
    },
    actions: {
        refreshRedirs (context) {
        axios
        .get('addonmodules.php?module=ProductCheckoutRedirect&c=API&json=1')
        .then(response => {
            //this.api = response.data;
            context.commit('setEntries', response.data);
            })
        },
        refreshProducts (context) {
        axios
        .get('addonmodules.php?module=ProductCheckoutRedirect&c=API&action=getProducts&json=1')
        .then(response => {
            //this.api = response.data;
            context.commit('setProducts', response.data);
            })
        }
  },
  mutations: {
        setProducts(state, prods)
        {
            state.allProducts = prods;
        },
        setEntries(state, entries)
        {
            state.entries = entries;
        },
        addEntries(state, pid, redirurl)
        {
            state.entries.push()
        }
   //this.$store.commit('showLoading', false);
  }
});
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
Vue.component('ProductsTable', {
 
  data: function () {
    return {
      api: [],
      saveLoading: false,
      isLoading: true,
      columns: [
        {
            field: 'pid',
            label: 'PID',
            width: '40',
            numeric: true
        },
        {
            field: 'name',
            label: 'Product Name',
        },
        {
            field: 'redirurl',
            label: 'Redirect URL',
        },
         {
            field: 'actions',
            label: 'Actions',
        },

    ]
    }
  },
  methods:
  {
      saveRedirects()
      {
          this.saveLoading = true;
          axios
                    .post('addonmodules.php?module=ProductCheckoutRedirect&c=API&action=store&json=1',
                    {
                        payload: this.$store.state.entries
                    })
                    .then(response => {
                       console.log(response);
                       this.saveLoading = false;
                      this.$buefy.toast.open({
                            message: 'Saved successfuly!',
                            type: 'is-success'
                        })
                    })

      },
      delRedirect(pid)
      {
       // this.loading[pid] = true;
                axios
                    .post('addonmodules.php?module=ProductCheckoutRedirect&c=API&action=delete&json=1',
                    {
                        payload: pid
                    })
                    .then(response => {
                       if(response.data == 'success')
                       {
                       this.$buefy.toast.open({
                            message: 'Deleted successfuly!',
                            type: 'is-success'
                        });
                  //     for( var i = 0; i < this.$store.state.entries.length; i++){ 
                   //    if ( this.$store.state.entries[i].pid === pid) {
                    //     this.$store.state.entries.splice(i, 1); 
                    //     this.$store.commit('setEntries', this.$store.state.entries);
                    //   }
                   // }
                   this.$store.dispatch('refreshRedirs');
                    this.$store.dispatch('refreshProducts');
                       }
                    })
      }
  },
   mounted () {
    axios
      .get('addonmodules.php?module=ProductCheckoutRedirect&c=API&json=1')
      .then(response => {
          //this.api = response.data;
          this.$store.commit('setEntries', response.data);
          this.isLoading = false;
          })

  },
  template: `<div><b-table :loading="this.isLoading" :data="this.$store.state.entries" :columns="columns"><template slot-scope="props">
                   <b-table-column field="pid">
                    <span>
                       {{ props.row.pid }}
                    </span>
                    </b-table-column>
                    <b-table-column field="name">
                    <span>
                       {{ props.row.name }}
                    </span></b-table-column>
                        <b-table-column field="redirurl">
                    <span>
                       <b-input v-model="props.row.redirurl"  size="is-medium"></b-input>
                    </span>
                    </b-table-column>
                     <b-table-column field="actions">
                    <span class="has-text-centered">
                    <b-button type="is-danger"
                        icon-right="delete" size="is-medium" @click="delRedirect(props.row.pid)">
                        Delete
                    </b-button>

                    </span>
                    </b-table-column>
                    </template>
                    <template slot="footer" v-if="api!=[]">
                        <div>
                            <b-button :loading="saveLoading" type="is-primary" outlined size="is-large" @click="saveRedirects">Save</b-button>
                        </div>
                    </template>
                    <template slot="empty">
                       
                        <p>Nothing here.</p>
            </template>
                </b-table-column>
                </b-table>
        </div>`
});

new Vue({ store, el: '#app' })

</script>

{/literal}