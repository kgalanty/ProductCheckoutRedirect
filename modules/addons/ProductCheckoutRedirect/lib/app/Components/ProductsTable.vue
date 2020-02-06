<script>
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

</script>