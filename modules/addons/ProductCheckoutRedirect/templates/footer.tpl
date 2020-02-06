</div>
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
</script>
{$vueComponents}
<script>
new Vue({ store, el: '#app' })
</script>
</div>